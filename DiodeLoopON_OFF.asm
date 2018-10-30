;
; DiodeLoopON_OFF.asm
;
; Created: 30/10/2018 09.58.03
; Author : AI2-PC
;


; Replace with your application code
;set directions
ldi r16, 0b00000001
out ddrb, r16
ldi r16, 0x00
out ddra, r16

;logic
start:
; Use 'pin' for input!
in r16, pina
cpi r16, 0b00001000
breq on
jmp off

off:
ldi r17, 0b00000001
out portb, r17
jmp start

on:
ldi r17, 0b00000000
out portb, r17
jmp start
