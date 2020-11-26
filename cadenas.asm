section .data

msg  db "esta es una cadena",10,13
longitud equ $-msg

msg2  db 13,10,"esta es otra cadena",94,0xD,0Xa,13,10,13,10,13,10
longitud2 equ $-msg2


section .text

global _start       ;para el linker
_start:		    ;marca la entrada
	   mov eax, 4		;llamada al sistema (sys_write)
	   mov ebx, 1		;descripcion de archivo (stdout)
	   mov ecx, msg		;msg a escribir
	   mov edx, longitud		;longitud del mensage
	   int 0x80			;llama al sistema interrucciones


	   mov eax, 4		;llamada al sistema (sys_write)
	   mov ebx, 1		;descripcion de archivo (stdout)
	   mov ecx, msg2		;msg a escribir
	   mov edx, longitud2		;longitud del mensage
	   int 0x80			;llama al sistema interrucciones



	   mov eax, 1		;llamada al sistema (sys_exit)
	   int 0x80
