#include "uart_regs.h"
#include "uart_init.s"
#include "csd_zynq_peripherals.h"

#define TIMER_INITIAL	33300000

.align 5

csd_vector_table:
	b .
	b .
	b .
	b .
	b .
	b .
	b csd_IRQ_ISR
	b .

.global main
main:

	cpsID i // interrupt disable

	cps #0x12
	ldr	r13,=irq_stack_top // IRQ mode 세팅

	cps #0x1F	             // SYS mode 세팅


	ldr     r0, =csd_vector_table
	mcr     p15, 0, r0, c12, c0, 0
	dsb
	isb // vector table 주소로 세팅


	cpsIE i //interrupt enable

//GIC 세팅

	ldr r0, =GICD_CTLR
	ldr r1, [r0]
	mov r2, #1
	orr r1, r1, r2
	str r1, [r0]
	ldr r3, [r0] // enable GIC


	ldr r0, =GICD_ISENABLER0
	ldr r1, [r0]
	mov r2, #1 << 29
	orr r1, r1, r2
	str r1, [r0]
	ldr r3, [r0] // timer interrupt enable

	ldr r0, =GICD_PRIOR7
	ldr r1, [r0]
	mov r2, #0x10 << 8
	orr r1, r1, r2
	str r1, [r0]
	ldr r3, [r0] // private timer에 대한 priority 값을 넣어줌

	ldr r0, =GICC_CTLR
	ldr r1, [r0]
	mov r2, #1
	orr r1, r1, r2
	str r1, [r0]
	ldr r3, [r0] // interrupt signaling을 enable

	ldr r0, =GICC_PMR
	ldr r1, [r0]
	mov r2, #0xFF
	orr r1, r1, r2
	str r1, [r0]
	ldr r3, [r0] // 모든 priority level 마스킹


// Private Timer 세팅

 	UART_init

	ldr r0, =PRIVATE_LOAD
 	ldr r1, =TIMER_INITIAL
 	str r1, [r0]

  	ldr r0, =PRIVATE_CONTROL
 	mov r1, #9 << 8
 	orr r1, r1, #7
 	str r1, [r0]


	ldr r0, =PRIVATE_COUNTER
	ldr r1, =PRIVATE_STATUS
	ldr r2, =GICD_ISPENDR0

	ldr r11, =uart_TX_RX_FIFO0
	ldr r12, =uart_Channel_sts_reg0

TX_loop:

	ldr r8, [r12]
	and	r8, r8, #0x8
	cmp	r8, #0x8
	bne	TX_loop	// txfifo 비어있는지 확인

	mov 	r8, #13
	strb	r8, [r11]
	mov		r8, #48
	strb	r8, [r11]
	strb	r8, [r11]
	mov		r8, #58
	strb	r8, [r11]
	mov		r8, #48
	strb	r8, [r11]
	strb	r8, [r11]
	mov		r8, #58
	strb	r8, [r11]
	mov		r8, #48
	strb	r8, [r11]
	strb	r8, [r11]
	mov		r8, #58 // '00:00:00' 출력

forever:
	ldr r5, [r0]
	ldr r6, [r1]
	ldr r7, [r2]
	b forever

csd_IRQ_ISR:

	stmfd sp!, {r0-r12, lr}

  	ldr r0, =GICC_IAR
	ldr r10, [r0] // interrupt ID를 읽음

	bl c_timer

	ldr r1, [r0], #4
	ldr r2, [r0], #4
	ldr r3, [r0], #4
	ldr r4, [r0], #4
	ldr r5, [r0], #4
	ldr r6, [r0]

	mov 	r8, #13
	strb	r8, [r11]

	add		r8, r1, #48
	strb	r8, [r11]
	add		r8, r2, #48
	strb	r8, [r11]

	mov		r8, #58
	strb	r8, [r11]

	add		r8, r3, #48
	strb	r8, [r11]
	add		r8, r4, #48
	strb	r8, [r11]

	mov		r8, #58
	strb	r8, [r11]

	add		r8, r5, #48
	strb	r8, [r11]
	add		r8, r6, #48
	strb	r8, [r11] // 'hh:mm:ss' 출력


  	ldr r0, =PRIVATE_STATUS
  	mov r1, #1
	str r1, [r0] // Clear Interrupt Status bit


 	// End-of-Interrupt
  	ldr r0, =GICC_EOIR
	str r10, [r0]

	ldmfd sp!, {r0-r12, lr}
	subs pc, lr, #4

.data
.align 4

irq_stack:     .space 1024
irq_stack_top:

