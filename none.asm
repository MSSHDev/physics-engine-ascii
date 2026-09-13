; Non-movable Object (No physics)
section .data
	clear db 0x1B, "[2J", 0x1B, "[H", 0

	x dd 4
	y dd 1
	object db 0x1B, "[%d;%dHX", 0
	
	ground_y dd 6
	ground db 0x1B, "[%d;1H-------", 0

section .text
	global _main
	extern _printf, _exit

_main:
	call _clear
	call _draw_object
	call _draw_ground
	
	jmp .exit

.exit:
	push 0
	call _exit

_clear:
	push clear
	call _printf
	add esp, 4
	
	ret

_draw_object:
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