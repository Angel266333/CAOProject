;
; AssemblerApplication12.asm
;
; Created: 12/11/2018 10.07.13
; Author : AI2-PC
;


; Replace with your application code
ldi r19, 0x00
start:
ldi r16, 0x00
out ddra, r16
ldi r16, 0xFF
out ddrb, r16

off:
in r16, pina
cpi r16, 0b00001010
breq on
jmp off

on:
ldi r16, 0xFF
out portb, r16
jmp on

wait:
; This represents the locked state in the state-machine diagram
; power row 1
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

; power row 2
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

; power row 3
ldi r16, 0b00000100
out portc, r16
in r16, pina
cpi r16, 0b00000001
breq push7
cpi r16, 0b00000010
breq push8
cpi r16, 0b00000100
breq push9
cpi r16, 0b00001000
breq pushc

; power row 4
ldi r16, 0b00001000
out portc, r16
in r16, pina
cpi r16, 0b00000001
breq pushstar
cpi r16, 0b00000010
breq push0
cpi r16, 0b00000100
breq pushhash
cpi r16, 0b00001000
breq pushd
jmp wait

push1:
ldi r24, 0b00000001
jmp storemain

inc r19

storemain:
cpi r19, 0x00
breq store20
cpi r19, 0x01
breq store21
cpi r19, 0x02
breq store22
cpi r19, 0x03
breq store23

store20:
mov r20, r24
; Increment counter
inc r19
jmp wait

store21:
mov r21, r24
; Increment counter
inc r19
jmp wait

store22:
mov r22, r24
; Increment counter
inc r19
jmp wait

store23:
mov r23, r24
jmp validate

validate:
;TODO