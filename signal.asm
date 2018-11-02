;set directions
ldi r16, 0xFF
out ddrb, r16
ldi r16, 0x00
out ddrc, r16

;program
ldi r17, 0b10000000
out portb, r17
on:
;read 
in r17, pinc
cpi r17, 0b00000001
breq off
jmp on
off:
out portb, r16
