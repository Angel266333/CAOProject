wait:
;power row 1
ldi r16, 0b00000001
out portc, r16
in r16, pina
cpi r16, 0b00000001
breq push1
cpi r16, 0b00000010
breq push2
cpi r16, 0b00000100
breq push3
cpi r16, 0b00001000
breq pusha

ldi r16, 0b00000010
out portc, r16
in r16, pina
cpi r16, 0b00000001
breq push4
cpi r16, 0b00000010
breq push5
cpi r16, 0b00000100
breq push6
cpi r16, 0b00001000
breq pushb

ldi r16, 0b00000100
out portc, r16
in r16, pin7
cpi r16, 0b00000001
breq push8
cpi r16, 0b00000010
breq push9
cpi r16, 0b00000100
breq pushc
cpi r16, 0b00001000
breq pushb

push1:
