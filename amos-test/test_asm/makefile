# asm one don't work on AmigaOS4, we need to use VBCC (vasm)

enable=.enable
disable=.disable

include makefile.cfg

all:	pload_test.exe
	
clean:


pload_test.exe: pload_test.s
		$(compiler) $(test_options) -Iinclude -Fvobj -o pload_test.o pload_test.s 
		c/vlink  -bamigahunk -o pload_test.exe -s  pload_test.o

