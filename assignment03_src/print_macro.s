.macro PRINT_macro
	push {r0-r12,r14}
	sub	r0, pc, #0xc
	push {r0} //pc value Ǫ��
	mrs r0, cpsr //r0 �������Ϳ� cpsr�� ���� <- mov�� �ȵ�
	push {r0}

	mov	r12, sp

	push {pc}
	b	debug_macro_start

	pop {r0}
	msr cpsr, r0 //cpsr �������Ϳ� ro�������� �� ���� <- mov�� �ȵ�
	pop {r0}
	pop {r0-r12, r14}
.endm
