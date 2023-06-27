.macro PRINT_init
debug_initiation:
	b	end		//For function use, declare functions

debug_macro_start:
	ldr r10, =uart_TX_RX_FIFO0
	ldr r11, =uart_Channel_sts_reg0


	bl print_LINE	//print '-'

	mov 	r3, #13
	strb	r3, [r10]
	mov 	r3, #10
	strb	r3, [r10]	//print enter

	//r0
	mov 	r1, #0
	bl		print_r0_r9

	add		r2, r12, #0x8
	mov		r1, r2
	bl		REG_PRINT


	mov 	r3, #44
	strb	r3, [r10]	//print ','
	mov 	r3, #32
	strb	r3, [r10]	//print space

	//r1
	mov 	r1, #1
	bl		print_r0_r9

	add		r2, r2, #0x4
	mov		r1, r2
	bl		REG_PRINT


	mov 	r3, #44
	strb	r3, [r10]	//print ','
	mov 	r3, #32
	strb	r3, [r10]	//print space

	//r2
	mov 	r1, #2
	bl		print_r0_r9

	add		r2, r2, #0x4
	mov		r1, r2
	bl		REG_PRINT


	mov 	r3, #44
	strb	r3, [r10]	//print ','
	mov 	r3, #32
	strb	r3, [r10]	//print space

	//r3
	mov 	r1, #3
	bl		print_r0_r9

	add		r2, r2, #0x4
	mov		r1, r2
	bl		REG_PRINT


	mov 	r3, #13
	strb	r3, [r10]
	mov 	r3, #10
	strb	r3, [r10]	//print enter

	//r4
	mov 	r1, #4
	bl		print_r0_r9

	add		r2, r2, #0x4
	mov		r1, r2
	bl		REG_PRINT


	mov 	r3, #44
	strb	r3, [r10]	//print ','
	mov 	r3, #32
	strb	r3, [r10]	//print space

	//r5
	mov 	r1, #5
	bl		print_r0_r9

	add		r2, r2, #0x4
	mov		r1, r2
	bl		REG_PRINT


	mov 	r3, #44
	strb	r3, [r10]	//print ','
	mov 	r3, #32
	strb	r3, [r10]	//print space

	//r6
	mov 	r1, #6
	bl		print_r0_r9

	add		r2, r2, #0x4
	mov		r1, r2
	bl		REG_PRINT


	mov 	r3, #44
	strb	r3, [r10]	//print ','
	mov 	r3, #32
	strb	r3, [r10]	//print space

	//r7
	mov 	r1, #7
	bl		print_r0_r9

	add		r2, r2, #0x4
	mov		r1, r2
	bl		REG_PRINT


	mov 	r3, #13
	strb	r3, [r10]
	mov 	r3, #10
	strb	r3, [r10]

	//r8
	mov 	r1, #8
	bl		print_r0_r9

	add		r2, r2, #0x4
	mov		r1, r2
	bl		REG_PRINT


	mov 	r3, #44
	strb	r3, [r10]	//print ','
	mov 	r3, #32
	strb	r3, [r10]	//print space

	//r9
	mov 	r1, #9
	bl		print_r0_r9

	add		r2, r2, #0x4
	mov		r1, r2
	bl		REG_PRINT


	mov 	r3, #44
	strb	r3, [r10]	//print ','
	mov 	r3, #32
	strb	r3, [r10]	//print space

	//r10
	mov 	r1, #0
	bl		print_r10_r15

	add		r2, r2, #0x4
	mov		r1, r2
	bl		REG_PRINT


	mov 	r3, #44
	strb	r3, [r10]	//print ','
	mov 	r3, #32
	strb	r3, [r10]	//print space

	//r11
	mov 	r1, #1
	bl		print_r10_r15

	add		r2, r2, #0x4
	mov		r1, r2
	bl		REG_PRINT


	mov 	r3, #13
	strb	r3, [r10]
	mov 	r3, #10
	strb	r3, [r10]	//print enter

	//r12
	mov 	r1, #2
	bl		print_r10_r15

	add		r2, r2, #0x4
	mov		r1, r2
	bl		REG_PRINT


	mov 	r3, #44
	strb	r3, [r10]	//print ','
	mov 	r3, #32
	strb	r3, [r10]	//print space

	//r13
	mov 	r1, #3
	bl		print_r10_r15

	add		r3, r12, #0x40
	push	{r3}
	mov		r1, sp
	bl		REG_PRINT
	pop		{r3}


	mov 	r3, #44
	strb	r3, [r10]	//print ','
	mov 	r3, #32
	strb	r3, [r10]	//print space

	//r14
	mov 	r1, #4
	bl		print_r10_r15

	add		r2, r2, #0x4
	mov		r1, r2
	bl		REG_PRINT


	mov 	r3, #44
	strb	r3, [r10]	//print ','
	mov 	r3, #32
	strb	r3, [r10]	//print space

	//r15
	mov 	r1, #5
	bl		print_r10_r15

	add		r1, r12, #0x4
	bl		REG_PRINT


	mov 	r3, #13
	strb	r3, [r10]
	mov 	r3, #10
	strb	r3, [r10]	//print enter

	//CPSR : print "cpsr= "
	mov 	r3, #99
	strb	r3, [r10]
	mov 	r3, #112
	strb	r3, [r10]
	mov 	r3, #115
	strb	r3, [r10]
	mov 	r3, #114
	strb	r3, [r10]
	mov 	r3, #61
	strb	r3, [r10]
	mov 	r3, #32
	strb	r3, [r10]

	bl		print_NZCV		//print NZCV of cpsr

	mov 	r3, #44
	strb	r3, [r10]	//print ','
	mov 	r3, #32
	strb	r3, [r10]	//print space

	bl		print_IF

	bl		print_JT

	//print " mode, "
	mov 	r3, #32
	strb	r3, [r10]
	mov 	r3, #109
	strb	r3, [r10]
	mov 	r3, #111
	strb	r3, [r10]
	mov 	r3, #100
	strb	r3, [r10]
	mov 	r3, #101
	strb	r3, [r10]
	mov 	r3, #44
	strb	r3, [r10]
	mov 	r3, #32
	strb	r3, [r10]

	bl		print_MODE		//print MODE of cpsr

	//print "( =0x"
	mov 	r3, #32
	strb	r3, [r10]	//print space
	mov 	r3, #40
	strb	r3, [r10]	//print '('
	mov 	r3, #32
	strb	r3, [r10]	//print space
	mov 	r3, #61
	strb	r3, [r10]	//print '='
	mov 	r3, #48
	strb	r3, [r10]	//print '0'
	mov 	r3, #120
	strb	r3, [r10]	//print 'x'

	mov		r1, r12
	bl		REG_PRINT		//print cpsr in Hex

	//print ')'
	mov 	r3, #41
	strb	r3, [r10]
	mov 	r3, #13
	strb	r3, [r10]
	mov 	r3, #10
	strb	r3, [r10]	//print enter

	bl		print_LINE		//print '-'

	mov 	r3, #13
	strb	r3, [r10]
	mov 	r3, #10
	strb	r3, [r10]	//print enter

	pop	{pc}			//Go back to DEBUG_macro



