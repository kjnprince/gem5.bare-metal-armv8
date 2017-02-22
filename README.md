# gem5.bare-metal-armv8
Having some mistakes now!
This project is modified from two respository:
  https://github.com/tukl-msd/gem5.bare-metal.git
  https://github.com/freedomtan/aarch64-bare-metal-qemu.git
I want to implement running an armv8 binary in gem bare-metal model.

I find the respository https://github.com/tukl-msd/gem5.bare-metal.git, and successfully running armv7 binary in gem5 bare-matal model. Searching in Internet, I have no idea how to implement my purpose. So I ask Dr.myzinsky in github. Thanks for Dr.myzinsky's help! Dr.myzinsky give me the second repository.

I have made modifying based those resposities as follow:

  1.startup64.s 
    .= 0x80080000
  2.syscalls.c
    UART0DR = (unsigned int *)0x1c090000
  3.Makefile
    CROSS_Compiler = aarch64-elf-
    some compiler options...
    
The project can be successfully compiled. But running in gem5 have mistakes:
************************************************************
Global frequency set at 1000000000000 ticks per second
warn: DRAM device capacity (8192 Mbytes) does not match the address range assigned (256 Mbytes)
info: kernel located at: /mnt/hdd2/kjn/gem5_0220/img/gem5.bare-metal/Simple/test64.elf
Listening for system connection on port 5900
Listening for system connection on port 3456
0: system.remote_gdb.listener: listening for remote gdb #0 on port 7000
**** REAL SIMULATION ****
warn: Existing EnergyCtrl, but no enabled DVFSHandler found.
info: Entering event queue @ 0.  Starting simulation...
warn: Device system.membus.badaddr_responder accessed by write to address 0xfffffff0 size=4 data=0
gem5.opt: build/ARM/cpu/simple/atomic.cc:466: virtual Fault AtomicSimpleCPU::writeMem(uint8_t*, unsigned int, Addr, unsigned int, uint64_t*): Assertion `!pkt.isError()' failed.
******************************************************************
I don't know the mistakes reason. Searching in Internet, someone have the same problems. 
someone say "The problem is almost certainly an incompatible kernel and machine-type being specified."
Is this problems due to compiler's options?

My gems options are:
./build/ARM/gem5.opt -d ./test ./configs/example/fs.py --bare-metal --disk-image=/mnt/hdd2/kjn/gem5_0220/img/gem5.bare-metal/common/fake.iso --kernel=/mnt/hdd2/kjn/gem5_0220/img/gem5.bare-metal/Simple/test64.elf --machine-type=VExpress_EMM64 --dtb-filename=none --mem-size=256MB











