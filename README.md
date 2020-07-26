# GPA-Benchmark
Benchmark applications for GPU Performance Advisor

### Experimental Result

**Platform:** Volta V100

|    Application    | Kernel |    Optimization    | Original | Optimized | Speedup | Estimate Speedup | Error | Input |
|:-----------------:|:------:|:------------------:|:--------:|:---------:|:-------:|:----------------:|:-----:|:-----:|
|  rodinia/backprop |        |     Remove Sync    |  18.1us  |   15.3us  |  1.18x  |       1.15x      |   3%  |       |
|  rodinia/backprop |        | Strength Reduction |  15.3us  |   12.6us  |  1.21x  |       1.12x      |   7%  |       |
|    rodinia/bfs    |        |   Loop Unrolling   |  568.0us |  522.0us  |  1.08x  |       1.11x      |   3%  |       |
|   rodinia/b+tree  |        |    Code Reorder    |  53.2us  |   46.4us  |  1.15x  |       1.31x      |  14%  |       |
|    rodinia/cfd    |        |  Function Inlining |  187.5ms |  128.3ms  |  1.46x  |       1.37x      |   6%  |       |
|  rodinia/gaussian |        |   Thread Increase  |  116.7ms |   30.2ms  |  3.86x  |       3.33x      |  14%  |       |
| rodinia/heartwall |        |   Loop Unrolling   |  49.0ms  |   42.3ms  |  1.16x  |       1.17x      |   1%  |       |
|  rodinia/hotspot  |        | Strength Reduction |  15.4us  |   13.4us  |  1.15x  |       1.17x      |   2%  |       |
