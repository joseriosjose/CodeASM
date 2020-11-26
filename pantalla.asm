section .data

   mensaje1 db "e",83,"te es el mensaje1",37,"$ y es distinto de otro",10
   longitud1 equ $-mensaje1

   mensaje2 DB 9,37,"mensaje tytytct 2",208,0xD,0xa
   longitud2 equ $-mensaje2

 section .text

global _start       ;para el linker
_start:		    ;marca la entrada
	   mov eax, 4		;llamada al sistema (sys_write)
	   mov ebx, 1		;descripcion de archivo (stdout)
	   mov ecx, mensaje1		;msg a escribir
	   mov edx, longitud1		;longitud del mensage
	   int 0x80			;llama al sistema interrucciones


	   mov eax, 4		;llamada al sistema (sys_write)
	   mov ebx, 1		;descripcion de archivo (stdout)
	   mov ecx, mensaje2		;msg a escribir
	   mov edx, longitud2		;longitud del mensage
	   int 0x80			;llama al sistema interrucciones



	   mov eax, 1		;llamada al sistema (sys_exit)
	   int 0x80
