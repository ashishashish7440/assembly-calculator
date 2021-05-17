
%include "asm_io.inc"
segment .data 
num1 db "enter a first num ", 0
num2 db "enter a second num", 0

result db "your result is: ", 0
	
can db "what do you want to do// 0 for sum // 1 for sub // 2 for multiplY// 3 for divide: ", 0

quotient db "your quotient is :", 0

reminder db "reminder is :",0

thanks db "thanks for using <3 ", 0

agan db "do you want to run again // press 10 for run again : ", 0 ; why agan not again
		

wrong db "you entered a wrong key", 0

segment .bss 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
		mov eax, num1
		call print_string
		call read_int
		mov ecx, eax
		
		mov eax, num2
		call print_string
		call read_int	
		mov ebx, eax
		
		mov eax, can
		call print_string
		call read_int	
		
		cmp eax, 0
		jz sum
		
		cmp eax, 1
		jz sub
			
		cmp eax, 2
		jz mul
		
		cmp eax, 3
		jz div
		
		mov eax, wrong
		call print_string
		call print_nl
		jmp again
		
sum:		
		
     		mov eax, result
		call print_string
		mov eax, ecx
		call print_int
		call print_nl
		jmp again

sub:
		mov eax, result
		call print_string
		mov eax, ecx
		sub eax, ebx
		call print_int
		call print_nl
		jmp again

mul:	
		mov eax, result
		call print_string
	
		mov eax, ecx		
		mul eax
		call print_int
		call print_nl
		jmp again


div:
		mov eax, quotient
		call print_string
		mov eax, ecx	
		mov edx, 0
		div eax
		call print_int
		call print_nl
		mov eax, reminder
		call print_string
		
		mov eax, edx
		call print_int
		call print_nl
		jmp again

again:  
		mov eax, agan
		call print_string
		call read_int
		cmp eax, 10
		jz asm_main
		jmp done

done:

	
		mov eax, thanks
		call print_string
		
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
