#include <cuda_runtime.h>
#include <cuda.h>
#include <cuda_pipeline.h>

using namespace nvcuda::experimental;


#define TILE_SIZE 5900
#define NTHREADS 512

__global__
void tensor_transpose(int dim_input, int dim_output, int nblocks, int tile_size,
  double *input, double *output) {
  pipeline pipe;
  extern __shared__ double tile[];
  int block_idx = blockIdx.x;
  int iters = 0;
  int phase = 0;

  for (int i = threadIdx.x; i < tile_size; i += blockDim.x) {
    memcpy_async(tile[phase * TILE_SIZE + i], input[i + block_idx * tile_size], pipe);
  }
  pipe.commit();

  for (; block_idx < nblocks; block_idx += gridDim.x) {
    ++iters;
    int it = block_idx, im = 0, offset1 = 0;

    if (block_idx + gridDim.x < nblocks) {
      int p = 1 - phase;
      for (int i = threadIdx.x; i < tile_size; i += blockDim.x) {
        memcpy_async(tile[p * TILE_SIZE + i], input[i + (block_idx + gridDim.x) * tile_size], pipe);
      }
      pipe.commit();
    }
    
    for (int i = 0; i < dim_input; i++) {
      im = it * d_shape_input_r[i];
      offset1 += d_stride_input[i] * (it - im * d_shape_input[i]);
      it = im;
    }

    pipe.wait(iters - 1);
    __syncthreads();
  
    for (int i = threadIdx.x; i < tile_size; i += blockDim.x) {
      it = i;
      int offset2 = 0, local_offset = 0;
      for (int j = 0; j < dim_output; j++) {
        im = it * d_shape_output_r[j];
        int tmp = it - im * d_shape_output[j];
        offset2 += d_stride_output_global[j] * tmp;
        local_offset += d_stride_output_local[j] * tmp;
        it = im;
      }
      output[offset1 + offset2] = tile[phase * TILE_SIZE + local_offset];
    }

    phase = 1 - phase;
    __syncthreads();
  }
}
