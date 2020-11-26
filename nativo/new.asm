;nasm -f obj hola.asm -o hola.obj
;link hola.obj;

[BITS 16]           	; Set 16 bit code generation
	SEGMENT junk  		; Segment containing code

  	..start:            	; The two dots tell the linker to Start Here.
	mov  ax,data      ; Move segment address of data segment into AX
	mov  ds,ax        ; Copy address from AX into DS
	mov  es,ax	  ;
	mov  ax,stack     ; Move segment address of stack segment into AX
	mov  ss,ax        ; Copy address from AX into SS

	mov  sp,stacktop  ; Point SP to the top of the stack

	;==============================|
	; MAIN 			       |
	;==============================|

	Inicio:
;-----------  imprimir en pantalla el mensaje msg
mov dx, msg
mov ah,0x9      	; funcion 9, imprimir en pantalla
int 0x21

;-----------  imprimir en pantalla el mensaje num1
mov dx, num1
mov ah,0x9      	; funcion 9, imprimir en pantalla
int 0x21

;-----lectura de teclado usando interrupcion de la bios
xor ah,ah		;asignar a ah el valor de 0
int 0x16		; el dato se guarda en al

;------ imprimir lo que esta en al
mov ah,	0x0E		; imprimir lo que esta en al
int 0x10

; --- paso al a otro registro y despues a un numero decimal
mov bl, al
sub bl, 30h

;-----------  imprimir en pantalla el mensaje num2
mov dx, num2
mov ah,0x9      	; funcion 9, imprimir en pantalla
int 0x21

;-----lectura de teclado usando interrupcion de la bios
xor ah,ah		;
int 0x16		; el dato se guarda en al

;------ imprimir lo que esta en al
mov ah,	0x0E		; imprimir lo que esta en al
int 0x10

sub al, 30h

div bl
mov bl,al

sub bl,3
;-----------  imprimir en pantalla el mensaje num3
mov dx, num3
mov ah,0x9      	; funcion 9, imprimir en pantalla
int 0x21

;-----lectura de teclado usando interrupcion de la bios
xor ah,ah		;
int 0x16		; el dato se guarda en al

;------ imprimir lo que esta en al
mov ah,	0x0E		; imprimir lo que esta en al
int 0x10

mul bl



; ------impresion en pantalla del letrero
mov dx, letrero
mov ah,0x9      	; funcion 9, imprimir en pantalla
int 0x21

;------ imprimir lo que esta en al
mov ah,	0x0E		; imprimir lo que esta en al
int 0x10

Fin:
	mov ax, 04C00H  	; salir
	int 21H         	; fin de programa


SEGMENT data
	msg	db "Formula ((a/b)-3)*c",0x0a,"$"
	num1	db 0x0a,"numero 1",0x0a,"$"
	num2	db 0x0a,"numero 2",0x0a,"$"
	num3	db 0x0a,"numero 3",0x0a,"$"

	letrero	db 0x0a,"resultado :",0x0a,"$"

	OperA  DB "0000000000000000000000000$"

  SEGMENT stack stack 	; This means a segment of *type* "stack"
                            	; that is also *named* "stack"! Some
                            	; linkers demand that a stack segment
                            	; have the explicit type "stack"
	resb 1024      		; Reserve 64 bytes for the program stack
    	stacktop:          	; It's significant that this label points to