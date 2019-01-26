FORMAT MZ
HEAP 0

include 'struct.asm'



; stack
segment STACK16
USE16

dw 128 dup(0)
stre:

; data
segment DATA16
USE16

run db 0
psp dw 0
m1 db "Multicore Debugger, (C) Chourdakis Michael",0x0D,0x0A,"$"
prg db "d:\debuggee.exe",0x0

struc LoadX a,b,c,d,e,f,g
    {
    .f1 dw a
    .f2 dd b
    .f3 dd c
	.f4 dd d
	.sp dw g
	.ss dw f
	.cs dw e
	.ip dw e
    }

bbb LoadX 0,0,0,0,0,0,0


; main
segment CODE16
USE16


start16:


	mov ax,STACK16
	mov ss,ax
	mov eax,stre
	mov esp,eax
	mov ax,DATA16
	mov ds,ax
	mov es,ax
	mov ax,0x0900
	mov dx,m1
	int 0x21


	; Load executable
	mov bx,bbb
	mov dx,prg
	mov ax,0x4B01
	int 0x21
	jc endx
	BackExecutable:
	mov ax,DATA16
	mov ds,ax
	cmp [run],1
	je endx2
	mov [run],1
	mov ah,0x62
	int 0x21
	mov [psp],bx


	; run
	mov ax,DATA16
	mov ds,ax
	mov ax,[bbb.sp]
	mov sp,ax
	mov ax,[bbb.ss]
	mov ss,ax
	mov ax,[bbb.ip]
	push ax
	mov ax,[bbb.cs]
	push ax
	retf



	endx2:


	endx:

	
	
	; End
	mov ax,0x4C00
	int 0x21




SEGMENT ENDS 
entry CODE16:start16


