.macro PRINT_macro
	push {r0-r12,r14}
	sub	r0, pc, #0xc
	push {r0} //pc value 푸시
	mrs r0, cpsr //r0 레지스터에 cpsr을 저장 <- mov로 안됨
	push {r0}

	mov	r12, sp

	push {pc}
	b	debug_macro_start

	pop {r0}
	msr cpsr, r0 //cpsr 레지스터에 ro레지스터 값 저장 <- mov로 안됨
	pop {r0}
	pop {r0-r12, r14}
.endm
