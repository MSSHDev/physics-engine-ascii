; Ball Physics
section .data
	clear db 0x1B, "[2J", 0x1B, "[H", 0
	
	x dd 4
	y dd 1
	bounce dd 4
	ball db 0x1B, "[%d;%dHO", 0
	
	ground_y dd 7
	ground db 0x1B, "[%d;1H-------", 0

section .text
	global _main
	extern _printf, _exit, _Sleep@4

_main:
	call _clear
	call _draw_ball
	call _draw_ground
	
	inc [y]
	
	push 500
	call _Sleep@4
	add esp, 4
	
	mov eax, [y]
	cmp eax, [ground_y]
	je .bounce
	
	jmp _main

.bounce:
	mov eax, [bounce]
	sub [y], eax
	
	jmp _main

_clear:
	push clear
	call _printf
	add esp, 4
	
	ret

_draw_ball:
	push [x]
	push [y]
	push ball
	call _printf
	add esp, 12
	
	ret

_draw_ground:
	push [ground_y]
	push ground
	call _printf
	add esp, 8
	
	ret