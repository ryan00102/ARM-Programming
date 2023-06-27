// 2nd level page table

.global main
main:
    // 가상 주소 0x20_0000을 레지스터에 로드
    ldr r0, =csd_MMUTable1
    // 레지스터 r0에 있는 가상 주소를 물리 주소로 변환
    ldr r0, [r0]
    // 물리 주소를 레지스터 r1에 저장
    mov r1, r0

    // 덧셈 결과를 저장할 변수 초기화
    mov r2, #0

    // 0x20_0000 ~ 0x20_2FFF의 정수값을 더하는 루프
    ldr r3, =0x202FFF
insert_loop:
	mov r5, #0x1
	str r5, [r1]
	add r1, r1, #4
	cmp r1, r3
	ble insert_loop

	mov r1, r0
sum_loop:
    // 레지스터 r0에 있는 물리 주소에 해당하는 정수값을 더함
    ldr r4, [r1]
    add r2, r2, r4

    // 다음 주소로 이동
    add r1, r1, #4
    cmp r1, r3
    ble sum_loop

    // 결과 출력
    mov r6, r2
forever:
	b forever
