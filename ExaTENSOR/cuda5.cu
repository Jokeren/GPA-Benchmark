#include <cuda_runtime.h>
#include <cuda.h>
#include <cuda_pipeline.h>

__global__
void tensor_transpose(int dim_input, int dim_output, int nblocks, int tile_size,
  double *input, double *output) {
  extern __shared__ double tile[];
  int block_idx = blockIdx.x;
  int phase = 0;

  for (int i = threadIdx.x; i < tile_size; i += blockDim.x) {
    __pipeline_memcpy_async(&tile[phase * TILE_SIZE + i], &input[i + block_idx * tile_size], sizeof(double));
  }
  __pipeline_commit();

  for (; block_idx < nblocks; block_idx += gridDim.x) {
    int it = block_idx, im = 0, offset1 = 0;

    if (block_idx + gridDim.x < nblocks) {
      int p = 1 - phase;
      for (int i = threadIdx.x; i < tile_size; i += blockDim.x) {
        __pipeline_memcpy_async(&tile[p * TILE_SIZE + i], &input[i + (block_idx + gridDim.x) * tile_size], sizeof(double));
      }
      __pipeline_commit();
    }
    
    for (int i = 0; i < dim_input; i++) {
      im = it * d_shape_input_r[i];
      offset1 += d_stride_input[i] * (it - im * d_shape_input[i]);
      it = im;
    }

    if (block_idx + gridDim.x < nblocks) {
      __pipeline_wait_prior(1);
    } else {
      __pipeline_wait_prior(0);
    }
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
