;uses 3 registers to count to 200x200x200 resulting in aprox. 8mio cycles = 1/2 second
;used for ensuring that a button is fully released before accepting input again.
release:
ldi r30, 0x00; set counters to 0
ldi r31, 0x00
ldi r32, 0x00
release_loop:
in r16, pina
cpi r16, 0x00; keep checking that there is no input from keypad
brne release; if there is, reset the counters
cpi r30, 0xC8; when r30 reaches 200, go to inc_31
breq inc_31

inc_31:
cpi r31, 0xC8; if r31 is also 200, go to inc_32
breq inc_32
ldi r30, 0x00; reset r30 and increment r31
inc r31
jmp release_loop

inc_32:
cpi r32, 0xC8; if r32 is also 200, we're finished and go to wait
breq wait
ldi r30, 0x00; otherwise reset both r30 and r31 and increment r32
ldi r31, 0x00
inc r32
jmp release_loop
