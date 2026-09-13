; Normal Physics
section .data
	clear db 0x1B, "[2J", 0x1B, "[H", 0

	x dd 4
	y dd 1
	object db 0x1B, "[%d;%dH=", 0
	
	ground_len dd 7
	ground_y dd 6
	ground db 0x1B, "[%d;1H-------", 0

section .text
	global _main
	extern _printf, _Sleep@4, _exit

_main:
	call _clear
	call _draw_obj
	call _draw_ground
	
	inc [y]
	
	push 500
	call _Sleep@4
	add esp, 4
	
	
	mov eax, [y]
	mov ebx, [x]
	cmp eax, [ground_y]
	je .exit
	jl _main

.exit:
	push 0
	call _exit

_clear:
	push clear
	call _printf
	add esp, 4
	
	ret

_draw_obj:
	push [x]
	push [y]
	push object
	call _printf
	add esp, 12
	
	ret

_draw_ground:
	push [ground_y]
	push ground
	call _printf
	add esp, 8
	
	ret