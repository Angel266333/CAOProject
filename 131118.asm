;
; AssemblerApplication12.asm
;
; Created: 12/11/2018 10.07.13
; Author : AI2-PC
;


; Replace with your application code
ldi r19, 0x00
ldi r25, 0x00 ; Default values set. Used as flag and triggered when value is different than default value.
; Basically, when we input the correct password, we are ok. But if we input the incorrect one, we will get a flag.
; In the following lines, we load the default password.
ldi r20, 0x00
ldi r21, 0x00
ldi r22, 0x00
ldi r23, 0x00
; We set the directions.
ldi r16, 0x00
out ddra, r16
ldi r16, 0xFF
out ddrb, r16
out ddrc, r16

wait:
; This represents the locked state in the state-machine diagram.
; power row 1
ldi r16, 0b00000001
out portc, r16
in r16, pina
cpi r16, 0b10000000
brne skip1
jmp push1
skip1:
cpi r16, 0b00100000
brne skip2
jmp push2
skip2:
cpi r16, 0b00001000
brne skip3
jmp push3
skip3:
cpi r16, 0b00000010
brne skipa
jmp pusha
skipa:
; power row 2
ldi r16, 0b00000100
out portc, r16
in r16, pina
cpi r16, 0b10000000
brne skip4
jmp push4
skip4:
cpi r16, 0b00100000
brne skip5
jmp push5
skip5:
cpi r16, 0b00001000
brne skip6
jmp push6
skip6
cpi r16, 0b00000010
brne skipb
jmp pushb
skipb:
; power row 3
ldi r16, 0b00010000
out portc, r16
in r16, pina
cpi r16, 0b10000000
brne skip7
jmp push7
skip7:
cpi r16, 0b00100000
brne skip8
jmp push8
skip8:
cpi r16, 0b00001000
brne skip9
jmp push9
skip9:
cpi r16, 0b00000010
brne skipc
jmp pushc
skipc:

; power row 4
ldi r16, 0b01000000
out portc, r16
in r16, pina
cpi r16, 0b10000000
brne skipstar
jmp pushstar
skipstar:
cpi r16, 0b00100000
brne skip0
jmp push0
skip0:
cpi r16, 0b00001000
brne skiphash
jmp pushhash
skiphash:
cpi r16, 0b00000010
brne skipd
jmp pushd
skipd:
jmp wait

push1:
ldi r24, 0x01
jmp validate

push2:
ldi r24, 0x02
jmp validate

push3:
ldi r24, 0x03
jmp validate

push4:
ldi r24, 0x04
jmp validate	

push5:
ldi r24, 0x05
jmp validate	

push6:
ldi r24, 0x06
jmp validate	

push7:
ldi r24, 0x07
jmp validate	

push8:
ldi r24, 0x08
jmp validate	

push9:
ldi r24, 0x09
jmp validate	

push0:
ldi r24, 0x00
jmp validate

pusha:
ldi r24, 0x0A
jmp validate

pushb:
ldi r24, 0x0B
jmp validate

pushc:
ldi r24, 0x0C
jmp validate

pushd:
ldi r24, 0x0D
jmp validate

pushhash:
ldi r24, 0x0E
jmp validate

pushstar:
ldi r24, 0x0F
jmp validate

; The default password will be stored in registers r20 to r23.
; The new password inputs are going to be stored in r24.
validate:
inc r19
; Here, we compare the register r19 which is set to work as a counter.
cpi r19, 0x01
breq validate1
cpi r19, 0x02
breq validate2
cpi r19, 0x03
breq validate3
cpi r19, 0x04
breq validate4

validate1:
cp r24, r20
brne error
jmp wait

validate2:
cp r24, r21
brne error
jmp wait

validate3:
cp r24, r22
brne error
jmp wait

validate4:
cpi r25, 0x01 ; If this flag is 0x01 (triggered), we also reset the session.
breq resetall
cp r24, r23 ; We compare the last input with the last password value.
brne resetall ; If the comparison doesn't match then we reset the session.
jmp unlocked ; If none of the above are true, we go to unlocked state.

error:
ldi r25, 0x01
jmp wait

resetall:
ldi r19, 0x00
ldi r25, 0x00
jmp wait

unlocked:
ldi r16, 0x01
out portb, r16
jmp unlocked

;TODO - Fix relative branch out of reach