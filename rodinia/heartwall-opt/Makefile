
ifdef OUTPUT
override OUTPUT = -DOUTPUT
endif

include ../common/make.config

# link objects(binaries) together
heartwall: main.o ./AVI/avilib.o ./AVI/avimod.o 
	$(CUDA_DIR)/bin/nvcc main.o ./AVI/avilib.o ./AVI/avimod.o -I$(CUDA_DIR)/include -lm -o heartwall

# compile main function file into object (binary)
main.o: main.cu kernel.cu define.c
	$(CUDA_DIR)/bin/nvcc -lineinfo $(OUTPUT) $(KERNEL_DIM) main.cu -I./AVI -c -O3

./AVI/avilib.o ./AVI/avimod.o:
	cd AVI; make;

# delete all object files
clean:
	rm -f *.o AVI/*.o heartwall *.linkinfo *.qdrep *.sqlite