//FUNCTION: Print '-' * 70
print_LINE:
	mov 	r2, #70
print_LINE_1:
	mov 	r3, #45				//set r3 as ASCII of '-'


print_LINE_TX_loop:
	ldr r9, [r11]
	and	r9, r9, #0x8
	cmp	r9, #0x8
	bne	print_LINE_TX_loop

	strb	r3, [r10]			// fill the TxFIFO with '-'
	subs 	r2, r2, #1
	bne 	print_LINE_1

	mov		pc, lr				// return to the caller


//Print "rx =0x"
print_r0_r9:
	mov 	r3, #114
	strb	r3, [r10]
	add		r3, r1, #48
	strb	r3, [r10]
	mov 	r3, #32
	strb	r3, [r10]
	mov 	r3, #61
	strb	r3, [r10]
	mov 	r3, #48
	strb	r3, [r10]
	mov 	r3, #120
	strb	r3, [r10]

	mov		pc, lr		// return to the caller


//Print from r10 to r15
print_r10_r15:
	mov 	r3, #114
	strb	r3, [r10]	//print 'r'
	mov 	r3, #49
	strb	r3, [r10]	//print '1'
	add		r3, r1, #48
	strb	r3, [r10]	//print 2nd digit of register number
	mov 	r3, #32
	strb	r3, [r10]	//print space
	mov 	r3, #61
	strb	r3, [r10]	//print '='
	mov 	r3, #48
	strb	r3, [r10]	//print '0'
	mov 	r3, #120
	strb	r3, [r10]	//print 'x'

	mov		pc, lr		// return to the caller


//Print digits of Register in Hex
REG_PRINT:
	mov		r5, #28
	mov		r6, #4
	ldr		r3, [r1]
REG_PRINT_1:			//print first 4 digits in Hex
	mov		r4, r3, LSR r5	//set r4 8nd digit in Hex
	sub		r5, r5, #4		//sub r5 to check next digit in Hex
	and		r4, r4, #0xF
	cmp		r4, #10
	addlt	r4, r4, #48		//print num(0-9)
	addge	r4, r4, #87		//print apb(a-f)
	strb	r4, [r10]
	subs	r6, #1
	bne		REG_PRINT_1

	mov 	r4, #95
	strb	r4, [r10]		//print '_'

