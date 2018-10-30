;
; AssemblerApplication6.asm
;
; Created: 30/10/2018 09.32.21
; Author : AI2-PC
;


; Replace with your application code
start:
ldi r16, 0b10000000
ldi r17, 0xFF
out ddrb, r17
out portb, r16
jmp start