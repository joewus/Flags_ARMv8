#
# Linux makefile
# Use with make 
#

.SUFFIXES: .o .asm .c

AS=as
ASFLAGS= -g -o
CFLAGS= -g -march=armv8-a
CC=gcc


.asm.o:
	$(AS) $(ASFLAGS) $*.o $*.asm -al=$*.lst


.c.o:
	$(CC) -c $(CFLAGS) $*.c

all: Flags

Flags : flags.o flags_asm.o 
	$(CC) $(CFLAGS) -o Flags flags.o flags_asm.o


flags_asm.o : flags_asm.asm


flags.o : flags.c


clean :
	rm *.o
	rm *.lst
	rm Flags
debug :
	gdb ./Flags -x gdb_command

