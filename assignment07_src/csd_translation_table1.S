.global csd_MMUTable1_lv2
csd_MMUTable1_lv2:
.word 0x400002
.word 0x401002
.word 0x402002



.global  csd_MMUTable1
.section .csd_mmu_tbl,"a"

//1st lever page table
csd_MMUTable1:
	/* A 32-bit is required for each PTE (Page Table Entry).
	 * Each PTE covers a 4KB section.
	 *  First 3 PTEs with the following translations
	 *     1st 1MB: 0x0000_0000 (VA) -> 0x0000_0000 (PA)
	 *     2nd 1MB: 0x0010_0000 (VA) -> 0x0010_0000 (PA)
	 *     3rd 1MB -> Second Table?
	 */
.set SECT, 0
.word	SECT + 0x15de6		/* S=b1 TEX=b101 AP=b11, Domain=b1111, C=b0, B=b1 */
.set	SECT, 0x100000
.word	SECT + 0x15de6		/* S=b1 TEX=b101 AP=b11, Domain=b1111, C=b0, B=b1 */
.word	csd_MMUTable1_lv2 + 0x1e1


.rept (0x200 - 6)
.word	SECT + 0x15de6		/* S=b1 TEX=b101 AP=b11, Domain=b1111, C=b0, B=b1 */
.endr

.end
