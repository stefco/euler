	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14
	.intel_syntax noprefix
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function _Z10f_sum_eveny
LCPI0_0:
	.long	1127219200              ## 0x43300000
	.long	1160773632              ## 0x45300000
	.long	0                       ## 0x0
	.long	0                       ## 0x0
LCPI0_1:
	.quad	4841369599423283200     ## double 4503599627370496
	.quad	4985484787499139072     ## double 1.9342813113834067E+25
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3
LCPI0_2:
	.quad	4605462196815771380     ## double 0.80901699456236864
LCPI0_3:
	.quad	-4615658040225319180    ## double -1.1180339891247373
LCPI0_4:
	.quad	4599238375204154855     ## double 0.30901699456236859
LCPI0_5:
	.quad	4601727903847901124     ## double 0.44721359559991591
LCPI0_6:
	.quad	4890909195324358656     ## double 9.2233720368547758E+18
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z10f_sum_eveny
	.p2align	4, 0x90
__Z10f_sum_eveny:                       ## @_Z10f_sum_eveny
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 80
	mov	qword ptr [rbp - 40], rdi
	mov	rax, qword ptr [rbp - 40]
	movabs	rdi, -6148914691236517205
	mul	rdi
	shr	rdx
	inc	rdx
	mov	qword ptr [rbp - 40], rdx
	mov	rax, qword ptr [rbp - 40]
	movabs	rdx, -4625698771330540102
	mov	qword ptr [rbp - 24], rdx
	mov	qword ptr [rbp - 32], rax
	movsd	xmm0, qword ptr [rbp - 24] ## xmm0 = mem[0],zero
	movq	xmm1, qword ptr [rbp - 32] ## xmm1 = mem[0],zero
	movaps	xmm2, xmmword ptr [rip + LCPI0_0] ## xmm2 = [1127219200,1160773632,0,0]
	punpckldq	xmm1, xmm2      ## xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
	movapd	xmm3, xmmword ptr [rip + LCPI0_1] ## xmm3 = [4.503600e+15,1.934281e+25]
	subpd	xmm1, xmm3
	haddpd	xmm1, xmm1
	movaps	xmmword ptr [rbp - 64], xmm3 ## 16-byte Spill
	movaps	xmmword ptr [rbp - 80], xmm2 ## 16-byte Spill
	call	_pow
	movsd	qword ptr [rbp - 48], xmm0
	movsd	xmm0, qword ptr [rbp - 48] ## xmm0 = mem[0],zero
	movsd	xmm1, qword ptr [rip + LCPI0_2] ## xmm1 = mem[0],zero
	mulsd	xmm0, xmm1
	movsd	xmm1, qword ptr [rip + LCPI0_3] ## xmm1 = mem[0],zero
	addsd	xmm0, xmm1
	movsd	qword ptr [rbp - 48], xmm0
	mov	rax, qword ptr [rbp - 40]
	movabs	rdx, 4616455406966424136
	mov	qword ptr [rbp - 8], rdx
	mov	qword ptr [rbp - 16], rax
	movsd	xmm0, qword ptr [rbp - 8] ## xmm0 = mem[0],zero
	movq	xmm1, qword ptr [rbp - 16] ## xmm1 = mem[0],zero
	movaps	xmm2, xmmword ptr [rbp - 80] ## 16-byte Reload
	punpckldq	xmm1, xmm2      ## xmm1 = xmm1[0],xmm2[0],xmm1[1],xmm2[1]
	movaps	xmm3, xmmword ptr [rbp - 64] ## 16-byte Reload
	subpd	xmm1, xmm3
	haddpd	xmm1, xmm1
	call	_pow
	movsd	xmm1, qword ptr [rbp - 48] ## xmm1 = mem[0],zero
	movsd	xmm2, qword ptr [rip + LCPI0_4] ## xmm2 = mem[0],zero
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	movsd	qword ptr [rbp - 48], xmm0
	movsd	xmm0, qword ptr [rbp - 48] ## xmm0 = mem[0],zero
	movsd	xmm1, qword ptr [rip + LCPI0_5] ## xmm1 = mem[0],zero
	mulsd	xmm0, xmm1
	movsd	qword ptr [rbp - 48], xmm0
	movsd	xmm0, qword ptr [rbp - 48] ## xmm0 = mem[0],zero
	call	_round
	movsd	xmm1, qword ptr [rip + LCPI0_6] ## xmm1 = mem[0],zero
	movaps	xmm2, xmm0
	subsd	xmm2, xmm1
	cvttsd2si	rax, xmm2
	movabs	rdx, -9223372036854775808
	xor	rax, rdx
	cvttsd2si	rdx, xmm0
	ucomisd	xmm0, xmm1
	cmovb	rax, rdx
	add	rsp, 80
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	lea	rdi, [rip + L_.str]
	mov	dword ptr [rbp - 4], 0
	mov	al, 0
	call	_printf
	mov	ecx, 13
	mov	edi, ecx
	mov	dword ptr [rbp - 8], eax ## 4-byte Spill
	call	__Z10f_sum_eveny
	lea	rdi, [rip + L_.str.1]
	mov	rsi, rax
	mov	al, 0
	call	_printf
	xor	ecx, ecx
	mov	dword ptr [rbp - 12], eax ## 4-byte Spill
	mov	eax, ecx
	add	rsp, 16
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Sum of even fibonacci terms through n=10 for f1:=1, f2:=1, ...:\n"

L_.str.1:                               ## @.str.1
	.asciz	"%lld\n"


.subsections_via_symbols