REG_PRINT_TX_loop:
	ldr r9, [r11]				// read Channel Status Register
	and	r9, r9, #0x8			// read Transmit Buffer Empty bit(bit[3])
	cmp	r9, #0x8				// check if TxFIFO is empty and ready to receive new data
	bne	REG_PRINT_TX_loop	// if TxFIFO is NOT empty, keep checking until it is empty

	mov		r6, #4
	ldr		r3, [r1]
REG_PRINT_2:			//Print last 4 digits in Hex
	mov		r4, r3, LSR r5	//Set r4 as 4nd digit in Hex
	sub		r5, r5, #4		//Sub r5 to check next digit in Hex
	and		r4, r4, #0xF
	cmp		r4, #10
	addlt	r4, r4, #48		//Print num(0-9)
	addge	r4, r4, #87		//Print apb(a-f)
	strb	r4, [r10]
	subs	r6, #1
	bne		REG_PRINT_2

	mov		pc, lr			// return to the caller


//print nzcv
print_NZCV:
	mov		r1, r0, LSR#28

	and		r3, r1, #1<<3
	cmp		r0, #0b1000			//check N
	moveq	r3, #78				//N=1, print N
	movne	r3, #110 			//N=0, print n
	strb	r3, [r10]

	and		r3, r1, #1<<2
	cmp 	r3, #0b0100			//check Z
	moveq	r3, #90				//Z=1, print Z
	movne	r3, #122			//Z=0, print z
	strb	r3, [r10]

	and		r3, r1, #1<<1
	cmp 	r3, #0b0010			//check C
	moveq	r3, #67				//Z=1, print C
	movne	r3, #99				//Z=0, print c
	strb	r3, [r10]

	and		r3, r1, #1
	cmp 	r3, #0b0001			//check V
	moveq	r3, #86				//V=1, print V
	movne	r3, #118			//V=0, print v
	strb	r3, [r10]

	mov		pc, lr		// return to the caller


//print IF of cpsr
print_IF:
	mov		r1, r0, LSR#6

	and 	r3, r1, #1<<1
	cmp 	r3, #0b0010			//check I
	moveq	r3, #73				//I=1, print I
	movne	r3, #105			//I=0, print i
	strb	r3, [r10]

	and 	r3, r1, #1
	cmp 	r3, #0b0001			//check F
	moveq	r3, #70				//F=1, print F
	movne	r3, #102			//F=0, print f
	strb	r3, [r10]

	//print ", "
	mov 	r3, #44
	strb	r3, [r10]
	mov 	r3, #32
	strb	r3, [r10]

	mov		pc, lr		// return to the caller


//print JT of cpsr
print_JT:
	mov		r1, r0, LSR#24
	mov		r2, r0, LSR#5
	and		r1, r1, #1
	and		r2, r2, #1
	cmp 	r1, #0b1			//check J of cpsr
	beq		print_JT_j1				//J=1, branch to print_JT_j1

	cmp 	r2, #0b1			//J=0, check T of cpsr
	beq		print_JT_j0_t1				//J=0, T=1, branch to print_JT_j0_t1

	mov 	r3, #65				//J=0, T=0, print 'ARM'
	//print "ARM"
	strb	r3, [r10]
	mov 	r3, #82
	strb	r3, [r10]
	mov 	r3, #77
	strb	r3, [r10]

	mov		pc, lr		// return to the caller

print_JT_j0_t1:			//J=0, T=1, print 'Thumb'
	//print "Thumb"
	mov 	r3, #84
	strb	r3, [r10]
	mov 	r3, #104
	strb	r3, [r10]
	mov 	r3, #117
	strb	r3, [r10]
	mov 	r3, #109
	strb	r3, [r10]
	mov 	r3, #98
	strb	r3, [r10]

	mov		pc, lr		// return to the caller

print_JT_j1:				//J=1, check T of cpsr
	cmp 	r2, #0b1
	beq		print_JT_j1_t1	//J=1, T=1, branch to print_JT_j1_t1

	mov 	r3, #74				//J=0, T=0, print 'Jazelle'
	//print "Jazelle"
	strb	r3, [r10]
	mov 	r3, #97
	strb	r3, [r10]
	mov 	r3, #122
	strb	r3, [r10]
	mov 	r3, #101
	strb	r3, [r10]
	mov 	r3, #108
	strb	r3, [r10]
	mov 	r3, #108
	strb	r3, [r10]
	mov 	r3, #101
	strb	r3, [r10]

	mov		pc, lr		// return to the caller

print_JT_j1_t1:			//if J=1, T=1, print 'ThumbEE'
	//print "ThumbEE"
	mov 	r3, #84
	strb	r3, [r10]
	mov 	r3, #104
	strb	r3, [r10]
	mov 	r3, #117
	strb	r3, [r10]
	mov 	r3, #109
	strb	r3, [r10]
	mov 	r3, #98
	strb	r3, [r10]
	mov 	r3, #69
	strb	r3, [r10]
	mov 	r3, #69
	strb	r3, [r10]

	mov		pc, lr		// return to the caller


