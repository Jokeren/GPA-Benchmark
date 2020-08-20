# GPA-Benchmark
Benchmark applications for GPU Performance Advisor

### Experimental Result

**Platform:** Volta V100

| Application            	| Kernel                     	| Optimization                 	| Original 	| Optimized 	| Speedup 	| Estimate Speedup 	| Error 	|
|------------------------	|----------------------------	|------------------------------	|----------	|-----------	|---------	|------------------	|-------	|
| rodinia/backprop       	| bpnn_layerforward_CUDA     	| Warp Balance                 	| 18.1us   	| 15.3us    	| 1.18x   	| 1.15x            	| 3%    	|
| rodinia/backprop       	| bpnn_layerforward_CUDA     	| Strength Reduction           	| 15.3us   	| 12.6us    	| 1.21x   	| 1.12x            	| 7%    	|
| rodinia/bfs            	| Kernel                     	| Loop Unrolling               	| 568.0us  	| 522.0us   	| 1.08x   	| 1.11x            	| 3%    	|
| rodinia/b+tree         	| findRangeK                 	| Code Reorder                 	| 53.2us   	| 46.4us    	| 1.15x   	| 1.31x            	| 14%   	|
| rodinia/cfd            	| cuda_compute_flux          	| Function Inlining            	| 187.5ms  	| 128.3ms   	| 1.46x   	| 1.37x            	| 6%    	|
| rodinia/gaussian       	| Fan2                       	| Thread Increase              	| 116.7ms  	| 30.2ms    	| 3.86x   	| 3.33x            	| 14%   	|
| rodinia/heartwall      	| kernel                     	| Loop Unrolling               	| 49.0ms   	| 42.3ms    	| 1.16x   	| 1.17x            	| 1%    	|
| rodinia/hotspot        	| calculate_temp             	| Strength Reduction           	| 15.4us   	| 13.4us    	| 1.15x   	| 1.17x            	| 2%    	|
| rodinia/huffman        	| vlc_encode_kernel_sm64huff 	| Warp Balance                 	| 133.2us  	| 121.5us   	| 1.10x   	| 1.22x            	| 9%    	|
| rodinia/kmeans         	| kmeansPoint                	| Loop Unrolling               	| 787.1us  	| 700.7us   	| 1.12x   	| 1.21x            	| 8%    	|
| rodinia/lavaMD         	| kernel_gpu_cuda            	| Loop Unrolling               	| 4.0ms    	| 3.6ms     	| 1.11x   	| 1.12x            	| 1%    	|
| rodinia/lud            	| lud_diagonal               	| Code Reorder                 	| 221.8us  	| 162.9us   	| 1.36x   	| 1.35x            	| 1%    	|
| rodinia/myocyte        	| solver_2                   	| Function Inlining            	| 308.5ms  	| 259.6ms   	| 1.19x   	| 1.19x            	| 0%    	|
| rodinia/myocyte        	| solver_2                   	| Function Spliting            	| 259.6ms  	| 254.4ms   	| 1.02x   	| 1.03x            	| 1%    	|
| rodinia/nw             	| needle_cuda_shared_1       	| Code Reorder                 	| 840.7us  	| 762.7us   	| 1.10x   	| 1.09x            	| 1%    	|
| rodinia/particlefilter 	| kernel                     	| Block Increase               	| 2.3ms    	| 1.2ms     	| 1.92x   	| 1.93x            	| 1%    	|
| rodinia/streamcluster  	| kernel_compute_cost        	| Block Increase               	| 21.5ms   	| 14.1ms    	| 1.52x   	| 1.51x            	| 1%    	|
| rodinia/sradv1         	| reduce                     	| Warp Balance                 	| 2.01ms   	| 1.95ms    	| 1.03x   	| 1.03x            	| 0%    	|
| rodinia/pathfinder     	| dynproc_kernel             	| Code Reorder                 	| 93.4us   	| 88.6us    	| 1.05x   	| 1.23x            	| 17%   	|
| Quicksilver            	| CycleTrackingKernel        	| Function Inlining            	| 1.18s    	| 1.05s     	| 1.12x   	| 1.18x            	| 5%    	|
| Quicksilver            	| CycleTrackingKernel        	| Register Reuse               	| 1.05s    	| 1.02s     	| 1.03x   	| 1.03x            	| 0%    	|
| ExaTENSOR              	| tensor_transpose           	| Strength Reduction           	| 5.46ms   	| 5.08ms    	| 1.07x   	| 1.07x            	| 0%    	|
| ExaTENSOR              	| tensor_transpose           	| Memory Transaction Reduction 	| 5.08ms   	| 4.91ms    	| 1.03x   	| 1.02x            	| 1%    	|
