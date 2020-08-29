# GPA-Benchmark
Benchmark applications for GPU Performance Advisor

### Experimental Result

**Platform:** Volta V100

|       Application      	|           Kernel           	|         Optimization         	| Original 	| Optimized 	| Speedup 	| Estimate Speedup 	| Error 	|
|:----------------------:	|:--------------------------:	|:----------------------------:	|:--------:	|:---------:	|:-------:	|:----------------:	|:-----:	|
|    rodinia/backprop    	|   bpnn_layerforward_CUDA   	|         Warp Balance         	|  18.10us 	|  15.36us  	|  1.18x  	|       1.21x      	|   3%  	|
|    rodinia/backprop    	|   bpnn_layerforward_CUDA   	|      Strength Reduction      	|  15.32us 	|  12.63us  	|  1.21x  	|       1.13x      	|   7%  	|
|       rodinia/bfs      	|           Kernel           	|        Loop Unrolling        	| 578.28us 	|  508.54us 	|  1.14x  	|       1.59x      	|  39%  	|
|     rodinia/b+tree     	|         findRangeK         	|         Code Reorder         	|  53.29us 	|  46.40us  	|  1.15x  	|       1.28x      	|  11%  	|
|       rodinia/cfd      	|      cuda_compute_flux     	|           Fast Math          	| 187.53ms 	|  128.37ms 	|  1.46x  	|       1.54x      	|   5%  	|
|    rodinia/gaussian    	|            Fan2            	|        Thread Increase       	| 116.76ms 	|  30.21ms  	|  3.86x  	|       3.33x      	|  14%  	|
|    rodinia/heartwall   	|           kernel           	|        Loop Unrolling        	|  49.03ms 	|  42.35ms  	|  1.16x  	|       1.15x      	|   1%  	|
|     rodinia/hotspot    	|       calculate_temp       	|      Strength Reduction      	|  15.45us 	|  13.40us  	|  1.15x  	|       1.10x      	|   4%  	|
|     rodinia/huffman    	| vlc_encode_kernel_sm64huff 	|         Warp Balance         	| 133.24us 	|  121.59us 	|  1.10x  	|       1.17x      	|   6%  	|
|     rodinia/kmeans     	|         kmeansPoint        	|        Loop Unrolling        	| 787.14us 	|  700.73us 	|  1.12x  	|       1.21x      	|   8%  	|
|     rodinia/lavaMD     	|       kernel_gpu_cuda      	|        Loop Unrolling        	|  4.07ms  	|   3.61ms  	|  1.11x  	|       1.12x      	|   1%  	|
|       rodinia/lud      	|        lud_diagonal        	|         Code Reorder         	| 221.81us 	|  162.96us 	|  1.36x  	|       1.48x      	|   9%  	|
|     rodinia/myocyte    	|          solver_2          	|           Fast Math          	| 308.55ms 	|  259.63ms 	|  1.19x  	|       1.13x      	|   5%  	|
|     rodinia/myocyte    	|          solver_2          	|       Function Spliting      	| 259.69ms 	|  254.47ms 	|  1.02x  	|       1.03x      	|   1%  	|
|       rodinia/nw       	|    needle_cuda_shared_1    	|         Warp Balance         	| 840.70us 	|  762.70us 	|  1.10x  	|       1.09x      	|   1%  	|
| rodinia/particlefilter 	|      likelihood_kernel     	|        Block Increase        	|  2.34ms  	|   1.21ms  	|  1.92x  	|       1.93x      	|   1%  	|
|  rodinia/streamcluster 	|     kernel_compute_cost    	|        Block Increase        	|  21.51ms 	|  14.17ms  	|  1.52x  	|       1.46x      	|   4%  	|
|     rodinia/sradv1     	|           reduce           	|         Warp Balance         	|  2.01ms  	|   1.95ms  	|  1.03x  	|       1.16x      	|  13%  	|
|   rodinia/pathfinder   	|       dynproc_kernel       	|         Code Reorder         	|  93.48us 	|  88.67us  	|  1.05x  	|       1.23x      	|  17%  	|
|       Quicksilver      	|     CycleTrackingKernel    	|       Function Inlining      	|   1.18s  	|   1.05s   	|  1.12x  	|       1.18x      	|   5%  	|
|       Quicksilver      	|     CycleTrackingKernel    	|        Register Reuse        	|   1.05s  	|   1.02s   	|  1.03x  	|       1.04x      	|   1%  	|
|        ExaTENSOR       	|      tensor_transpose      	|      Strength Reduction      	|  5.46ms  	|   5.08ms  	|  1.07x  	|       1.06x      	|   1%  	|
|        ExaTENSOR       	|      tensor_transpose      	| Memory Transaction Reduction 	|  5.08ms  	|   4.91ms  	|  1.03x  	|       1.05x      	|   2%  	|
|        PeleC            | pc_expl_reactions           |         Block Increase        |  440.12ms |   370.34ms |  1.19x   |       1.23x       |   3%   |
|        Minimod          | target_pml_3d               |         Fast Math             |  89.12ms  |   86.31ms |  1.03x   |       1.09x       |   6%   |
|        Minimod          | target_pml_3d               |         Code Reorder          |  86.31ms  |   82.07ms |  1.05x   |       1.10x       |   5%   |
