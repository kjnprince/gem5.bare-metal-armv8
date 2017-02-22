#osname := $(shell uname -s)

#use Android toolchain on OS X
#use linaro bare metal toolchain on linux
#ifeq ($(osname), Darwin)
#CROSS_PREFIX=aarch64-linux-android-
#else
CROSS_PREFIX=aarch64-elf-
#endif

all: test64.elf

test64.o: test64.c
	$(CROSS_PREFIX)gcc -g -O0 -lunistd -I . -c $< -o $@

startup64.o: startup64.s
	$(CROSS_PREFIX)cpp $< -g -O0 -lunistd -I . | $(CROSS_PREFIX)as -EL -c  -o $@

syscalls.o:syscalls.c
	$(CROSS_PREFIX)gcc -g -O0 -lunistd -I . -c $< -o $@

test64.elf: test64.o startup64.o syscalls.o
	$(CROSS_PREFIX)gcc -nostartfiles -Xlinker  -Ttest64.ld $^ -o $@

test64.bin: test64.elf
	$(CROSS_PREFIX)objcopy -O binary $< $@

clean:
	rm -f test65.bin test64.elf startup64.o test64.o syscalls.o
