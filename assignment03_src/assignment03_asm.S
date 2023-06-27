#include "uart_regs.h"
#include "uart_init.s"
#include "print_macro.s"
#include "print_init.s"


.align 8



.global main
main: //Instructions are described with 'C language'

	UART_init
	PRINT_init

	PRINT_macro				//PRINT_macro #1
	ldr r1, =Input_data @r1에 Input_data의 첫 word의 주소를 저장
	ldr r2, =Output_data @r2에 Output_data의 첫 word의 주소를 저장
	PRINT_macro				//PRINT_macro #2
	mov r3, #0 @r3는 outer_counter-> 0으로 초기화
	outerLoop:
		mov r4, #0 @r4는 비교횟수 inner_counter -> 0으로 초기화
		mov r0, r1 @r0에 Input_data의 첫 word의 주소 저장
		add r5, r0, #4 @r5에 첫 word의 다음 word 주소 저장 (하나의 word는 4byte이므로 +4를 한다)
		PRINT_macro				//PRINT_macro #3
	innerLoop: @하나의 path에서의 비교 반복문
		ldr r8, [r0] @r8에 r0에 저장된 주소의 값 저장
		ldr r7, [r5] @r7에 r5에 저장된 주소의 값 저장
		cmp r8, r7 @r8의 값과 r7의 값을 비교
		PRINT_macro				//PRINT_macro #4
		strge r8, [r5] @r8의 값이 더 크다면, r8의 값을 r5에 저장된 주소로 저장
		strge r7, [r0] @r8의 값이 더 크다면, r7의 값을 r0에 저장된 주소로 저장
						@결국 r8과 r7의 값을 바꿈 -> swap
		PRINT_macro				//PRINT_macro #10
		add r0, #4 @r0에 다음 word의 주소 저장
		add r5, #4 @r5에 다음 word의 주소 저장
		add r4, #1 @inner_count++
		cmp r4, #31 @r4(비교 카운터)가 31인지 확인
		blne innerLoop @r4(비교 카운터)가 31이 아니라면 다시 innerLoop실행
		PRINT_macro				//PRINT_macro #5
	add r3, #1 @r4(비교 카운터)가 31이라면, outer_count++
	cmp r3, #32 @r3(카운터)가 32인지 확인
	blne outerLoop @r3(카운터)가 32가 아니라면, 다시 outerLoop 실행

mov r4, #0 @r3(카운터)가 32라면 r4(inner_count)를 0으로 초기화-> 아래 copyLoop에서 사용하는 counter
PRINT_macro				//PRINT_macro #6
copyLoop:
	mov r0, r1 @r0에  Input_data의 첫 word의 주소를 저장
	mov r5, r2 @r5에 Output_data의 첫 word의 주소를 저장
	PRINT_macro				//PRINT_macro #7
	ldr r8, [r1], #4 @r8에 r1이 가리키는 주소의 값을 저장하고 r1의 저장된 주소에 +4
	str r8, [r2], #4 @r2에 r8이 저장된 값을 저장하고 r2에 저장된 주소에 +4
	PRINT_macro				//PRINT_macro #8
	add r4, #1 @counter++
	cmp r4, #32 @counter가 32인지 확인
	blne copyLoop @아니라면 다시 copyLoop실행
	PRINT_macro				//PRINT_macro #9

bl csd_main @32라면 csd_main으로 이동


.data
.align 4 @4byte단위로 정렬
Input_data:
	.word 2, 0, -7, -1, 3, 8, -4, 10
	.word -9, -16, 15, 13, 1, 4, -3, 14
	.word -8, -10, -15, 6, -13, -5, 9, 12
	.word -11, -14, -6, 11, 5, 7, -2, -12
Output_data:
	.word 0, 0, 0, 0, 0, 0, 0, 0
	.word 0, 0, 0, 0, 0, 0, 0, 0
	.word 0, 0, 0, 0, 0, 0, 0, 0
	.word 0, 0, 0, 0, 0, 0, 0, 0



//Normal Interrupt Service Routine