//Check and print info. about Current mode of cpsr
print_MODE:
	//print "current mode ="
	mov 	r3, #99
	strb	r3, [r10]
	mov 	r3, #117
	strb	r3, [r10]
	mov 	r3, #114
	strb	r3, [r10]
	mov 	r3, #114
	strb	r3, [r10]
	mov 	r3, #101
	strb	r3, [r10]
	mov 	r3, #110
	strb	r3, [r10]
	mov 	r3, #116
	strb	r3, [r10]
	mov 	r3, #32
	strb	r3, [r10]
	mov 	r3, #109
	strb	r3, [r10]
	mov 	r3, #111
	strb	r3, [r10]
	mov 	r3, #100
	strb	r3, [r10]
	mov 	r3, #101
	strb	r3, [r10]
	mov 	r3, #32
	strb	r3, [r10]
	mov 	r3, #61
	strb	r3, [r10]

	and		r3, r0, #1<<3
	and		r4, r0, #1<<2
	and		r5, r0, #1<<1
	and		r6, r0, #1

	cmp		r3, #0b1000			//check bit#3 of cpsr
	beq		bit_1010			//bit#3=1, branch to bit_1010

	cmp 	r4, #0b0100			//check bit#2 of cpsr
	beq		bit_0110			//bit#2=1, branch to bit_0110

	cmp 	r5, #0b0010			//check bit#1 of cpsr
	beq		bit_0010			//bit#1=1, branch to bit_0010

	cmp 	r6, #0b0001			//check bit#0 of cpsr
	beq		bit_0001			//bit#0=1, branch to bit_0001

	mov 	r3, #85			//bit_0000, print USR
	//print "USR"
	strb	r3, [r10]	//print 'U'
	mov 	r3, #83
	strb	r3, [r10]	//print 'S'
	mov 	r3, #82
	strb	r3, [r10]	//print 'R'

	mov		pc, lr		// return to the caller

bit_0001: //print "FIQ"
	mov 	r3, #70
	strb	r3, [r10]
	mov 	r3, #73
	strb	r3, [r10]
	mov 	r3, #81
	strb	r3, [r10]

	mov		pc, lr		// return to the caller

bit_0010:
	cmp 	r6, #0b0001			//check bit#0 of cpsr
	beq		bit_0011			//bit#0=1, branch to bit_0010
	//print "IRQ"
	mov 	r3, #73
	strb	r3, [r10]
	mov 	r3, #82
	strb	r3, [r10]
	mov 	r3, #81
	strb	r3, [r10]

	mov		pc, lr		// return to the caller

bit_0011: //print "SVC"

	mov 	r3, #83			//bit_0011, print SVC
	strb	r3, [r10]
	mov 	r3, #86
	strb	r3, [r10]
	mov 	r3, #67
	strb	r3, [r10]

	mov		pc, lr		// return to the caller

bit_0110:
	cmp 	r6, #0b0001			//check bit#0 of cpsr
	beq		bit_0111			//bit#0=1, branch to bit_0111
	//print "MON"
	mov 	r3, #77			//bit_0110, print MON
	strb	r3, [r10]
	mov 	r3, #79
	strb	r3, [r10]
	mov 	r3, #78
	strb	r3, [r10]

	mov		pc, lr		// return to the caller

bit_0111: //print "ABT"
	mov 	r3, #65
	strb	r3, [r10]
	mov 	r3, #66
	strb	r3, [r10]
	mov 	r3, #84
	strb	r3, [r10]

	mov		pc, lr		// return to the caller

bit_1010:
	cmp 	r4, #0b0100			//check bit#2 of cpsr
	beq		bit_1111			//bit#2=1, branch to bit_1111

	cmp 	r6, #0b0001			//check bit#0 of cpsr
	beq		bit_1011			//bit#0=1, branch to bit_1011
	//print "HYP"
	mov 	r3, #72
	strb	r3, [r10]
	mov 	r3, #89
	strb	r3, [r10]
	mov 	r3, #80
	strb	r3, [r10]

	mov		pc, lr		// return to the caller

bit_1011: //print "UND"
	mov 	r3, #85			//bit_1011, print UND
	strb	r3, [r10]
	mov 	r3, #78
	strb	r3, [r10]
	mov 	r3, #68
	strb	r3, [r10]

	mov		pc, lr		// return to the caller

bit_1111: //print "SYS"
	mov 	r3, #83			//bit_1111, print SYS
	strb	r3, [r10]
	mov 	r3, #89
	strb	r3, [r10]
	mov 	r3, #83
	strb	r3, [r10]

	mov		pc, lr		// return to the caller


end:

.endm
