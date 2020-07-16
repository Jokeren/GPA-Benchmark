# GPA-Benchmark
Benchmark applications for GPU Performance Advisor

### Experimental Result

**Platform:** Volta V100

|    Application   |    Optimization    | Original | Optimized | Speedup | Estimate Speedup | Error |
|:----------------:|:------------------:|:--------:|:---------:|:-------:|:----------------:|:-----:|
| rodinia/backprop |     Remove Sync    |  18.1us  |   15.3us  |  1.18x  |       1.15x      |   3%  |
| rodinia/backprop | Strength Reduction |  15.3us  |   12.6us  |  1.21x  |       1.12x      |   7%  |
