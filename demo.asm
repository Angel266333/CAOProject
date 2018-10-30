.include "/home/kup/m2560def.inc"
;set directions
ldi r16, 0b00000001
out ddrb, r16
ldi r16, 0x00
out ddra, r16

;logic
start:
in r16, porta
cpi r16, 0b00001000
breq on
jmp off

on:
ldi r17, 0b00000001
out portb, r17
jmp start

off:
ldi r17, 0b00000000
out portb, r17
jmp start
