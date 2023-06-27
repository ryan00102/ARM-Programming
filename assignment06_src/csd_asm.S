#define csd_SW_ADDR 0x41210000

#include "csd_zynq_peripherals.h"

.extern csd_main

.global main
main:
	ldr r6, =csd_SW_ADDR	//r6에 스위치 주소 로드


forever:
	ldr r5, [r6]
	and r5, #0x1
	cmp r5, #1				// 스위치값 확인
	bleq cache_enable		// 스위치 켜져있으면 캐시 enable
	blne cache_disable		// 스위치 꺼져있으면 캐시 disable

	bl  csd_main

	b forever

cache_disable:
	@------------------------
	@ Disable Caches (L2)
	@------------------------
	ldr r0, =L2_reg1_ctrl
	mov r1, #0x0
	str r1, [r0]
	@------------------------
	@ Disable Caches (IL1, DL1)
	@------------------------
	mrc		p15, 0, r0, c1, c0, 0	@ read control register (CP15 register1)
	bic		r0, r0, #4096		    @ disable I bit (Instruction Cache)
	bic		r0, r0, #4		        @ disable C bit (Data and Unified Caches)
	mcr		p15, 0, r0, c1, c0, 0	@ write control register (CP15 register2)

	mov pc, lr		// return to the caller

cache_enable:
	@------------------------
	@ Enable Caches (L2)
	@------------------------
	ldr r0, =L2_reg1_ctrl
    mov r1, #0x1
    str r1, [r0]

	@------------------------
	@ Enable Caches (IL1, DL1)
	@------------------------
	mrc		p15, 0, r0, c1, c0, 0	@ read control register (CP15 register1)
	orr		r0, r0, #(1<<12)	    @ Enable I bit (Instruction Cache)
	orr		r0, r0, #(1<<2)         @ Enable C bit (Data and Unified Caches)
	mcr		p15, 0, r0, c1, c0, 0	@ write control register (CP15 register2)

	mov pc, lr		// return to the caller
