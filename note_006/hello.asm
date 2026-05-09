chgmod	= 0x005F
chput	= 0x00A2
cls		= 0x00C3

		org		0x4000
		db		"AB"			; ID
		dw		start			; INIT
		dw		0				; STATEMENT
		dw		0				; DEVICE
		dw		0				; TEXT
		dw		0				; RESERVE
		dw		0				; RESERVE
		dw		0				; RESERVE

start:
		; SCREEN 1
		ld		a, 1
		call	chgmod
		; CLS
		call	cls
		; PUTS
		ld		hl, s_hello
		call	puts
		; FREEZE
loop:
		jp		loop
puts:
		ld		a, [hl]
		or		a, a
		ret		z
		call	chput
		inc		hl
		jr		puts
s_hello:
		db		"Hello, World!", 0
