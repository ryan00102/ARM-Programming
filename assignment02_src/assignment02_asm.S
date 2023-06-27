#define csd_LED_ADDR 0x41200000
#define csd_SW_ADDR 0x41210000

.extern csd_main

.global main
main:

	ldr r1, =csd_LED_ADDR
	ldr r3, =csd_SW_ADDR
	mov r2, #1
	bl csd_main
	b set_led
myloop:
	lsl r2, r2, #1
    cmp r2, #0x100
    bne set_led


    bl csd_main
    // reset the LED value if it exceeds 0x80
    mov r2, #1
set_led:
    str r2, [r1]
    mov r3, #0
delay:
    // delay for 1 second
    add r3, r3, #1
    cmp r3, r0
    bne delay
    b myloop


