all: ganta
ganta: ganta.o asm_io.o
	gcc -m32 -o $@ $+ $(HOME)/templateMake/driver.c

ganta.o: ganta.asm 
	nasm -f elf ganta.asm -o ganta.o

asm_io.o: $(HOME)/templateMake/asm_io.asm 
	nasm -f elf -d ELF_TYPE $(HOME)/templateMake/asm_io.asm -o asm_io.o

clean:
	rm ganta *.o
