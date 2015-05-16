	.file	"kiss_fft.c"
# GNU C (GCC) version 4.9.2 20150304 (prerelease) (x86_64-unknown-linux-gnu)
#	compiled by GNU C version 4.9.2 20150304 (prerelease), GMP version 6.0.0, MPFR version 3.1.2-p11, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -D FIXED_POINT kiss_fft.c --param l1-cache-size=32
# --param l1-cache-line-size=64 --param l2-cache-size=6144 -mtune=haswell
# -march=x86-64 -auxbase-strip kiss_fft_short.s -O3 -ffast-math
# -fomit-frame-pointer -fverbose-asm
# options enabled:  -faggressive-loop-optimizations -fassociative-math
# -fasynchronous-unwind-tables -fauto-inc-dec -fbranch-count-reg
# -fcaller-saves -fcombine-stack-adjustments -fcommon -fcompare-elim
# -fcprop-registers -fcrossjumping -fcse-follow-jumps -fcx-limited-range
# -fdefer-pop -fdelete-null-pointer-checks -fdevirtualize
# -fdevirtualize-speculatively -fdwarf2-cfi-asm -fearly-inlining
# -feliminate-unused-debug-types -fexpensive-optimizations
# -ffinite-math-only -fforward-propagate -ffunction-cse -fgcse
# -fgcse-after-reload -fgcse-lm -fgnu-runtime -fgnu-unique
# -fguess-branch-probability -fhoist-adjacent-loads -fident -fif-conversion
# -fif-conversion2 -findirect-inlining -finline -finline-atomics
# -finline-functions -finline-functions-called-once
# -finline-small-functions -fipa-cp -fipa-cp-clone -fipa-profile
# -fipa-pure-const -fipa-reference -fipa-sra -fira-hoist-pressure
# -fira-share-save-slots -fira-share-spill-slots
# -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
# -fleading-underscore -flifetime-dse -fmerge-constants
# -fmerge-debug-strings -fmove-loop-invariants -fomit-frame-pointer
# -foptimize-sibling-calls -foptimize-strlen -fpartial-inlining -fpeephole
# -fpeephole2 -fpredictive-commoning -fprefetch-loop-arrays
# -freciprocal-math -free -freg-struct-return -freorder-blocks
# -freorder-blocks-and-partition -freorder-functions -frerun-cse-after-loop
# -fsched-critical-path-heuristic -fsched-dep-count-heuristic
# -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
# -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
# -fsched-stalled-insns-dep -fschedule-insns2 -fshow-column -fshrink-wrap
# -fsplit-ivs-in-unroller -fsplit-wide-types -fstrict-aliasing
# -fstrict-overflow -fstrict-volatile-bitfields -fsync-libcalls
# -fthread-jumps -ftoplevel-reorder -ftree-bit-ccp -ftree-builtin-call-dce
# -ftree-ccp -ftree-ch -ftree-coalesce-vars -ftree-copy-prop
# -ftree-copyrename -ftree-cselim -ftree-dce -ftree-dominator-opts
# -ftree-dse -ftree-forwprop -ftree-fre -ftree-loop-distribute-patterns
# -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
# -ftree-loop-optimize -ftree-loop-vectorize -ftree-parallelize-loops=
# -ftree-partial-pre -ftree-phiprop -ftree-pre -ftree-pta -ftree-reassoc
# -ftree-scev-cprop -ftree-sink -ftree-slp-vectorize -ftree-slsr -ftree-sra
# -ftree-switch-conversion -ftree-tail-merge -ftree-ter -ftree-vrp
# -funit-at-a-time -funsafe-math-optimizations -funswitch-loops
# -funwind-tables -fverbose-asm -fzero-initialized-in-bss
# -m128bit-long-double -m64 -m80387 -malign-stringops -mfancy-math-387
# -mfp-ret-in-387 -mfxsr -mglibc -mlong-double-80 -mmmx -mno-sse4
# -mpush-args -mred-zone -msse -msse2 -mtls-direct-seg-refs -mvzeroupper

	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.type	kf_bfly_generic, @function
kf_bfly_generic:
.LFB49:
	.cfi_startproc
# BLOCK 2 freq:9 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%r8d, %r15d	# p, p
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	264(%rdx), %r14	#, twiddles
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	%ecx, %r13d	# m, m
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12	# Fout, Fout
	movslq	%r8d, %rdi	# p,
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	salq	$2, %rdi	#, D.5590
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx	# fstride, fstride
	subq	$72, %rsp	#,
	.cfi_def_cfa_offset 128
	movl	(%rdx), %ebp	# st_13(D)->nfft, Norig
	movl	%r8d, 4(%rsp)	# p, %sfp
	call	malloc	#
	movq	%rax, %rsi	#, scratch
	movq	%rax, 8(%rsp)	# scratch, %sfp
	testl	%r13d, %r13d	# m
# SUCC: 3 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 13 [9.0%]  (CAN_FALLTHRU)
	jle	.L2	#,
# BLOCK 3 freq:8 seq:1
# PRED: 2 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	leal	-1(%r13), %eax	#, D.5592
	movq	%r12, 32(%rsp)	# ivtmp.109, %sfp
	leaq	4(%r12,%rax,4), %rax	#, D.5599
	movl	%ebx, 44(%rsp)	# fstride, %sfp
	movq	%rax, 48(%rsp)	# D.5599, %sfp
	movslq	%r13d, %rax	# m, D.5590
	imull	%ebx, %r13d	# fstride, D.5591
	salq	$2, %rax	#, D.5590
	movl	$0, 40(%rsp)	#, %sfp
	movq	%rax, 16(%rsp)	# D.5590, %sfp
	movl	%r15d, %eax	# p, p
	subl	$1, %eax	#, D.5592
	movl	%r13d, 28(%rsp)	# D.5591, %sfp
	leaq	4(%rsi,%rax,4), %rax	#, D.5599
	movq	%rax, 56(%rsp)	# D.5599, %sfp
	movl	%r15d, %eax	# p, p
	subl	$2, %eax	#, D.5592
	leaq	8(%rsi,%rax,4), %r15	#, D.5599
# SUCC: 4 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
# BLOCK 4 freq:89 seq:2
# PRED: 12 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 3 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
.L3:
	movl	4(%rsp), %ebx	# %sfp, p
	testl	%ebx, %ebx	# p
# SUCC: 5 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 12 [9.0%]  (CAN_FALLTHRU)
	jle	.L7	#,
# BLOCK 5 freq:81 seq:3
# PRED: 4 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	$32767, %eax	#, tmp242
	movq	8(%rsp), %rsi	# %sfp, ivtmp.103
	cltd
	movq	32(%rsp), %rdi	# %sfp, ivtmp.101
	idivl	%ebx	# p
	movq	16(%rsp), %r8	# %sfp, D.5590
# SUCC: 6 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	56(%rsp), %r9	# %sfp, D.5599
# BLOCK 6 freq:900 seq:4
# PRED: 6 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 5 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L4:
	movl	(%rdi), %edx	# MEM[base: _34, offset: 0B], MEM[base: _34, offset: 0B]
	addq	$4, %rsi	#, ivtmp.103
	addq	%r8, %rdi	# D.5590, ivtmp.101
	movswl	%dx, %ecx	# MEM[base: _34, offset: 0B], D.5594
	sarl	$16, %edx	#, D.5594
	imull	%eax, %ecx	# tmp242, D.5594
	imull	%eax, %edx	# tmp242, D.5594
	addl	$16384, %ecx	#, D.5594
	addl	$16384, %edx	#, D.5594
	sarl	$15, %ecx	#, D.5594
	sarl	$15, %edx	#, D.5594
	movw	%cx, -4(%rsi)	# D.5594, MEM[base: _213, offset: 0B]
	movw	%dx, -2(%rsi)	# D.5594, MEM[base: _213, offset: 2B]
	cmpq	%r9, %rsi	# D.5599, ivtmp.103
# SUCC: 6 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 7 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L4	#,
# BLOCK 7 freq:81 seq:5
# PRED: 6 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	movq	8(%rsp), %rax	# %sfp, scratch
	movl	$0, (%rsp)	#, %sfp
	movl	40(%rsp), %r13d	# %sfp, ivtmp.92
	movq	32(%rsp), %rbx	# %sfp, ivtmp.90
	movl	(%rax), %eax	# *scratch_21, *scratch_21
# SUCC: 8 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	%eax, 24(%rsp)	# *scratch_21, %sfp
# BLOCK 8 freq:900 seq:6
# PRED: 7 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 11 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L6:
	movl	24(%rsp), %eax	# %sfp, *scratch_21
	cmpl	$1, 4(%rsp)	#, %sfp
	movl	%eax, (%rbx)	# *scratch_21, MEM[base: _218, offset: 0B]
# SUCC: 9 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 11 [9.0%]  (CAN_FALLTHRU)
	je	.L9	#,
# BLOCK 9 freq:819 seq:7
# PRED: 8 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	8(%rsp), %rax	# %sfp, scratch
	movzwl	(%rbx), %r11d	# MEM[base: _218, offset: 0B], D.5593
	movzwl	2(%rbx), %r10d	# MEM[base: _218, offset: 2B], D.5593
	leaq	4(%rax), %r9	#, ivtmp.79
# SUCC: 10 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	xorl	%eax, %eax	# twidx
# BLOCK 10 freq:9100 seq:8
# PRED: 9 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 10 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L8:
	addl	%r13d, %eax	# ivtmp.92, D.5591
	movswl	(%r9), %r8d	# MEM[base: _240, offset: 0B], D.5594
	movl	%eax, %edx	# D.5591, twidx
	movswl	2(%r9), %ecx	# MEM[base: _240, offset: 2B], D.5594
	subl	%ebp, %edx	# Norig, twidx
	cmpl	%eax, %ebp	# D.5591, Norig
	cmovle	%edx, %eax	# twidx,, twidx
	addq	$4, %r9	#, ivtmp.79
	movslq	%eax, %rdx	# twidx, D.5590
	movl	%ecx, %r12d	# D.5594, D.5594
	leaq	(%r14,%rdx,4), %rdx	#, D.5596
	movswl	(%rdx), %edi	# _69->r, D.5594
	movswl	2(%rdx), %esi	# _69->i, D.5594
	movl	%r8d, %edx	# D.5594, D.5594
	imull	%edi, %edx	# D.5594, D.5594
	imull	%esi, %r12d	# D.5594, D.5594
	imull	%edi, %ecx	# D.5594, D.5594
	imull	%r8d, %esi	# D.5594, D.5594
	subl	%r12d, %edx	# D.5594, D.5594
	addl	$16384, %edx	#, D.5594
	sarl	$15, %edx	#, D.5594
	addl	%edx, %r11d	# D.5594, D.5593
	leal	16384(%rsi,%rcx), %edx	#, D.5594
	movw	%r11w, (%rbx)	# D.5593, MEM[base: _218, offset: 0B]
	sarl	$15, %edx	#, D.5594
	addl	%edx, %r10d	# D.5594, D.5593
	movw	%r10w, 2(%rbx)	# D.5593, MEM[base: _218, offset: 2B]
	cmpq	%r15, %r9	# D.5599, ivtmp.79
# SUCC: 10 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 11 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L8	#,
# BLOCK 11 freq:900 seq:9
# PRED: 8 [9.0%]  (CAN_FALLTHRU) 10 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
.L9:
	addl	$1, (%rsp)	#, %sfp
	addq	16(%rsp), %rbx	# %sfp, ivtmp.90
	movl	(%rsp), %eax	# %sfp, q1
	addl	28(%rsp), %r13d	# %sfp, ivtmp.92
	cmpl	4(%rsp), %eax	# %sfp, q1
# SUCC: 8 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 12 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L6	#,
# BLOCK 12 freq:89 seq:10
# PRED: 4 [9.0%]  (CAN_FALLTHRU) 11 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
.L7:
	addq	$4, 32(%rsp)	#, %sfp
	movl	44(%rsp), %edi	# %sfp, D.5591
	movq	32(%rsp), %rax	# %sfp, ivtmp.109
	addl	%edi, 40(%rsp)	# D.5591, %sfp
	cmpq	48(%rsp), %rax	# %sfp, ivtmp.109
# SUCC: 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 13 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L3	#,
# BLOCK 13 freq:9 seq:11
# PRED: 2 [9.0%]  (CAN_FALLTHRU) 12 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
.L2:
	movq	8(%rsp), %rdi	# %sfp,
	addq	$72, %rsp	#,
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%]  (ABNORMAL,SIBCALL)
	jmp	free	#
	.cfi_endproc
.LFE49:
	.size	kf_bfly_generic, .-kf_bfly_generic
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.text.unlikely
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4,,15
	.type	kf_work, @function
kf_work:
.LFB50:
	.cfi_startproc
# BLOCK 2 freq:1250 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rsi, %r15	# f, f
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdi, %r13	# Fout, Fout
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movslq	%ecx, %rbp	# in_stride,
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%r9, %rbx	# st, st
	subq	$152, %rsp	#,
	.cfi_def_cfa_offset 208
	movl	(%r8), %eax	# *factors_11(D), p
	movl	4(%r8), %edi	# MEM[(int *)factors_11(D) + 4B], m
	movq	%rdx, 32(%rsp)	# fstride, %sfp
	movl	%eax, %edx	# p, D.5757
	movl	%eax, 24(%rsp)	# p, %sfp
	imull	%edi, %edx	# m, D.5757
	movl	%edi, 48(%rsp)	# m, %sfp
	movslq	%edx, %rdx	# D.5757, D.5758
	leaq	0(%r13,%rdx,4), %r12	#, Fout_end
	cmpl	$1, %edi	#, m
# SUCC: 22 [28.0%]  (CAN_FALLTHRU) 3 [72.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L41	#,
# BLOCK 3 freq:900 seq:1
# PRED: 2 [72.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	32(%rsp), %rdi	# %sfp, fstride
	movslq	%ebp, %r14	# in_stride, D.5758
	movq	%r13, 56(%rsp)	# Fout, %sfp
	movslq	48(%rsp), %rdx	# %sfp, D.5758
	movq	%rdi, %rax	# fstride, fstride
	salq	$2, %rax	#, D.5758
	imulq	%rax, %r14	# D.5758, D.5758
	movq	%rax, 40(%rsp)	# D.5758, %sfp
	movslq	24(%rsp), %rax	# %sfp, D.5758
	imulq	%rdi, %rax	# fstride, D.5758
	movl	%ebp, %edi	# in_stride, in_stride
	movq	%r14, (%rsp)	# D.5758, %sfp
	movq	%r13, %r14	# Fout, Fout
	movq	%rsi, %r13	# f, f
	movq	%r14, %rbp	# Fout, Fout
	movl	%edi, %r14d	# in_stride, in_stride
	movq	%rax, 8(%rsp)	# D.5758, %sfp
	leaq	0(,%rdx,4), %rax	#, D.5758
	movq	%rax, 16(%rsp)	# D.5758, %sfp
	leaq	8(%r8), %rax	#, factors
# SUCC: 4 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rax, %r15	# factors, factors
# BLOCK 4 freq:10000 seq:2
# PRED: 3 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L19:
	movq	8(%rsp), %rdx	# %sfp,
	movq	%r13, %rsi	# f,
	movq	%rbp, %rdi	# Fout,
	movq	%rbx, %r9	# st,
	movq	%r15, %r8	# factors,
	movl	%r14d, %ecx	# in_stride,
	call	kf_work	#
	addq	16(%rsp), %rbp	# %sfp, Fout
	addq	(%rsp), %r13	# %sfp, f
	cmpq	%r12, %rbp	# Fout_end, Fout
# SUCC: 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 5 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L19	#,
# BLOCK 5 freq:900 seq:3
# PRED: 4 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	cmpl	$3, 24(%rsp)	#, %sfp
	movq	56(%rsp), %r13	# %sfp, Fout
# SUCC: 25 [20.0%]  (CAN_FALLTHRU) 6 [80.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L21	#,
# BLOCK 6 freq:1000 seq:4
# PRED: 5 [80.0%]  (FALLTHRU,CAN_FALLTHRU) 24 [80.0%]  (CAN_FALLTHRU)
.L44:
# SUCC: 7 [62.5%]  (FALLTHRU,CAN_FALLTHRU) 18 [37.5%]  (CAN_FALLTHRU)
	jle	.L42	#,
# BLOCK 7 freq:625 seq:5
# PRED: 6 [62.5%]  (FALLTHRU,CAN_FALLTHRU)
	movl	24(%rsp), %eax	# %sfp, p
	cmpl	$4, %eax	#, p
# SUCC: 13 [40.0%]  (CAN_FALLTHRU) 8 [60.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L24	#,
# BLOCK 8 freq:375 seq:6
# PRED: 7 [60.0%]  (FALLTHRU,CAN_FALLTHRU)
	cmpl	$5, %eax	#, p
# SUCC: 9 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 28 [33.3%]  (CAN_FALLTHRU)
	jne	.L20	#,
# BLOCK 9 freq:250 seq:7
# PRED: 8 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movl	48(%rsp), %r14d	# %sfp, m
	leaq	264(%rbx), %rax	#, twiddles
	movq	32(%rsp), %rdx	# %sfp, D.5758
	movq	%rax, %rbx	# twiddles, twiddles
	movq	%rax, 120(%rsp)	# twiddles, %sfp
	movslq	%r14d, %rax	# m,
	imulq	%rax, %rdx	# D.5758, D.5758
	salq	$2, %rax	#, D.5758
	leaq	0(%r13,%rax), %r8	#, Fout1
	movq	%r8, 8(%rsp)	# Fout1, %sfp
	addq	%rax, %r8	# D.5758, Fout2
	movq	%r8, 16(%rsp)	# Fout2, %sfp
	addq	%rax, %r8	# D.5758, Fout3
	addq	%r8, %rax	# Fout3, Fout4
	salq	$2, %rdx	#, D.5758
	movq	%rax, 24(%rsp)	# Fout4, %sfp
	movl	%r14d, %eax	# m, m
	leaq	(%rbx,%rdx), %rsi	#, D.5764
	addq	%rsi, %rdx	# D.5764, D.5764
	movswl	(%rsi), %edi	# MEM[(struct kiss_fft_cpx *)_455],
	movzwl	2(%rsi), %ecx	# MEM[(struct kiss_fft_cpx *)_455 + 2B], ya$i
	movzwl	(%rdx), %esi	# MEM[(struct kiss_fft_cpx *)_459], yb$r
	movzwl	2(%rdx), %edx	# MEM[(struct kiss_fft_cpx *)_459 + 2B], yb$i
	testl	%r14d, %r14d	# m
# SUCC: 10 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 12 [9.0%]  (CAN_FALLTHRU)
	jle	.L15	#,
# BLOCK 10 freq:228 seq:8
# PRED: 9 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	%edi, 64(%rsp)	# D.5757, %sfp
	movswl	%si, %edi	# yb$r, D.5757
	subl	$1, %eax	#, D.5759
	movq	16(%rsp), %rsi	# %sfp, Fout2
	movl	%edi, 68(%rsp)	# D.5757, %sfp
	movswl	%cx, %edi	# ya$i, D.5757
	movq	%r8, %r14	# Fout3, Fout3
	movl	%edi, 72(%rsp)	# D.5757, %sfp
	movswl	%dx, %edi	# yb$i, D.5757
	movl	%edi, 80(%rsp)	# D.5757, %sfp
	movq	40(%rsp), %rdi	# %sfp, D.5758
	leaq	4(%r8,%rax,4), %rax	#, D.5764
	movq	%rbx, 48(%rsp)	# twiddles, %sfp
	movq	%rax, 128(%rsp)	# D.5764, %sfp
	movq	$0, 56(%rsp)	#, %sfp
	leaq	(%rdi,%rdi,2), %rdi	#, tmp990
	movq	%r13, (%rsp)	# Fout, %sfp
# SUCC: 11 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rdi, 136(%rsp)	# tmp990, %sfp
# BLOCK 11 freq:2528 seq:9
# PRED: 10 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 11 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L33:
	movq	(%rsp), %r15	# %sfp, Fout
	movq	8(%rsp), %rdi	# %sfp, Fout1
	movq	24(%rsp), %rbx	# %sfp, Fout4
	movq	120(%rsp), %r11	# %sfp, twiddles
	movswl	(%r15), %eax	# MEM[base: Fout_864, offset: 0B], D.5757
	imull	$6553, %eax, %eax	#, D.5757, D.5757
	addl	$16384, %eax	#, D.5757
	sarl	$15, %eax	#, D.5757
	movw	%ax, (%r15)	# D.5757, MEM[base: Fout_864, offset: 0B]
	movswl	2(%r15), %eax	# MEM[base: Fout_864, offset: 2B], D.5757
	imull	$6553, %eax, %eax	#, D.5757, D.5757
	addl	$16384, %eax	#, D.5757
	sarl	$15, %eax	#, D.5757
	movw	%ax, 2(%r15)	# D.5757, MEM[base: Fout_864, offset: 2B]
	movswl	(%rdi), %eax	# MEM[base: Fout1_863, offset: 0B], D.5757
	imull	$6553, %eax, %eax	#, D.5757, D.5757
	addl	$16384, %eax	#, D.5757
	sarl	$15, %eax	#, D.5757
	movw	%ax, (%rdi)	# D.5757, MEM[base: Fout1_863, offset: 0B]
	movswl	2(%rdi), %eax	# MEM[base: Fout1_863, offset: 2B], D.5757
	imull	$6553, %eax, %eax	#, D.5757, D.5757
	addl	$16384, %eax	#, D.5757
	sarl	$15, %eax	#, D.5757
	movw	%ax, 2(%rdi)	# D.5757, MEM[base: Fout1_863, offset: 2B]
	movswl	(%rsi), %eax	# MEM[base: Fout2_862, offset: 0B], D.5757
	imull	$6553, %eax, %eax	#, D.5757, D.5757
	addl	$16384, %eax	#, D.5757
	sarl	$15, %eax	#, D.5757
	movw	%ax, (%rsi)	# D.5757, MEM[base: Fout2_862, offset: 0B]
	movswl	2(%rsi), %eax	# MEM[base: Fout2_862, offset: 2B], D.5757
	imull	$6553, %eax, %eax	#, D.5757, D.5757
	addl	$16384, %eax	#, D.5757
	sarl	$15, %eax	#, D.5757
	movw	%ax, 2(%rsi)	# D.5757, MEM[base: Fout2_862, offset: 2B]
	movswl	(%r14), %eax	# MEM[base: Fout3_861, offset: 0B], D.5757
	imull	$6553, %eax, %eax	#, D.5757, D.5757
	addl	$16384, %eax	#, D.5757
	sarl	$15, %eax	#, D.5757
	movw	%ax, (%r14)	# D.5757, MEM[base: Fout3_861, offset: 0B]
	movswl	2(%r14), %eax	# MEM[base: Fout3_861, offset: 2B], D.5757
	imull	$6553, %eax, %eax	#, D.5757, D.5757
	addl	$16384, %eax	#, D.5757
	sarl	$15, %eax	#, D.5757
	movw	%ax, 2(%r14)	# D.5757, MEM[base: Fout3_861, offset: 2B]
	movswl	(%rbx), %edx	# MEM[base: Fout4_866, offset: 0B], D.5757
	movswl	2(%rbx), %eax	# MEM[base: Fout4_866, offset: 2B], D.5757
	imull	$6553, %edx, %edx	#, D.5757, D.5757
	imull	$6553, %eax, %eax	#, D.5757, D.5757
	addl	$16384, %edx	#, D.5757
	addl	$16384, %eax	#, D.5757
	sarl	$15, %edx	#, D.5757
	sarl	$15, %eax	#, D.5757
	movw	%dx, (%rbx)	# D.5757, MEM[base: Fout4_866, offset: 0B]
	movw	%ax, 2(%rbx)	# D.5757, MEM[base: Fout4_866, offset: 2B]
	movzwl	2(%r15), %ecx	# MEM[base: Fout_864, offset: 2B], scratch$0$i
	movswl	(%rsi), %r12d	# MEM[base: Fout2_862, offset: 0B], D.5757
	movswl	(%rdi), %r8d	# MEM[base: Fout1_863, offset: 0B], D.5757
	movswl	2(%rdi), %ebx	# MEM[base: Fout1_863, offset: 2B], D.5757
	movw	%cx, 32(%rsp)	# scratch$0$i, %sfp
	movq	56(%rsp), %rcx	# %sfp, ivtmp.198
	movl	%r8d, %r15d	# D.5757, D.5757
	movswl	(%r11,%rcx,2), %r10d	# MEM[base: twiddles_46, index: ivtmp.198_320, step: 2, offset: 0B], D.5757
	movswl	(%r11,%rcx), %r13d	# MEM[base: twiddles_46, index: ivtmp.198_320, offset: 0B], D.5757
	movswl	2(%r11,%rcx), %ebp	# MEM[base: twiddles_46, index: ivtmp.198_320, offset: 2B], D.5757
	movl	%r10d, 108(%rsp)	# D.5757, %sfp
	movswl	(%r14), %r10d	# MEM[base: Fout3_861, offset: 0B], D.5757
	movswl	2(%r11,%rcx,2), %r9d	# MEM[base: twiddles_46, index: ivtmp.198_320, step: 2, offset: 2B], D.5757
	movl	%r15d, 104(%rsp)	# D.5757, %sfp
	movswl	2(%rsi), %r8d	# MEM[base: Fout2_862, offset: 2B], D.5757
	movswl	2(%r14), %esi	# MEM[base: Fout3_861, offset: 2B], D.5757
	movl	%r10d, 96(%rsp)	# D.5757, %sfp
	movq	48(%rsp), %r10	# %sfp, ivtmp.203
	movswl	(%r10), %edi	# MEM[base: _939, offset: 0B], D.5757
	movl	%edi, 88(%rsp)	# D.5757, %sfp
	movswl	2(%r10), %edi	# MEM[base: _939, offset: 2B], D.5757
	movswl	(%r11,%rcx,4), %r10d	# MEM[base: twiddles_46, index: ivtmp.198_320, step: 4, offset: 0B], D.5757
	movswl	2(%r11,%rcx,4), %r11d	# MEM[base: twiddles_46, index: ivtmp.198_320, step: 4, offset: 2B], D.5757
	movl	%r15d, %ecx	# D.5757, D.5757
	movl	%ebx, %r15d	# D.5757, D.5757
	imull	%ebp, %r15d	# D.5757, D.5757
	imull	%r13d, %ecx	# D.5757, D.5757
	subl	%r15d, %ecx	# D.5757, D.5757
	movl	%edx, %r15d	# D.5757, D.5757
	addl	$16384, %ecx	#, D.5757
	imull	%r10d, %r15d	# D.5757, D.5757
	sarl	$15, %ecx	#, D.5757
	imull	%r13d, %ebx	# D.5757, D.5757
	imull	104(%rsp), %ebp	# %sfp, D.5757
	movl	%ecx, 100(%rsp)	# D.5757, %sfp
	movl	%r15d, %ecx	# D.5757, D.5757
	imull	%r11d, %edx	# D.5757, D.5757
	movl	%eax, %r15d	# D.5757, D.5757
	imull	%r11d, %r15d	# D.5757, D.5757
	imull	%r10d, %eax	# D.5757, D.5757
	leal	16384(%rbp,%rbx), %ebx	#, D.5757
	movl	%ebx, %ebp	# D.5757, D.5757
	subl	%r15d, %ecx	# D.5757, D.5757
	sarl	$15, %ebp	#, D.5757
	addl	$16384, %ecx	#, D.5757
	movl	%ebp, 116(%rsp)	# D.5757, %sfp
	leal	16384(%rdx,%rax), %ebx	#, D.5757
	sarl	$15, %ecx	#, D.5757
	movl	%ebp, %eax	# D.5757, tmp1356
	movl	108(%rsp), %ebp	# %sfp, D.5757
	movl	%ecx, %r15d	# D.5757, D.5760
	addw	100(%rsp), %r15w	# %sfp, D.5760
	movl	%ecx, 112(%rsp)	# D.5757, %sfp
	sarl	$15, %ebx	#, D.5757
	addl	%ebx, %eax	# D.5757, D.5760
	movl	%ebp, %r11d	# D.5757, D.5757
	movl	%r15d, %ecx	# D.5760, D.5760
	imull	%r12d, %r11d	# D.5757, D.5757
	movl	%r8d, %r15d	# D.5757, D.5757
	imull	%r9d, %r15d	# D.5757, D.5757
	imull	%ebp, %r8d	# D.5757, D.5757
	movl	%r11d, %edx	# D.5757, D.5757
	movl	96(%rsp), %r11d	# %sfp, D.5757
	imull	%r12d, %r9d	# D.5757, D.5757
	imull	88(%rsp), %r11d	# %sfp, D.5757
	subl	%r15d, %edx	# D.5757, D.5757
	movl	%esi, %r15d	# D.5757, D.5757
	imull	%edi, %r15d	# D.5757, D.5757
	addl	$16384, %edx	#, D.5757
	imull	96(%rsp), %edi	# %sfp, D.5757
	movl	%edx, %r13d	# D.5757, D.5757
	imull	88(%rsp), %esi	# %sfp, D.5757
	movl	%r11d, %edx	# D.5757, D.5757
	sarl	$15, %r13d	#, D.5757
	subl	%r15d, %edx	# D.5757, D.5757
	movl	%r13d, 104(%rsp)	# D.5757, %sfp
	movl	68(%rsp), %r11d	# %sfp, D.5757
	addl	$16384, %edx	#, D.5757
	leal	16384(%rdi,%rsi), %edi	#, D.5757
	movl	%edx, %r15d	# D.5757, D.5757
	sarl	$15, %r15d	#, D.5757
	sarl	$15, %edi	#, D.5757
	leal	16384(%r9,%r8), %edx	#, D.5757
	movl	%r15d, %r13d	# D.5757, D.5757
	movzwl	104(%rsp), %r15d	# %sfp, tmp1364
	movzwl	32(%rsp), %r9d	# %sfp, scratch$0$i
	sarl	$15, %edx	#, D.5757
	leal	(%rdi,%rdx), %r8d	#, D.5760
	leal	0(%r13,%r15), %r10d	#, D.5760
	movq	(%rsp), %r15	# %sfp, Fout
	movzwl	(%r15), %ebp	# MEM[base: Fout_864, offset: 0B], D.5760
	leal	(%r10,%rbp), %esi	#, D.5760
	addl	%ecx, %esi	# D.5760, tmp1074
	movw	%si, (%r15)	# tmp1074, MEM[base: Fout_864, offset: 0B]
	leal	(%r8,%r9), %esi	#, D.5760
	movswl	%cx, %r9d	# D.5760, D.5757
	movswl	%r8w, %r8d	# D.5760, D.5757
	addl	%eax, %esi	# D.5760, tmp1076
	movw	%si, 2(%r15)	# tmp1076, MEM[base: Fout_864, offset: 2B]
	movl	%r9d, %esi	# D.5757, D.5757
	movswl	%r10w, %r9d	# D.5760, D.5757
	movl	%r11d, %r10d	# D.5757, D.5757
	imull	%r9d, %r10d	# D.5757, D.5757
	movl	64(%rsp), %r15d	# %sfp, D.5757
	movl	%esi, 96(%rsp)	# D.5757, %sfp
	subl	%edi, %edx	# D.5757, D.5760
	movswl	%dx, %edi	# D.5760, D.5757
	movl	%r10d, %r12d	# D.5757, D.5757
	movl	%r11d, %r10d	# D.5757, D.5757
	addl	$16384, %r12d	#, D.5757
	imull	%r8d, %r10d	# D.5757, D.5757
	movl	%r15d, %r11d	# D.5757, D.5757
	sarl	$15, %r12d	#, D.5757
	leal	0(%rbp,%r12), %ecx	#, D.5760
	movl	%esi, %r12d	# D.5757, D.5757
	movswl	%ax, %esi	# D.5760, D.5757
	movzwl	32(%rsp), %eax	# %sfp, scratch$0$i
	imull	%esi, %r11d	# D.5757, D.5757
	addl	$16384, %r10d	#, D.5757
	imull	%r15d, %r12d	# D.5757, D.5757
	movzwl	116(%rsp), %r15d	# %sfp, D.5760
	sarl	$15, %r10d	#, D.5757
	movl	%edi, 88(%rsp)	# D.5757, %sfp
	movl	72(%rsp), %edx	# %sfp, D.5757
	addl	%r10d, %eax	# D.5757, D.5760
	movl	%r11d, %r10d	# D.5757, D.5757
	addl	$16384, %r10d	#, D.5757
	addl	$16384, %r12d	#, D.5757
	sarl	$15, %r10d	#, D.5757
	subl	%ebx, %r15d	# D.5757, D.5760
	sarl	$15, %r12d	#, D.5757
	addl	%eax, %r10d	# D.5760, D.5760
	movswl	%r15w, %ebx	# D.5760,
	movl	%edx, %eax	# D.5757, D.5757
	imull	%ebx, %eax	# D.5757, D.5757
	addl	%ecx, %r12d	# D.5760, D.5760
	movl	%eax, %r11d	# D.5757, D.5757
	movl	80(%rsp), %eax	# %sfp, D.5757
	addl	$16384, %r11d	#, D.5757
	movl	%r11d, %r15d	# D.5757, D.5757
	sarl	$15, %r15d	#, D.5757
	imull	%edi, %eax	# D.5757, D.5757
	movl	%r15d, %ecx	# D.5757, D.5757
	movl	%eax, %r11d	# D.5757, D.5757
	addl	$16384, %r11d	#, D.5757
	movl	%r11d, %r15d	# D.5757, D.5757
	sarl	$15, %r15d	#, D.5757
	leal	(%rcx,%r15), %r11d	#, D.5760
	movzwl	100(%rsp), %r15d	# %sfp, D.5760
	subw	112(%rsp), %r15w	# %sfp, D.5760
	movswl	%r15w, %eax	# D.5760,
	movzwl	104(%rsp), %r15d	# %sfp, D.5760
	subl	%r13d, %r15d	# D.5757, D.5760
	movl	%edx, %r13d	# D.5757, D.5757
	movl	88(%rsp), %edx	# %sfp, D.5757
	imull	%eax, %r13d	# D.5757, D.5757
	movswl	%r15w, %edi	# D.5760,
	movl	%r13d, %ecx	# D.5757, D.5757
	addl	$16384, %ecx	#, D.5757
	movl	%ecx, %r15d	# D.5757, D.5757
	movl	80(%rsp), %ecx	# %sfp, D.5757
	sarl	$15, %r15d	#, D.5757
	imull	%edi, %ecx	# D.5757, D.5757
	addl	$16384, %ecx	#, D.5757
	sarl	$15, %ecx	#, D.5757
	addl	%r15d, %ecx	# D.5757, D.5760
	movl	%r12d, %r15d	# D.5760, tmp1107
	subl	%r11d, %r15d	# D.5760, tmp1107
	addl	%r12d, %r11d	# D.5760, tmp1109
	movq	24(%rsp), %r12	# %sfp, Fout4
	movl	%r15d, %r13d	# tmp1107, tmp1107
	movq	8(%rsp), %r15	# %sfp, Fout1
	movw	%r13w, (%r15)	# tmp1107, MEM[base: Fout1_863, offset: 0B]
	leal	(%r10,%rcx), %r13d	#, tmp1108
	subl	%ecx, %r10d	# D.5760, tmp1110
	movw	%r13w, 2(%r15)	# tmp1108, MEM[base: Fout1_863, offset: 2B]
	movl	72(%rsp), %r13d	# %sfp, D.5757
	movw	%r11w, (%r12)	# tmp1109, MEM[base: Fout4_866, offset: 0B]
	movl	64(%rsp), %r11d	# %sfp, D.5757
	movw	%r10w, 2(%r12)	# tmp1110, MEM[base: Fout4_866, offset: 2B]
	movl	68(%rsp), %r10d	# %sfp, D.5757
	imull	%r13d, %edx	# D.5757, D.5757
	imull	%r11d, %r9d	# D.5757, D.5757
	imull	%r11d, %r8d	# D.5757, D.5757
	imull	%r10d, %esi	# D.5757, D.5757
	addl	$16384, %edx	#, D.5757
	addl	$16384, %r9d	#, D.5757
	imull	%r13d, %edi	# D.5757, D.5757
	sarl	$15, %edx	#, D.5757
	sarl	$15, %r9d	#, D.5757
	addl	$16384, %r8d	#, D.5757
	addl	%r9d, %ebp	# D.5757, D.5760
	movl	96(%rsp), %r9d	# %sfp, D.5757
	sarl	$15, %r8d	#, D.5757
	addl	$16384, %esi	#, D.5757
	addw	32(%rsp), %r8w	# %sfp, D.5760
	sarl	$15, %esi	#, D.5757
	addl	$16384, %edi	#, D.5757
	sarl	$15, %edi	#, D.5757
	imull	%r10d, %r9d	# D.5757, D.5757
	addl	%esi, %r8d	# D.5757, D.5760
	movq	16(%rsp), %rsi	# %sfp, Fout2
	movl	%r9d, %ecx	# D.5757, D.5757
	movl	80(%rsp), %r9d	# %sfp, D.5757
	addl	$16384, %ecx	#, D.5757
	sarl	$15, %ecx	#, D.5757
	addl	%ecx, %ebp	# D.5757, D.5760
	imull	%r9d, %ebx	# D.5757, D.5757
	imull	%r9d, %eax	# D.5757, D.5757
	addl	$16384, %ebx	#, D.5757
	sarl	$15, %ebx	#, D.5757
	addl	$16384, %eax	#, D.5757
	subl	%ebx, %edx	# D.5757, D.5760
	sarl	$15, %eax	#, D.5757
	leal	0(%rbp,%rdx), %ecx	#, tmp1137
	subl	%edi, %eax	# D.5757, D.5760
	subl	%edx, %ebp	# D.5760, tmp1139
	movw	%cx, (%rsi)	# tmp1137, MEM[base: Fout2_862, offset: 0B]
	leal	(%r8,%rax), %ecx	#, tmp1138
	movq	%r15, %rdx	# Fout1, Fout1
	subl	%eax, %r8d	# D.5760, tmp1140
	movw	%cx, 2(%rsi)	# tmp1138, MEM[base: Fout2_862, offset: 2B]
	addq	$4, %rdx	#, Fout1
	addq	$4, %rsi	#, Fout2
	addq	$4, %r12	#, Fout4
	movw	%bp, (%r14)	# tmp1139, MEM[base: Fout3_861, offset: 0B]
	movq	40(%rsp), %rax	# %sfp, D.5758
	addq	$4, %r14	#, Fout3
	addq	$4, (%rsp)	#, %sfp
	movw	%r8w, -2(%r14)	# tmp1140, MEM[base: Fout3_861, offset: 2B]
	movq	%rdx, 8(%rsp)	# Fout1, %sfp
	movq	%rsi, 16(%rsp)	# Fout2, %sfp
	movq	%r12, 24(%rsp)	# Fout4, %sfp
	addq	%rax, 56(%rsp)	# D.5758, %sfp
	movq	136(%rsp), %rax	# %sfp, tmp990
	addq	%rax, 48(%rsp)	# tmp990, %sfp
	cmpq	128(%rsp), %r14	# %sfp, Fout3
# SUCC: 11 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 12 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L33	#,
# BLOCK 12 freq:1000 seq:10
# PRED: 21 [100.0%]  (CAN_FALLTHRU) 9 [9.0%]  (CAN_FALLTHRU) 15 [9.0%]  (CAN_FALLTHRU) 11 [9.0%]  (FALLTHRU,CAN_FALLTHRU) 27 [100.0%]  (CAN_FALLTHRU)
.L15:
	addq	$152, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%] 
	ret
# BLOCK 13 freq:250 seq:11
# PRED: 7 [40.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L24:
	.cfi_restore_state
	movslq	48(%rsp), %rax	# %sfp, k
	movq	%rax, %rsi	# k, k
	movq	%rax, 72(%rsp)	# k, %sfp
	leaq	264(%rbx), %rax	#, tw3
	movq	%rax, %rdi	# tw3, tw3
	movq	%rsi, %rax	# k, k
	movq	32(%rsp), %rsi	# %sfp, fstride
	salq	$2, %rax	#, D.5758
	movq	%rdi, (%rsp)	# tw3, %sfp
	leaq	0(%r13,%rax), %r11	#, ivtmp.169
	leaq	(%r11,%rax), %rbp	#, ivtmp.171
	leaq	(%rsi,%rsi,2), %rdx	#, tmp899
	leaq	0(,%rsi,8), %rcx	#, D.5758
	leaq	0(,%rdx,4), %rsi	#, tmp900
	movq	%rcx, 80(%rsp)	# D.5758, %sfp
	movq	%rsi, 88(%rsp)	# tmp900, %sfp
	movl	4(%rbx), %esi	# st_33(D)->inverse, D.5757
	leaq	0(%rbp,%rax), %r8	#, ivtmp.173
	movl	%esi, 96(%rsp)	# D.5757, %sfp
	movq	%rdi, %rsi	# tw3, tw3
# SUCC: 16 [100.0%]  (CAN_FALLTHRU)
	jmp	.L32	#
# BLOCK 14 freq:1389 seq:12
# PRED: 16 [50.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L43:
	movzwl	68(%rsp), %edx	# %sfp, D.5760
	subl	%r9d, %eax	# D.5760, tmp979
	movw	%ax, (%r11)	# tmp979, MEM[base: _154, offset: 0B]
	movl	%edx, %eax	# D.5760, D.5760
	addl	%r12d, %eax	# D.5760, tmp980
	movw	%ax, 2(%r11)	# tmp980, MEM[base: _154, offset: 2B]
	movl	%ebx, %eax	# D.5760, D.5760
	addl	%eax, %r9d	# D.5760, tmp981
	movl	%edx, %eax	# D.5760, tmp982
	subl	%r12d, %eax	# D.5760, tmp982
	movw	%r9w, (%r8)	# tmp981, MEM[base: _960, offset: 0B]
# SUCC: 15 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movw	%ax, 2(%r8)	# tmp982, MEM[base: _960, offset: 2B]
# BLOCK 15 freq:2778 seq:13
# PRED: 14 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 17 [100.0%]  (CAN_FALLTHRU)
.L31:
	addq	$4, %r13	#, Fout
	addq	$4, %r11	#, ivtmp.169
	addq	$4, %rbp	#, ivtmp.171
	addq	$4, %r8	#, ivtmp.173
	subq	$1, 72(%rsp)	#, %sfp
# SUCC: 16 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 12 [9.0%]  (CAN_FALLTHRU)
	je	.L15	#,
# BLOCK 16 freq:2778 seq:14
# PRED: 15 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 13 [100.0%]  (CAN_FALLTHRU)
.L32:
	movswl	0(%r13), %edx	# MEM[base: Fout_278, offset: 0B], D.5757
	movl	%edx, %eax	# D.5757, tmp903
	sall	$13, %eax	#, tmp903
	subl	%edx, %eax	# D.5757, D.5757
	movswl	2(%r13), %edx	# MEM[base: Fout_278, offset: 2B], D.5757
	addl	$16384, %eax	#, D.5757
	sarl	$15, %eax	#, D.5757
	movw	%ax, 0(%r13)	# D.5757, MEM[base: Fout_278, offset: 0B]
	movl	%edx, %eax	# D.5757, tmp909
	sall	$13, %eax	#, tmp909
	subl	%edx, %eax	# D.5757, D.5757
	addl	$16384, %eax	#, D.5757
	sarl	$15, %eax	#, D.5757
	movw	%ax, 2(%r13)	# D.5757, MEM[base: Fout_278, offset: 2B]
	movswl	(%r11), %edx	# MEM[base: _154, offset: 0B], D.5757
	movl	%edx, %eax	# D.5757, tmp915
	sall	$13, %eax	#, tmp915
	subl	%edx, %eax	# D.5757, D.5757
	movswl	2(%r11), %edx	# MEM[base: _154, offset: 2B], D.5757
	addl	$16384, %eax	#, D.5757
	sarl	$15, %eax	#, D.5757
	movw	%ax, (%r11)	# D.5757, MEM[base: _154, offset: 0B]
	movl	%edx, %eax	# D.5757, tmp921
	sall	$13, %eax	#, tmp921
	subl	%edx, %eax	# D.5757, D.5757
	addl	$16384, %eax	#, D.5757
	sarl	$15, %eax	#, D.5757
	movw	%ax, 2(%r11)	# D.5757, MEM[base: _154, offset: 2B]
	movswl	0(%rbp), %edx	# MEM[base: _981, offset: 0B], D.5757
	movl	%edx, %eax	# D.5757, tmp927
	sall	$13, %eax	#, tmp927
	subl	%edx, %eax	# D.5757, D.5757
	movswl	2(%rbp), %edx	# MEM[base: _981, offset: 2B], D.5757
	addl	$16384, %eax	#, D.5757
	sarl	$15, %eax	#, D.5757
	movw	%ax, 0(%rbp)	# D.5757, MEM[base: _981, offset: 0B]
	movl	%edx, %eax	# D.5757, tmp933
	sall	$13, %eax	#, tmp933
	subl	%edx, %eax	# D.5757, D.5757
	addl	$16384, %eax	#, D.5757
	sarl	$15, %eax	#, D.5757
	movw	%ax, 2(%rbp)	# D.5757, MEM[base: _981, offset: 2B]
	movswl	(%r8), %eax	# MEM[base: _960, offset: 0B], D.5757
	movl	%eax, %ecx	# D.5757, tmp939
	sall	$13, %ecx	#, tmp939
	subl	%eax, %ecx	# D.5757, D.5757
	movswl	2(%r8), %eax	# MEM[base: _960, offset: 2B], D.5757
	addl	$16384, %ecx	#, D.5757
	sarl	$15, %ecx	#, D.5757
	movw	%cx, (%r8)	# D.5757, MEM[base: _960, offset: 0B]
	movl	%eax, %edx	# D.5757, tmp944
	sall	$13, %edx	#, tmp944
	subl	%eax, %edx	# D.5757, D.5757
	addl	$16384, %edx	#, D.5757
	sarl	$15, %edx	#, D.5757
	movw	%dx, 2(%r8)	# D.5757, MEM[base: _960, offset: 2B]
	movswl	(%r11), %eax	# MEM[base: _154, offset: 0B], D.5757
	movswl	(%rsi), %ebx	# MEM[base: tw3_335, offset: 0B], D.5757
	movswl	2(%r11), %r15d	# MEM[base: _154, offset: 2B], D.5757
	movswl	0(%rbp), %r14d	# MEM[base: _981, offset: 0B], D.5757
	movl	%eax, 8(%rsp)	# D.5757, %sfp
	movq	(%rsp), %rax	# %sfp, tw3
	movl	%ebx, 16(%rsp)	# D.5757, %sfp
	movswl	2(%rsi), %ebx	# MEM[base: tw3_335, offset: 2B], D.5757
	movswl	2(%rbp), %r10d	# MEM[base: _981, offset: 2B], D.5757
	movl	%r15d, 24(%rsp)	# D.5757, %sfp
	movswl	(%rdi), %r12d	# MEM[base: tw3_356, offset: 0B], D.5757
	movswl	(%rax), %r15d	# MEM[base: tw3_376, offset: 0B], D.5757
	movswl	2(%rax), %eax	# MEM[base: tw3_376, offset: 2B], D.5757
	movl	%ebx, 32(%rsp)	# D.5757, %sfp
	movswl	2(%rdi), %ebx	# MEM[base: tw3_356, offset: 2B], D.5757
	movl	%r10d, %r9d	# D.5757, D.5757
	movl	%eax, 48(%rsp)	# D.5757, %sfp
	movl	%r14d, %eax	# D.5757, D.5757
	imull	%r12d, %eax	# D.5757, D.5757
	imull	%ebx, %r9d	# D.5757, D.5757
	imull	%r14d, %ebx	# D.5757, D.5757
	imull	%r12d, %r10d	# D.5757, D.5757
	subl	%r9d, %eax	# D.5757, D.5757
	movzwl	0(%r13), %r9d	# MEM[base: Fout_278, offset: 0B], D.5760
	addl	$16384, %eax	#, D.5757
	leal	16384(%rbx,%r10), %r10d	#, D.5757
	sarl	$15, %eax	#, D.5757
	movl	%r15d, %ebx	# D.5757, D.5757
	sarl	$15, %r10d	#, D.5757
	imull	%ecx, %ebx	# D.5757, D.5757
	subl	%eax, %r9d	# D.5757, D.5760
	movw	%r9w, 64(%rsp)	# D.5760, %sfp
	movzwl	2(%r13), %r9d	# MEM[base: Fout_278, offset: 2B], D.5760
	movl	48(%rsp), %r14d	# %sfp, D.5757
	movl	%r15d, 56(%rsp)	# D.5757, %sfp
	movl	8(%rsp), %r12d	# %sfp, D.5757
	imull	16(%rsp), %r12d	# %sfp, D.5757
	subl	%r10d, %r9d	# D.5757, D.5760
	movl	24(%rsp), %r15d	# %sfp, D.5757
	movw	%r9w, 68(%rsp)	# D.5760, %sfp
	movl	24(%rsp), %r9d	# %sfp, D.5757
	imull	%edx, %r14d	# D.5757, D.5757
	imull	32(%rsp), %r9d	# %sfp, D.5757
	imull	48(%rsp), %ecx	# %sfp, D.5757
	imull	16(%rsp), %r15d	# %sfp, D.5757
	subl	%r14d, %ebx	# D.5757, D.5757
	subl	%r9d, %r12d	# D.5757, D.5757
	movl	32(%rsp), %r9d	# %sfp, D.5757
	addl	$16384, %ebx	#, D.5757
	imull	8(%rsp), %r9d	# %sfp, D.5757
	addl	$16384, %r12d	#, D.5757
	sarl	$15, %ebx	#, D.5757
	imull	56(%rsp), %edx	# %sfp, D.5757
	sarl	$15, %r12d	#, D.5757
	addw	0(%r13), %ax	# MEM[base: Fout_278, offset: 0B], D.5760
	leal	(%rbx,%r12), %r14d	#, D.5760
	subl	%ebx, %r12d	# D.5757, D.5760
	addw	2(%r13), %r10w	# MEM[base: Fout_278, offset: 2B], D.5760
	movq	88(%rsp), %rbx	# %sfp, tmp900
	leal	16384(%rcx,%rdx), %edx	#, D.5757
	addq	40(%rsp), %rsi	# %sfp, tw3
	sarl	$15, %edx	#, D.5757
	movw	%ax, 0(%r13)	# D.5760, MEM[base: Fout_278, offset: 0B]
	addq	80(%rsp), %rdi	# %sfp, tw3
	subl	%r14d, %eax	# D.5760, tmp977
	movw	%r10w, 2(%r13)	# D.5760, MEM[base: Fout_278, offset: 2B]
	leal	16384(%r9,%r15), %r9d	#, D.5757
	movw	%ax, 0(%rbp)	# tmp977, MEM[base: _981, offset: 0B]
	sarl	$15, %r9d	#, D.5757
	leal	(%rdx,%r9), %ecx	#, D.5760
	subl	%edx, %r9d	# D.5757, D.5760
	movl	96(%rsp), %edx	# %sfp,
	subl	%ecx, %r10d	# D.5760, tmp978
	addq	%rbx, (%rsp)	# tmp900, %sfp
	movw	%r10w, 2(%rbp)	# tmp978, MEM[base: _981, offset: 2B]
	movzwl	64(%rsp), %ebx	# %sfp, D.5760
	addw	%r14w, 0(%r13)	# D.5760, MEM[base: Fout_278, offset: 0B]
	addw	%cx, 2(%r13)	# D.5760, MEM[base: Fout_278, offset: 2B]
	movl	%ebx, %eax	# D.5760, tmp979
	testl	%edx, %edx	#
# SUCC: 14 [50.0%]  (CAN_FALLTHRU) 17 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L43	#,
# BLOCK 17 freq:1389 seq:15
# PRED: 16 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	movzwl	68(%rsp), %edx	# %sfp, D.5760
	addl	%r9d, %eax	# D.5760, tmp983
	movw	%ax, (%r11)	# tmp983, MEM[base: _154, offset: 0B]
	movl	%edx, %eax	# D.5760, tmp984
	subl	%r12d, %eax	# D.5760, tmp984
	movw	%ax, 2(%r11)	# tmp984, MEM[base: _154, offset: 2B]
	movl	%ebx, %eax	# D.5760, tmp985
	subl	%r9d, %eax	# D.5760, tmp985
	movw	%ax, (%r8)	# tmp985, MEM[base: _960, offset: 0B]
	movl	%edx, %eax	# D.5760, D.5760
	addl	%eax, %r12d	# D.5760, tmp986
	movw	%r12w, 2(%r8)	# tmp986, MEM[base: _960, offset: 2B]
# SUCC: 15 [100.0%]  (CAN_FALLTHRU)
	jmp	.L31	#
# BLOCK 18 freq:375 seq:16
# PRED: 6 [37.5%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L42:
	cmpl	$2, 24(%rsp)	#, %sfp
# SUCC: 19 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 28 [33.3%]  (CAN_FALLTHRU)
	jne	.L20	#,
# BLOCK 19 freq:250 seq:17
# PRED: 18 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movl	48(%rsp), %edi	# %sfp, m
	addq	$264, %rbx	#, tw1
	movq	40(%rsp), %rcx	# %sfp, D.5758
	movslq	%edi, %rax	# m,
	leaq	0(%r13,%rax,4), %rsi	#, Fout2
	movl	%edi, %eax	# m, m
	subl	$1, %eax	#, D.5759
# SUCC: 20 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	leaq	4(%r13,%rax,4), %rdi	#, D.5764
# BLOCK 20 freq:2778 seq:18
# PRED: 19 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 20 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L26:
	movswl	0(%r13), %edx	# MEM[base: Fout_54, offset: 0B], D.5757
	addq	$4, %rsi	#, Fout2
	movl	%edx, %eax	# D.5757, tmp786
	sall	$14, %eax	#, tmp786
	subl	%edx, %eax	# D.5757, D.5757
	movswl	2(%r13), %edx	# MEM[base: Fout_54, offset: 2B], D.5757
	addl	$16384, %eax	#, D.5757
	sarl	$15, %eax	#, D.5757
	movw	%ax, 0(%r13)	# D.5757, MEM[base: Fout_54, offset: 0B]
	movl	%edx, %eax	# D.5757, tmp792
	sall	$14, %eax	#, tmp792
	subl	%edx, %eax	# D.5757, D.5757
	addl	$16384, %eax	#, D.5757
	sarl	$15, %eax	#, D.5757
	movw	%ax, 2(%r13)	# D.5757, MEM[base: Fout_54, offset: 2B]
	movswl	-4(%rsi), %eax	# MEM[base: Fout2_67, offset: 0B], D.5757
	movswl	-2(%rsi), %edx	# MEM[base: Fout2_67, offset: 2B], D.5757
	movl	%eax, %r8d	# D.5757, tmp798
	sall	$14, %r8d	#, tmp798
	subl	%eax, %r8d	# D.5757, D.5757
	movl	%edx, %eax	# D.5757, tmp803
	sall	$14, %eax	#, tmp803
	addl	$16384, %r8d	#, D.5757
	subl	%edx, %eax	# D.5757, D.5757
	sarl	$15, %r8d	#, D.5757
	addl	$16384, %eax	#, D.5757
	movw	%r8w, -4(%rsi)	# D.5757, MEM[base: Fout2_67, offset: 0B]
	movl	%r8d, %edx	# D.5757, D.5757
	sarl	$15, %eax	#, D.5757
	movw	%ax, -2(%rsi)	# D.5757, MEM[base: Fout2_67, offset: 2B]
	movswl	(%rbx), %r9d	# MEM[base: tw1_81, offset: 0B], D.5757
	movl	%eax, %r11d	# D.5757, D.5757
	movswl	2(%rbx), %r10d	# MEM[base: tw1_81, offset: 2B], D.5757
	addq	%rcx, %rbx	# D.5758, tw1
	imull	%r9d, %edx	# D.5757, D.5757
	imull	%r10d, %r11d	# D.5757, D.5757
	imull	%r10d, %r8d	# D.5757, D.5757
	imull	%r9d, %eax	# D.5757, D.5757
	subl	%r11d, %edx	# D.5757, D.5757
	movzwl	0(%r13), %r11d	# MEM[base: Fout_54, offset: 0B], D.5760
	addl	$16384, %edx	#, D.5757
	leal	16384(%r8,%rax), %eax	#, D.5757
	sarl	$15, %edx	#, D.5757
	sarl	$15, %eax	#, D.5757
	subl	%edx, %r11d	# D.5757, D.5760
	movw	%r11w, -4(%rsi)	# D.5760, MEM[base: Fout2_67, offset: 0B]
	movzwl	2(%r13), %r8d	# MEM[base: Fout_54, offset: 2B], D.5760
	subl	%eax, %r8d	# D.5757, D.5760
	movw	%r8w, -2(%rsi)	# D.5760, MEM[base: Fout2_67, offset: 2B]
	addw	%dx, 0(%r13)	# D.5757, MEM[base: Fout_54, offset: 0B]
	addw	%ax, 2(%r13)	# D.5757, MEM[base: Fout_54, offset: 2B]
	addq	$4, %r13	#, Fout
	cmpq	%rdi, %r13	# D.5764, Fout
# SUCC: 20 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 21 [9.0%]  (FALLTHRU)
	jne	.L26	#,
# BLOCK 21 freq:250 seq:19
# PRED: 20 [9.0%]  (FALLTHRU)
# SUCC: 12 [100.0%]  (CAN_FALLTHRU)
	jmp	.L15	#
# BLOCK 22 freq:350 seq:20
# PRED: 2 [28.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L41:
	movq	32(%rsp), %rax	# %sfp, fstride
	movq	%r13, %rdx	# Fout, Fout
	salq	$2, %rax	#, D.5758
	imulq	%rax, %rbp	# D.5758, D.5758
# SUCC: 23 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rax, 40(%rsp)	# D.5758, %sfp
# BLOCK 23 freq:3889 seq:21
# PRED: 22 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 23 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L17:
	movl	(%r15), %eax	# MEM[base: f_3, offset: 0B], MEM[base: f_3, offset: 0B]
	addq	$4, %rdx	#, Fout
	addq	%rbp, %r15	# D.5758, f
	movl	%eax, -4(%rdx)	# MEM[base: f_3, offset: 0B], MEM[base: Fout_1, offset: 0B]
	cmpq	%r12, %rdx	# Fout_end, Fout
# SUCC: 23 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 24 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L17	#,
# BLOCK 24 freq:350 seq:22
# PRED: 23 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	cmpl	$3, 24(%rsp)	#, %sfp
# SUCC: 25 [20.0%]  (FALLTHRU,CAN_FALLTHRU) 6 [80.0%]  (CAN_FALLTHRU)
	jne	.L44	#,
# BLOCK 25 freq:250 seq:23
# PRED: 5 [20.0%]  (CAN_FALLTHRU) 24 [20.0%]  (FALLTHRU,CAN_FALLTHRU)
.L21:
	movslq	48(%rsp), %rax	# %sfp, m
	leaq	264(%rbx), %rbp	#, tw2
	movq	%rbp, %r15	# tw2, tw2
	movq	%rax, %rdi	# m, m
	movq	%rax, 8(%rsp)	# m, %sfp
	movq	32(%rsp), %rax	# %sfp, fstride
	leaq	0(%r13,%rdi,4), %rdx	#, ivtmp.145
	leaq	0(%r13,%rdi,8), %r10	#, ivtmp.147
	leaq	0(,%rax,8), %rsi	#, D.5758
	imulq	%rdi, %rax	# m, D.5758
	movq	%rsi, 16(%rsp)	# D.5758, %sfp
	movswl	266(%rbx,%rax,4), %eax	# MEM[(struct  *)_124 + 2B], D.5757
# SUCC: 26 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	%eax, 24(%rsp)	# D.5757, %sfp
# BLOCK 26 freq:2778 seq:24
# PRED: 25 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 26 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L28:
	movswl	0(%r13), %eax	# MEM[base: Fout_127, offset: 0B], D.5757
	imull	$10922, %eax, %eax	#, D.5757, D.5757
	addl	$16384, %eax	#, D.5757
	sarl	$15, %eax	#, D.5757
	movw	%ax, 0(%r13)	# D.5757, MEM[base: Fout_127, offset: 0B]
	movswl	2(%r13), %eax	# MEM[base: Fout_127, offset: 2B], D.5757
	imull	$10922, %eax, %eax	#, D.5757, D.5757
	addl	$16384, %eax	#, D.5757
	sarl	$15, %eax	#, D.5757
	movw	%ax, 2(%r13)	# D.5757, MEM[base: Fout_127, offset: 2B]
	movswl	(%rdx), %eax	# MEM[base: _36, offset: 0B], D.5757
	imull	$10922, %eax, %eax	#, D.5757, D.5757
	addl	$16384, %eax	#, D.5757
	sarl	$15, %eax	#, D.5757
	movw	%ax, (%rdx)	# D.5757, MEM[base: _36, offset: 0B]
	movswl	2(%rdx), %eax	# MEM[base: _36, offset: 2B], D.5757
	imull	$10922, %eax, %eax	#, D.5757, D.5757
	addl	$16384, %eax	#, D.5757
	sarl	$15, %eax	#, D.5757
	movw	%ax, 2(%rdx)	# D.5757, MEM[base: _36, offset: 2B]
	movswl	(%r10), %ecx	# MEM[base: _679, offset: 0B], D.5757
	movswl	2(%r10), %eax	# MEM[base: _679, offset: 2B], D.5757
	imull	$10922, %ecx, %ecx	#, D.5757, D.5757
	imull	$10922, %eax, %eax	#, D.5757, D.5757
	addl	$16384, %ecx	#, D.5757
	addl	$16384, %eax	#, D.5757
	sarl	$15, %ecx	#, D.5757
	sarl	$15, %eax	#, D.5757
	movw	%cx, (%r10)	# D.5757, MEM[base: _679, offset: 0B]
	movw	%ax, 2(%r10)	# D.5757, MEM[base: _679, offset: 2B]
	movswl	(%rdx), %r12d	# MEM[base: _36, offset: 0B], D.5757
	movswl	2(%rdx), %r9d	# MEM[base: _36, offset: 2B], D.5757
	movswl	0(%rbp), %ebx	# MEM[base: tw2_170, offset: 0B], D.5757
	movswl	2(%rbp), %r11d	# MEM[base: tw2_170, offset: 2B], D.5757
	movl	%r12d, %esi	# D.5757, D.5757
	movswl	(%r15), %edi	# MEM[base: tw2_190, offset: 0B], D.5757
	movl	%r9d, %r14d	# D.5757, D.5757
	movswl	2(%r15), %r8d	# MEM[base: tw2_190, offset: 2B], D.5757
	imull	%ebx, %esi	# D.5757, D.5757
	imull	%r11d, %r14d	# D.5757, D.5757
	imull	%ebx, %r9d	# D.5757, D.5757
	movzwl	0(%r13), %ebx	# MEM[base: Fout_127, offset: 0B], D.5760
	imull	%r12d, %r11d	# D.5757, D.5757
	subl	%r14d, %esi	# D.5757, D.5757
	movl	%eax, %r14d	# D.5757, D.5757
	addl	$16384, %esi	#, D.5757
	imull	%r8d, %r14d	# D.5757, D.5757
	leal	16384(%r11,%r9), %r9d	#, D.5757
	sarl	$15, %esi	#, D.5757
	movl	%esi, (%rsp)	# D.5757, %sfp
	movl	%ecx, %esi	# D.5757, D.5757
	sarl	$15, %r9d	#, D.5757
	imull	%r8d, %ecx	# D.5757, D.5757
	imull	%edi, %esi	# D.5757, D.5757
	subl	%r14d, %esi	# D.5757, D.5757
	movzwl	(%rsp), %r14d	# %sfp, tmp1222
	addl	$16384, %esi	#, D.5757
	sarl	$15, %esi	#, D.5757
	addl	%esi, %r14d	# D.5757, D.5760
	imull	%edi, %eax	# D.5757, D.5757
	addq	40(%rsp), %rbp	# %sfp, tw2
	addq	$4, %r10	#, ivtmp.147
	addq	16(%rsp), %r15	# %sfp, tw2
	leal	16384(%rcx,%rax), %eax	#, D.5757
	movl	%r14d, %ecx	# D.5760, D.5763
	sarw	%cx	# D.5763
	sarl	$15, %eax	#, D.5757
	leal	(%rax,%r9), %edi	#, D.5760
	subl	%ecx, %ebx	# D.5763, D.5760
	subl	%eax, %r9d	# D.5757, D.5760
	movw	%bx, (%rdx)	# D.5760, MEM[base: _36, offset: 0B]
	movzwl	2(%r13), %ebx	# MEM[base: Fout_127, offset: 2B], D.5760
	movl	%edi, %ecx	# D.5760, D.5763
	movswl	%r9w, %r9d	# D.5760, D.5757
	sarw	%cx	# D.5763
	subl	%ecx, %ebx	# D.5763, D.5760
	movw	%bx, 2(%rdx)	# D.5760, MEM[base: _36, offset: 2B]
	addw	%di, 2(%r13)	# D.5760, MEM[base: Fout_127, offset: 2B]
	movl	24(%rsp), %edi	# %sfp, D.5757
	addw	%r14w, 0(%r13)	# D.5760, MEM[base: Fout_127, offset: 0B]
	addq	$4, %r13	#, Fout
	imull	%edi, %r9d	# D.5757, D.5757
	addl	$16384, %r9d	#, D.5757
	sarl	$15, %r9d	#, D.5757
	movl	%r9d, %eax	# D.5757, D.5760
	addw	(%rdx), %ax	# MEM[base: _36, offset: 0B], D.5760
	movw	%ax, -4(%r10)	# D.5760, MEM[base: _679, offset: 0B]
	movzwl	(%rsp), %eax	# %sfp, D.5760
	movzwl	2(%rdx), %ecx	# MEM[base: _36, offset: 2B], D.5760
	subl	%esi, %eax	# D.5757, D.5760
	cwtl
	imull	%edi, %eax	# D.5757, D.5757
	addl	$16384, %eax	#, D.5757
	sarl	$15, %eax	#, D.5757
	subl	%eax, %ecx	# D.5757, D.5760
	movw	%cx, -2(%r10)	# D.5760, MEM[base: _679, offset: 2B]
	subw	%r9w, (%rdx)	# D.5757, MEM[base: _36, offset: 0B]
	addw	%ax, 2(%rdx)	# D.5757, MEM[base: _36, offset: 2B]
	addq	$4, %rdx	#, ivtmp.145
	subq	$1, 8(%rsp)	#, %sfp
# SUCC: 26 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 27 [9.0%]  (FALLTHRU)
	jne	.L28	#,
# BLOCK 27 freq:250 seq:25
# PRED: 26 [9.0%]  (FALLTHRU)
# SUCC: 12 [100.0%]  (CAN_FALLTHRU)
	jmp	.L15	#
# BLOCK 28 freq:250 seq:26
# PRED: 18 [33.3%]  (CAN_FALLTHRU) 8 [33.3%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L20:
	movl	24(%rsp), %r8d	# %sfp,
	movq	%rbx, %rdx	# st,
	movq	%r13, %rdi	# Fout,
	movl	48(%rsp), %ecx	# %sfp,
	movq	32(%rsp), %rsi	# %sfp,
	addq	$152, %rsp	#,
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%]  (ABNORMAL,SIBCALL)
	jmp	kf_bfly_generic	#
	.cfi_endproc
.LFE50:
	.size	kf_work, .-kf_work
	.section	.text.unlikely
.LCOLDE1:
	.text
.LHOTE1:
	.section	.text.unlikely
.LCOLDB2:
	.text
.LHOTB2:
	.p2align 4,,15
	.type	kf_work.constprop.1, @function
kf_work.constprop.1:
.LFB58:
	.cfi_startproc
# BLOCK 2 freq:1250 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rsi, %r15	# f, f
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%edx, %r14d	# in_stride, in_stride
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp	# Fout, Fout
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%r8, %rbx	# st, st
	subq	$120, %rsp	#,
	.cfi_def_cfa_offset 176
	movl	4(%rcx), %edx	# MEM[(int *)factors_1(D) + 4B], m
	movl	(%rcx), %eax	# *factors_1(D), p
	movl	%edx, %esi	# m, m
	movl	%edx, 32(%rsp)	# m, %sfp
	movl	%eax, %edx	# p, D.5936
	movl	%eax, 24(%rsp)	# p, %sfp
	imull	%esi, %edx	# m, D.5936
	movslq	%edx, %rdx	# D.5936, D.5937
	leaq	(%rdi,%rdx,4), %r12	#, Fout_end
	cmpl	$1, %esi	#, m
# SUCC: 22 [28.0%]  (CAN_FALLTHRU) 3 [72.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L71	#,
# BLOCK 3 freq:900 seq:1
# PRED: 2 [72.0%]  (FALLTHRU,CAN_FALLTHRU)
	movslq	%r14d, %r13	# in_stride, D.5937
	movslq	32(%rsp), %rdx	# %sfp, D.5937
	movq	%rdi, 40(%rsp)	# Fout, %sfp
	movq	%rdi, %rbp	# Fout, Fout
	leaq	0(,%r13,4), %rax	#, D.5937
	movq	%r15, %r13	# f, f
	movq	%rax, (%rsp)	# D.5937, %sfp
	movslq	24(%rsp), %rax	# %sfp, D.5937
	movq	%rax, 8(%rsp)	# D.5937, %sfp
	leaq	0(,%rdx,4), %rax	#, D.5937
	movq	%rax, 16(%rsp)	# D.5937, %sfp
	leaq	8(%rcx), %rax	#, factors
# SUCC: 4 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rax, %r15	# factors, factors
# BLOCK 4 freq:10000 seq:2
# PRED: 3 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L54:
	movq	8(%rsp), %rdx	# %sfp,
	movq	%r13, %rsi	# f,
	movq	%rbp, %rdi	# Fout,
	movq	%rbx, %r9	# st,
	movq	%r15, %r8	# factors,
	movl	%r14d, %ecx	# in_stride,
	call	kf_work	#
	addq	16(%rsp), %rbp	# %sfp, Fout
	addq	(%rsp), %r13	# %sfp, f
	cmpq	%rbp, %r12	# Fout, Fout_end
# SUCC: 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 5 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L54	#,
# BLOCK 5 freq:900 seq:3
# PRED: 4 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	cmpl	$3, 24(%rsp)	#, %sfp
	movq	40(%rsp), %rbp	# %sfp, Fout
# SUCC: 25 [20.0%]  (CAN_FALLTHRU) 6 [80.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L49	#,
# BLOCK 6 freq:1000 seq:4
# PRED: 5 [80.0%]  (FALLTHRU,CAN_FALLTHRU) 24 [80.0%]  (CAN_FALLTHRU)
.L74:
# SUCC: 7 [62.5%]  (FALLTHRU,CAN_FALLTHRU) 18 [37.5%]  (CAN_FALLTHRU)
	jle	.L72	#,
# BLOCK 7 freq:625 seq:5
# PRED: 6 [62.5%]  (FALLTHRU,CAN_FALLTHRU)
	movl	24(%rsp), %eax	# %sfp, p
	cmpl	$4, %eax	#, p
# SUCC: 13 [40.0%]  (CAN_FALLTHRU) 8 [60.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L52	#,
# BLOCK 8 freq:375 seq:6
# PRED: 7 [60.0%]  (FALLTHRU,CAN_FALLTHRU)
	cmpl	$5, %eax	#, p
# SUCC: 9 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 28 [33.3%]  (CAN_FALLTHRU)
	jne	.L48	#,
# BLOCK 9 freq:250 seq:7
# PRED: 8 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movl	32(%rsp), %r14d	# %sfp, m
	leaq	264(%rbx), %rax	#, twiddles
	movq	%rax, %rbx	# twiddles, twiddles
	movq	%rax, 96(%rsp)	# twiddles, %sfp
	movslq	%r14d, %rax	# m,
	salq	$2, %rax	#, D.5937
	leaq	0(%rbp,%rax), %r8	#, Fout1
	leaq	(%r8,%rax), %r9	#, Fout2
	leaq	(%rbx,%rax), %rdx	#, D.5941
	movq	%r9, 8(%rsp)	# Fout2, %sfp
	addq	%rax, %r9	# D.5937, Fout3
	movswl	(%rdx), %edi	# MEM[(struct kiss_fft_cpx *)_454],
	movzwl	2(%rdx), %ecx	# MEM[(struct kiss_fft_cpx *)_454 + 2B], ya$i
	addq	%rax, %rdx	# D.5937, D.5941
	addq	%r9, %rax	# Fout3, Fout4
	movswl	(%rdx), %esi	# MEM[(struct kiss_fft_cpx *)_458],
	movq	%rax, (%rsp)	# Fout4, %sfp
	movl	%r14d, %eax	# m, m
	movswl	2(%rdx), %edx	# MEM[(struct kiss_fft_cpx *)_458 + 2B],
	testl	%r14d, %r14d	# m
# SUCC: 10 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 12 [9.0%]  (CAN_FALLTHRU)
	jle	.L45	#,
# BLOCK 10 freq:228 seq:8
# PRED: 9 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	%edi, 40(%rsp)	# D.5936, %sfp
	movq	8(%rsp), %rdi	# %sfp, Fout2
	subl	$1, %eax	#, D.5938
	leaq	4(%r9,%rax,4), %rax	#, D.5941
	movl	%esi, 48(%rsp)	# D.5936, %sfp
	movswl	%cx, %esi	# ya$i, D.5936
	movl	%edx, 56(%rsp)	# D.5936, %sfp
	movq	%r8, %rdx	# Fout1, Fout1
	movq	%rax, 104(%rsp)	# D.5941, %sfp
	movq	%r9, %rax	# Fout3, Fout3
	movl	%esi, 52(%rsp)	# D.5936, %sfp
	movq	%rbx, 24(%rsp)	# twiddles, %sfp
# SUCC: 11 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	$0, 32(%rsp)	#, %sfp
# BLOCK 11 freq:2528 seq:9
# PRED: 10 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 11 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L63:
	movswl	0(%rbp), %ecx	# MEM[base: Fout_421, offset: 0B], D.5936
	movq	(%rsp), %rbx	# %sfp, Fout4
	movq	32(%rsp), %r15	# %sfp, ivtmp.291
	movq	96(%rsp), %r11	# %sfp, twiddles
	imull	$6553, %ecx, %ecx	#, D.5936, D.5936
	addl	$16384, %ecx	#, D.5936
	sarl	$15, %ecx	#, D.5936
	movw	%cx, 0(%rbp)	# D.5936, MEM[base: Fout_421, offset: 0B]
	movswl	2(%rbp), %ecx	# MEM[base: Fout_421, offset: 2B], D.5936
	imull	$6553, %ecx, %ecx	#, D.5936, D.5936
	addl	$16384, %ecx	#, D.5936
	sarl	$15, %ecx	#, D.5936
	movw	%cx, 2(%rbp)	# D.5936, MEM[base: Fout_421, offset: 2B]
	movswl	(%rdx), %ecx	# MEM[base: Fout1_419, offset: 0B], D.5936
	imull	$6553, %ecx, %ecx	#, D.5936, D.5936
	addl	$16384, %ecx	#, D.5936
	sarl	$15, %ecx	#, D.5936
	movw	%cx, (%rdx)	# D.5936, MEM[base: Fout1_419, offset: 0B]
	movswl	2(%rdx), %ecx	# MEM[base: Fout1_419, offset: 2B], D.5936
	imull	$6553, %ecx, %ecx	#, D.5936, D.5936
	addl	$16384, %ecx	#, D.5936
	sarl	$15, %ecx	#, D.5936
	movw	%cx, 2(%rdx)	# D.5936, MEM[base: Fout1_419, offset: 2B]
	movswl	(%rdi), %ecx	# MEM[base: Fout2_417, offset: 0B], D.5936
	imull	$6553, %ecx, %ecx	#, D.5936, D.5936
	addl	$16384, %ecx	#, D.5936
	sarl	$15, %ecx	#, D.5936
	movw	%cx, (%rdi)	# D.5936, MEM[base: Fout2_417, offset: 0B]
	movswl	2(%rdi), %ecx	# MEM[base: Fout2_417, offset: 2B], D.5936
	imull	$6553, %ecx, %ecx	#, D.5936, D.5936
	addl	$16384, %ecx	#, D.5936
	sarl	$15, %ecx	#, D.5936
	movw	%cx, 2(%rdi)	# D.5936, MEM[base: Fout2_417, offset: 2B]
	movswl	(%rax), %ecx	# MEM[base: Fout3_14, offset: 0B], D.5936
	imull	$6553, %ecx, %ecx	#, D.5936, D.5936
	addl	$16384, %ecx	#, D.5936
	sarl	$15, %ecx	#, D.5936
	movw	%cx, (%rax)	# D.5936, MEM[base: Fout3_14, offset: 0B]
	movswl	2(%rax), %ecx	# MEM[base: Fout3_14, offset: 2B], D.5936
	imull	$6553, %ecx, %ecx	#, D.5936, D.5936
	addl	$16384, %ecx	#, D.5936
	sarl	$15, %ecx	#, D.5936
	movw	%cx, 2(%rax)	# D.5936, MEM[base: Fout3_14, offset: 2B]
	movswl	(%rbx), %esi	# MEM[base: Fout4_221, offset: 0B], D.5936
	movswl	2(%rbx), %ecx	# MEM[base: Fout4_221, offset: 2B], D.5936
	imull	$6553, %esi, %esi	#, D.5936, D.5936
	imull	$6553, %ecx, %ecx	#, D.5936, D.5936
	addl	$16384, %esi	#, D.5936
	addl	$16384, %ecx	#, D.5936
	sarl	$15, %esi	#, D.5936
	sarl	$15, %ecx	#, D.5936
	movw	%si, (%rbx)	# D.5936, MEM[base: Fout4_221, offset: 0B]
	movw	%cx, 2(%rbx)	# D.5936, MEM[base: Fout4_221, offset: 2B]
	movzwl	2(%rbp), %r9d	# MEM[base: Fout_421, offset: 2B], scratch$0$i
	movswl	(%r11,%r15,2), %r10d	# MEM[base: twiddles_46, index: ivtmp.291_449, step: 2, offset: 0B], D.5936
	movswl	(%rdi), %r8d	# MEM[base: Fout2_417, offset: 0B], D.5936
	movswl	(%r11,%r15), %r13d	# MEM[base: twiddles_46, index: ivtmp.291_449, offset: 0B], D.5936
	movswl	(%rdx), %r14d	# MEM[base: Fout1_419, offset: 0B], D.5936
	movw	%r9w, 16(%rsp)	# scratch$0$i, %sfp
	movswl	2(%r11,%r15), %r12d	# MEM[base: twiddles_46, index: ivtmp.291_449, offset: 2B], D.5936
	movl	%r10d, 80(%rsp)	# D.5936, %sfp
	movswl	2(%rdx), %ebx	# MEM[base: Fout1_419, offset: 2B], D.5936
	movl	%r8d, 76(%rsp)	# D.5936, %sfp
	movswl	2(%rdi), %r9d	# MEM[base: Fout2_417, offset: 2B], D.5936
	movswl	(%rax), %r8d	# MEM[base: Fout3_14, offset: 0B], D.5936
	movl	%r14d, %edi	# D.5936, D.5936
	imull	%r13d, %edi	# D.5936, D.5936
	movl	%r9d, 84(%rsp)	# D.5936, %sfp
	movswl	2(%r11,%r15,2), %r9d	# MEM[base: twiddles_46, index: ivtmp.291_449, step: 2, offset: 2B], D.5936
	movl	%r8d, 88(%rsp)	# D.5936, %sfp
	movq	24(%rsp), %r8	# %sfp, ivtmp.312
	movswl	(%r8), %r10d	# MEM[base: _418, offset: 0B], D.5936
	movswl	2(%r8), %r8d	# MEM[base: _418, offset: 2B], D.5936
	movl	%r10d, 64(%rsp)	# D.5936, %sfp
	movswl	2(%rax), %r10d	# MEM[base: Fout3_14, offset: 2B], D.5936
	movl	%r10d, 68(%rsp)	# D.5936, %sfp
	movswl	(%r11,%r15,4), %r10d	# MEM[base: twiddles_46, index: ivtmp.291_449, step: 4, offset: 0B], D.5936
	movswl	2(%r11,%r15,4), %r11d	# MEM[base: twiddles_46, index: ivtmp.291_449, step: 4, offset: 2B], D.5936
	movl	%ebx, %r15d	# D.5936, D.5936
	imull	%r12d, %r15d	# D.5936, D.5936
	subl	%r15d, %edi	# D.5936, D.5936
	movl	%esi, %r15d	# D.5936, D.5936
	addl	$16384, %edi	#, D.5936
	imull	%r10d, %r15d	# D.5936, D.5936
	imull	%r14d, %r12d	# D.5936, D.5936
	sarl	$15, %edi	#, D.5936
	imull	%r13d, %ebx	# D.5936, D.5936
	movl	%edi, 72(%rsp)	# D.5936, %sfp
	movl	76(%rsp), %r13d	# %sfp, D.5936
	imull	%r11d, %esi	# D.5936, D.5936
	movl	%r15d, %edi	# D.5936, D.5936
	movl	%ecx, %r15d	# D.5936, D.5936
	imull	%r10d, %ecx	# D.5936, D.5936
	imull	%r11d, %r15d	# D.5936, D.5936
	movl	84(%rsp), %r11d	# %sfp, D.5936
	leal	16384(%r12,%rbx), %ebx	#, D.5936
	movl	80(%rsp), %r12d	# %sfp, D.5936
	sarl	$15, %ebx	#, D.5936
	leal	16384(%rsi,%rcx), %ecx	#, D.5936
	sarl	$15, %ecx	#, D.5936
	subl	%r15d, %edi	# D.5936, D.5936
	leal	(%rcx,%rbx), %esi	#, D.5939
	movl	%ecx, %r14d	# D.5936, D.5936
	movl	%r11d, %r10d	# D.5936, D.5936
	movl	%r13d, %ecx	# D.5936, D.5936
	imull	%r9d, %r10d	# D.5936, D.5936
	addl	$16384, %edi	#, D.5936
	imull	%r12d, %ecx	# D.5936, D.5936
	movl	%edi, %r15d	# D.5936, D.5936
	sarl	$15, %r15d	#, D.5936
	imull	%r13d, %r9d	# D.5936, D.5936
	movl	%r15d, 92(%rsp)	# D.5936, %sfp
	movl	%r15d, %edi	# D.5936, D.5939
	movl	88(%rsp), %r15d	# %sfp, D.5936
	subl	%r10d, %ecx	# D.5936, D.5936
	addw	72(%rsp), %di	# %sfp, D.5939
	leal	16384(%rcx), %r10d	#, D.5936
	movl	%r10d, %ecx	# D.5936, D.5936
	movl	68(%rsp), %r10d	# %sfp, D.5936
	sarl	$15, %ecx	#, D.5936
	movl	%ecx, 76(%rsp)	# D.5936, %sfp
	movl	64(%rsp), %ecx	# %sfp, D.5936
	imull	%r8d, %r10d	# D.5936, D.5936
	imull	%r15d, %r8d	# D.5936, D.5936
	imull	%r15d, %ecx	# D.5936, D.5936
	subl	%r10d, %ecx	# D.5936, D.5936
	movl	%r12d, %r10d	# D.5936, D.5936
	movzwl	0(%rbp), %r12d	# MEM[base: Fout_421, offset: 0B], D.5939
	addl	$16384, %ecx	#, D.5936
	imull	%r11d, %r10d	# D.5936, D.5936
	sarl	$15, %ecx	#, D.5936
	movl	%ecx, 80(%rsp)	# D.5936, %sfp
	addw	76(%rsp), %cx	# %sfp, D.5939
	movl	%r12d, %r15d	# D.5939, D.5939
	leal	16384(%r9,%r10), %r9d	#, D.5936
	movl	64(%rsp), %r10d	# %sfp, D.5936
	movw	%r15w, 64(%rsp)	# D.5939, %sfp
	imull	68(%rsp), %r10d	# %sfp, D.5936
	sarl	$15, %r9d	#, D.5936
	leal	(%rcx,%r12), %r11d	#, D.5939
	movswl	%cx, %ecx	# D.5939, D.5936
	addl	%edi, %r11d	# D.5939, tmp1055
	movw	%r11w, 0(%rbp)	# tmp1055, MEM[base: Fout_421, offset: 0B]
	movzwl	16(%rsp), %r11d	# %sfp, scratch$0$i
	leal	16384(%r8,%r10), %r8d	#, D.5936
	sarl	$15, %r8d	#, D.5936
	leal	(%r8,%r9), %r10d	#, D.5939
	addl	%r10d, %r11d	# D.5939, D.5939
	addl	%esi, %r11d	# D.5939, tmp1057
	movw	%r11w, 2(%rbp)	# tmp1057, MEM[base: Fout_421, offset: 2B]
	movswl	%di, %r11d	# D.5939, D.5936
	movl	%r15d, %edi	# D.5939, D.5939
	movl	%r11d, %r12d	# D.5936, D.5936
	movl	48(%rsp), %r11d	# %sfp, D.5936
	movl	%r12d, 68(%rsp)	# D.5936, %sfp
	movl	40(%rsp), %r15d	# %sfp, D.5936
	movl	%r11d, %r13d	# D.5936, D.5936
	imull	%ecx, %r13d	# D.5936, D.5936
	subl	%r14d, %ebx	# D.5936, D.5939
	movl	52(%rsp), %r14d	# %sfp, D.5936
	subl	%r8d, %r9d	# D.5936, D.5939
	imull	%r15d, %r12d	# D.5936, D.5936
	movswl	%r9w, %r9d	# D.5939, D.5936
	addl	$16384, %r13d	#, D.5936
	sarl	$15, %r13d	#, D.5936
	movl	%r14d, %r8d	# D.5936, D.5936
	addl	%r13d, %edi	# D.5936, D.5939
	movl	%r12d, %r13d	# D.5936, D.5936
	addl	$16384, %r13d	#, D.5936
	sarl	$15, %r13d	#, D.5936
	addl	%edi, %r13d	# D.5939, D.5939
	movl	%r13d, %r12d	# D.5939, D.5939
	movswl	%si, %r13d	# D.5939, D.5936
	movswl	%r10w, %esi	# D.5939, D.5936
	movzwl	16(%rsp), %r10d	# %sfp, scratch$0$i
	imull	%esi, %r11d	# D.5936, D.5936
	addl	$16384, %r11d	#, D.5936
	sarl	$15, %r11d	#, D.5936
	leal	(%r10,%r11), %edi	#, D.5939
	movl	%r15d, %r10d	# D.5936, D.5936
	movswl	%bx, %r15d	# D.5939, D.5936
	imull	%r15d, %r8d	# D.5936, D.5936
	imull	%r13d, %r10d	# D.5936, D.5936
	movl	%r8d, %ebx	# D.5936, D.5936
	addl	$16384, %ebx	#, D.5936
	movl	%r10d, %r11d	# D.5936, D.5936
	movl	%ebx, %r10d	# D.5936, D.5936
	addl	$16384, %r11d	#, D.5936
	sarl	$15, %r10d	#, D.5936
	sarl	$15, %r11d	#, D.5936
	movl	%r10d, %r8d	# D.5936, D.5936
	movl	56(%rsp), %r10d	# %sfp, D.5936
	addl	%edi, %r11d	# D.5939, D.5939
	imull	%r9d, %r10d	# D.5936, D.5936
	movl	%r10d, %ebx	# D.5936, D.5936
	addl	$16384, %ebx	#, D.5936
	movl	%ebx, %r10d	# D.5936, D.5936
	sarl	$15, %r10d	#, D.5936
	leal	(%r8,%r10), %ebx	#, D.5939
	movzwl	72(%rsp), %r10d	# %sfp, D.5939
	movw	%r12w, 72(%rsp)	# D.5939, %sfp
	subw	92(%rsp), %r10w	# %sfp, D.5939
	subl	%ebx, %r12d	# D.5939, tmp1088
	movw	%r12w, (%rdx)	# tmp1088, MEM[base: Fout1_419, offset: 0B]
	movzwl	64(%rsp), %r12d	# %sfp, D.5939
	movswl	%r10w, %r8d	# D.5939,
	movzwl	76(%rsp), %r10d	# %sfp, D.5939
	imull	%r8d, %r14d	# D.5936, D.5936
	subw	80(%rsp), %r10w	# %sfp, D.5939
	movl	%r14d, %edi	# D.5936, D.5936
	addl	$16384, %edi	#, D.5936
	movswl	%r10w, %r10d	# D.5939, D.5936
	movl	%edi, %r14d	# D.5936, D.5936
	movl	56(%rsp), %edi	# %sfp, D.5936
	sarl	$15, %r14d	#, D.5936
	imull	%r10d, %edi	# D.5936, D.5936
	addl	$16384, %edi	#, D.5936
	sarl	$15, %edi	#, D.5936
	addl	%r14d, %edi	# D.5936, D.5939
	addw	72(%rsp), %bx	# %sfp, tmp1090
	leal	(%r11,%rdi), %r14d	#, tmp1089
	subl	%edi, %r11d	# D.5939, tmp1091
	movw	%r14w, 2(%rdx)	# tmp1089, MEM[base: Fout1_419, offset: 2B]
	movq	(%rsp), %r14	# %sfp, Fout4
	movw	%bx, (%r14)	# tmp1090, MEM[base: Fout4_221, offset: 0B]
	movl	40(%rsp), %ebx	# %sfp, D.5936
	movw	%r11w, 2(%r14)	# tmp1091, MEM[base: Fout4_221, offset: 2B]
	movl	48(%rsp), %r11d	# %sfp, D.5936
	imull	%ebx, %ecx	# D.5936, D.5936
	imull	%ebx, %esi	# D.5936, D.5936
	movzwl	16(%rsp), %ebx	# %sfp, scratch$0$i
	addl	$16384, %ecx	#, D.5936
	sarl	$15, %ecx	#, D.5936
	addl	$16384, %esi	#, D.5936
	addl	%ecx, %r12d	# D.5936, D.5939
	movl	68(%rsp), %ecx	# %sfp, D.5936
	sarl	$15, %esi	#, D.5936
	imull	%r11d, %ecx	# D.5936, D.5936
	movl	%ecx, %edi	# D.5936, D.5936
	leal	(%rbx,%rsi), %ecx	#, D.5939
	movl	%r13d, %esi	# D.5936, D.5936
	addl	$16384, %edi	#, D.5936
	imull	%r11d, %esi	# D.5936, D.5936
	movl	56(%rsp), %r11d	# %sfp, D.5936
	sarl	$15, %edi	#, D.5936
	addl	%edi, %r12d	# D.5936, D.5939
	movq	8(%rsp), %rdi	# %sfp, Fout2
	addl	$16384, %esi	#, D.5936
	sarl	$15, %esi	#, D.5936
	imull	%r11d, %r15d	# D.5936, D.5936
	addl	%ecx, %esi	# D.5939, D.5939
	movl	52(%rsp), %ecx	# %sfp, D.5936
	imull	%r11d, %r8d	# D.5936, D.5936
	addl	$16384, %r15d	#, D.5936
	sarl	$15, %r15d	#, D.5936
	addl	$16384, %r8d	#, D.5936
	imull	%ecx, %r9d	# D.5936, D.5936
	sarl	$15, %r8d	#, D.5936
	imull	%ecx, %r10d	# D.5936, D.5936
	addl	$16384, %r9d	#, D.5936
	sarl	$15, %r9d	#, D.5936
	addl	$16384, %r10d	#, D.5936
	subl	%r15d, %r9d	# D.5936, D.5939
	sarl	$15, %r10d	#, D.5936
	leal	(%r12,%r9), %ecx	#, tmp1118
	subl	%r10d, %r8d	# D.5936, D.5939
	subl	%r9d, %r12d	# D.5939, tmp1120
	movw	%cx, (%rdi)	# tmp1118, MEM[base: Fout2_417, offset: 0B]
	leal	(%rsi,%r8), %ecx	#, tmp1119
	subl	%r8d, %esi	# D.5939, tmp1121
	addq	$4, %rbp	#, Fout
	movw	%cx, 2(%rdi)	# tmp1119, MEM[base: Fout2_417, offset: 2B]
	addq	$4, %r14	#, Fout4
	addq	$4, %rdi	#, Fout2
	addq	$4, %rdx	#, Fout1
	movw	%r12w, (%rax)	# tmp1120, MEM[base: Fout3_14, offset: 0B]
	addq	$4, %rax	#, Fout3
	addq	$4, 32(%rsp)	#, %sfp
	movw	%si, -2(%rax)	# tmp1121, MEM[base: Fout3_14, offset: 2B]
	movq	%rdi, 8(%rsp)	# Fout2, %sfp
	movq	%r14, (%rsp)	# Fout4, %sfp
	addq	$12, 24(%rsp)	#, %sfp
	cmpq	104(%rsp), %rax	# %sfp, Fout3
# SUCC: 11 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 12 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L63	#,
# BLOCK 12 freq:500 seq:10
# PRED: 11 [9.0%]  (FALLTHRU,CAN_FALLTHRU) 9 [9.0%]  (CAN_FALLTHRU) 15 [9.0%]  (CAN_FALLTHRU)
.L45:
	addq	$120, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%] 
	ret
# BLOCK 13 freq:250 seq:11
# PRED: 7 [40.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L52:
	.cfi_restore_state
	movslq	32(%rsp), %rax	# %sfp, k
	leaq	264(%rbx), %rdx	#, tw3
	xorl	%r8d, %r8d	# ivtmp.263
	movl	4(%rbx), %ebx	# st_22(D)->inverse, D.5936
	movq	%rdx, %r14	# tw3, tw3
	movq	%rdx, (%rsp)	# tw3, %sfp
	movq	%rax, 56(%rsp)	# k, %sfp
	salq	$2, %rax	#, D.5937
	leaq	0(%rbp,%rax), %r9	#, ivtmp.279
	movl	%ebx, 64(%rsp)	# D.5936, %sfp
	leaq	(%r9,%rax), %rbx	#, ivtmp.281
	leaq	(%rbx,%rax), %r11	#, ivtmp.283
# SUCC: 16 [100.0%]  (CAN_FALLTHRU)
	jmp	.L62	#
# BLOCK 14 freq:1389 seq:12
# PRED: 16 [50.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L73:
	movzwl	52(%rsp), %edi	# %sfp, D.5939
	subl	%r12d, %eax	# D.5939, tmp963
	movw	%ax, (%r9)	# tmp963, MEM[base: _979, offset: 0B]
	movl	%edi, %eax	# D.5939, D.5939
	addl	%edx, %eax	# D.5939, tmp964
	movw	%ax, 2(%r9)	# tmp964, MEM[base: _979, offset: 2B]
	movl	%esi, %eax	# D.5939, D.5939
	addl	%eax, %r12d	# D.5939, tmp965
	movl	%edi, %eax	# D.5939, tmp966
	subl	%edx, %eax	# D.5939, tmp966
	movw	%r12w, (%r11)	# tmp965, MEM[base: _932, offset: 0B]
# SUCC: 15 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movw	%ax, 2(%r11)	# tmp966, MEM[base: _932, offset: 2B]
# BLOCK 15 freq:2778 seq:13
# PRED: 14 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 17 [100.0%]  (CAN_FALLTHRU)
.L61:
	addq	$4, %rbp	#, Fout
	addq	$1, %r8	#, ivtmp.263
	addq	$4, %r9	#, ivtmp.279
	addq	$4, %rbx	#, ivtmp.281
	addq	$4, %r11	#, ivtmp.283
	cmpq	%r8, 56(%rsp)	# ivtmp.263, %sfp
# SUCC: 16 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 12 [9.0%]  (CAN_FALLTHRU)
	je	.L45	#,
# BLOCK 16 freq:2778 seq:14
# PRED: 15 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 13 [100.0%]  (CAN_FALLTHRU)
.L62:
	movswl	0(%rbp), %edx	# MEM[base: Fout_277, offset: 0B], D.5936
	movl	%edx, %eax	# D.5936, tmp887
	sall	$13, %eax	#, tmp887
	subl	%edx, %eax	# D.5936, D.5936
	movswl	2(%rbp), %edx	# MEM[base: Fout_277, offset: 2B], D.5936
	addl	$16384, %eax	#, D.5936
	sarl	$15, %eax	#, D.5936
	movw	%ax, 0(%rbp)	# D.5936, MEM[base: Fout_277, offset: 0B]
	movl	%edx, %eax	# D.5936, tmp893
	sall	$13, %eax	#, tmp893
	subl	%edx, %eax	# D.5936, D.5936
	addl	$16384, %eax	#, D.5936
	sarl	$15, %eax	#, D.5936
	movw	%ax, 2(%rbp)	# D.5936, MEM[base: Fout_277, offset: 2B]
	movswl	(%r9), %edx	# MEM[base: _979, offset: 0B], D.5936
	movl	%edx, %eax	# D.5936, tmp899
	sall	$13, %eax	#, tmp899
	subl	%edx, %eax	# D.5936, D.5936
	movswl	2(%r9), %edx	# MEM[base: _979, offset: 2B], D.5936
	addl	$16384, %eax	#, D.5936
	sarl	$15, %eax	#, D.5936
	movw	%ax, (%r9)	# D.5936, MEM[base: _979, offset: 0B]
	movl	%edx, %eax	# D.5936, tmp905
	sall	$13, %eax	#, tmp905
	subl	%edx, %eax	# D.5936, D.5936
	addl	$16384, %eax	#, D.5936
	sarl	$15, %eax	#, D.5936
	movw	%ax, 2(%r9)	# D.5936, MEM[base: _979, offset: 2B]
	movswl	(%rbx), %edx	# MEM[base: _936, offset: 0B], D.5936
	movl	%edx, %eax	# D.5936, tmp911
	sall	$13, %eax	#, tmp911
	subl	%edx, %eax	# D.5936, D.5936
	movswl	2(%rbx), %edx	# MEM[base: _936, offset: 2B], D.5936
	addl	$16384, %eax	#, D.5936
	sarl	$15, %eax	#, D.5936
	movw	%ax, (%rbx)	# D.5936, MEM[base: _936, offset: 0B]
	movl	%edx, %eax	# D.5936, tmp917
	sall	$13, %eax	#, tmp917
	subl	%edx, %eax	# D.5936, D.5936
	addl	$16384, %eax	#, D.5936
	sarl	$15, %eax	#, D.5936
	movw	%ax, 2(%rbx)	# D.5936, MEM[base: _936, offset: 2B]
	movswl	(%r11), %eax	# MEM[base: _932, offset: 0B], D.5936
	movl	%eax, %edi	# D.5936, tmp923
	sall	$13, %edi	#, tmp923
	subl	%eax, %edi	# D.5936, D.5936
	movswl	2(%r11), %eax	# MEM[base: _932, offset: 2B], D.5936
	addl	$16384, %edi	#, D.5936
	sarl	$15, %edi	#, D.5936
	movw	%di, (%r11)	# D.5936, MEM[base: _932, offset: 0B]
	movl	%eax, %esi	# D.5936, tmp928
	sall	$13, %esi	#, tmp928
	subl	%eax, %esi	# D.5936, D.5936
	addl	$16384, %esi	#, D.5936
	sarl	$15, %esi	#, D.5936
	movw	%si, 2(%r11)	# D.5936, MEM[base: _932, offset: 2B]
	movswl	(%r9), %eax	# MEM[base: _979, offset: 0B], D.5936
	movswl	2(%r9), %edx	# MEM[base: _979, offset: 2B], D.5936
	movswl	2(%r14,%r8,4), %ecx	# MEM[base: tw3_276, index: ivtmp.263_273, step: 4, offset: 2B], D.5936
	movswl	(%rbx), %r12d	# MEM[base: _936, offset: 0B], D.5936
	movl	%eax, %r15d	# D.5936, D.5936
	movswl	(%r14,%r8,4), %eax	# MEM[base: tw3_276, index: ivtmp.263_273, step: 4, offset: 0B], D.5936
	movl	%edx, 16(%rsp)	# D.5936, %sfp
	movswl	2(%rbx), %edx	# MEM[base: _936, offset: 2B], D.5936
	movswl	(%r14,%r8,8), %r10d	# MEM[base: tw3_276, index: ivtmp.263_273, step: 8, offset: 0B], D.5936
	movl	%ecx, 24(%rsp)	# D.5936, %sfp
	movswl	2(%r14,%r8,8), %ecx	# MEM[base: tw3_276, index: ivtmp.263_273, step: 8, offset: 2B], D.5936
	movl	%eax, 8(%rsp)	# D.5936, %sfp
	movq	(%rsp), %rax	# %sfp, tw3
	movswl	(%rax), %r13d	# MEM[base: tw3_375, offset: 0B], D.5936
	movswl	2(%rax), %eax	# MEM[base: tw3_375, offset: 2B], D.5936
	movl	%r13d, 32(%rsp)	# D.5936, %sfp
	movl	%edx, %r13d	# D.5936, D.5936
	movl	%eax, 40(%rsp)	# D.5936, %sfp
	movl	%r12d, %eax	# D.5936, D.5936
	imull	%r10d, %eax	# D.5936, D.5936
	imull	%ecx, %r13d	# D.5936, D.5936
	imull	%r10d, %edx	# D.5936, D.5936
	imull	%r12d, %ecx	# D.5936, D.5936
	subl	%r13d, %eax	# D.5936, D.5936
	movzwl	0(%rbp), %r13d	# MEM[base: Fout_277, offset: 0B], D.5939
	addl	$16384, %eax	#, D.5936
	leal	16384(%rcx,%rdx), %ecx	#, D.5936
	sarl	$15, %eax	#, D.5936
	sarl	$15, %ecx	#, D.5936
	subl	%eax, %r13d	# D.5936, D.5939
	movw	%r13w, 48(%rsp)	# D.5939, %sfp
	movzwl	2(%rbp), %r13d	# MEM[base: Fout_277, offset: 2B], D.5939
	movl	8(%rsp), %edx	# %sfp, D.5936
	movl	16(%rsp), %r10d	# %sfp, D.5936
	imull	24(%rsp), %r10d	# %sfp, D.5936
	movl	%r13d, %r12d	# D.5939, D.5939
	addw	0(%rbp), %ax	# MEM[base: Fout_277, offset: 0B], D.5939
	addq	$12, (%rsp)	#, %sfp
	imull	%r15d, %edx	# D.5936, D.5936
	subl	%ecx, %r12d	# D.5936, D.5939
	addl	%r13d, %ecx	# D.5939, D.5939
	movl	32(%rsp), %r13d	# %sfp, D.5936
	movw	%r12w, 52(%rsp)	# D.5939, %sfp
	movl	40(%rsp), %r12d	# %sfp, D.5936
	subl	%r10d, %edx	# D.5936, D.5936
	movw	%cx, 2(%rbp)	# D.5939, MEM[base: Fout_277, offset: 2B]
	movw	%ax, 0(%rbp)	# D.5939, MEM[base: Fout_277, offset: 0B]
	addl	$16384, %edx	#, D.5936
	imull	%edi, %r13d	# D.5936, D.5936
	sarl	$15, %edx	#, D.5936
	imull	%esi, %r12d	# D.5936, D.5936
	imull	40(%rsp), %edi	# %sfp, D.5936
	imull	32(%rsp), %esi	# %sfp, D.5936
	movl	%r13d, %r10d	# D.5936, D.5936
	subl	%r12d, %r10d	# D.5936, D.5936
	movl	24(%rsp), %r12d	# %sfp, D.5936
	addl	$16384, %r10d	#, D.5936
	leal	16384(%rdi,%rsi), %esi	#, D.5936
	sarl	$15, %r10d	#, D.5936
	leal	(%r10,%rdx), %r13d	#, D.5939
	sarl	$15, %esi	#, D.5936
	subl	%r10d, %edx	# D.5936, D.5939
	imull	%r15d, %r12d	# D.5936, D.5936
	subl	%r13d, %eax	# D.5939, tmp961
	movw	%ax, (%rbx)	# tmp961, MEM[base: _936, offset: 0B]
	movl	%r12d, %r15d	# D.5936, D.5936
	movl	8(%rsp), %r12d	# %sfp, D.5936
	imull	16(%rsp), %r12d	# %sfp, D.5936
	leal	16384(%r15,%r12), %r12d	#, D.5936
	sarl	$15, %r12d	#, D.5936
	leal	(%rsi,%r12), %edi	#, D.5939
	subl	%esi, %r12d	# D.5936, D.5939
	movzwl	48(%rsp), %esi	# %sfp, D.5939
	subl	%edi, %ecx	# D.5939, tmp962
	movw	%cx, 2(%rbx)	# tmp962, MEM[base: _936, offset: 2B]
	movl	64(%rsp), %ecx	# %sfp,
	addw	%r13w, 0(%rbp)	# D.5939, MEM[base: Fout_277, offset: 0B]
	addw	%di, 2(%rbp)	# D.5939, MEM[base: Fout_277, offset: 2B]
	movl	%esi, %eax	# D.5939, tmp963
	testl	%ecx, %ecx	#
# SUCC: 14 [50.0%]  (CAN_FALLTHRU) 17 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L73	#,
# BLOCK 17 freq:1389 seq:15
# PRED: 16 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	movzwl	52(%rsp), %edi	# %sfp, D.5939
	addl	%r12d, %eax	# D.5939, tmp967
	movw	%ax, (%r9)	# tmp967, MEM[base: _979, offset: 0B]
	movl	%edi, %eax	# D.5939, tmp968
	subl	%edx, %eax	# D.5939, tmp968
	movw	%ax, 2(%r9)	# tmp968, MEM[base: _979, offset: 2B]
	movl	%esi, %eax	# D.5939, tmp969
	subl	%r12d, %eax	# D.5939, tmp969
	movw	%ax, (%r11)	# tmp969, MEM[base: _932, offset: 0B]
	movl	%edi, %eax	# D.5939, D.5939
	addl	%eax, %edx	# D.5939, tmp970
	movw	%dx, 2(%r11)	# tmp970, MEM[base: _932, offset: 2B]
# SUCC: 15 [100.0%]  (CAN_FALLTHRU)
	jmp	.L61	#
# BLOCK 18 freq:375 seq:16
# PRED: 6 [37.5%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L72:
	cmpl	$2, 24(%rsp)	#, %sfp
# SUCC: 19 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 28 [33.3%]  (CAN_FALLTHRU)
	jne	.L48	#,
# BLOCK 19 freq:250 seq:17
# PRED: 18 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movl	32(%rsp), %edx	# %sfp, m
	addq	$264, %rbx	#, tw1
	movslq	%edx, %rax	# m,
	leaq	0(%rbp,%rax,4), %rdi	#, Fout2
	movl	%edx, %eax	# m, m
	subl	$1, %eax	#, D.5938
# SUCC: 20 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	leaq	4(%rbp,%rax,4), %r8	#, D.5941
# BLOCK 20 freq:2778 seq:18
# PRED: 19 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 20 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L56:
	movswl	0(%rbp), %edx	# MEM[base: Fout_53, offset: 0B], D.5936
	addq	$4, %rbx	#, tw1
	addq	$4, %rdi	#, Fout2
	movl	%edx, %eax	# D.5936, tmp775
	sall	$14, %eax	#, tmp775
	subl	%edx, %eax	# D.5936, D.5936
	movswl	2(%rbp), %edx	# MEM[base: Fout_53, offset: 2B], D.5936
	addl	$16384, %eax	#, D.5936
	sarl	$15, %eax	#, D.5936
	movw	%ax, 0(%rbp)	# D.5936, MEM[base: Fout_53, offset: 0B]
	movl	%edx, %eax	# D.5936, tmp781
	sall	$14, %eax	#, tmp781
	subl	%edx, %eax	# D.5936, D.5936
	addl	$16384, %eax	#, D.5936
	sarl	$15, %eax	#, D.5936
	movw	%ax, 2(%rbp)	# D.5936, MEM[base: Fout_53, offset: 2B]
	movswl	-4(%rdi), %eax	# MEM[base: Fout2_66, offset: 0B], D.5936
	movswl	-2(%rdi), %ecx	# MEM[base: Fout2_66, offset: 2B], D.5936
	movl	%eax, %edx	# D.5936, tmp787
	sall	$14, %edx	#, tmp787
	subl	%eax, %edx	# D.5936, D.5936
	movl	%ecx, %eax	# D.5936, tmp792
	sall	$14, %eax	#, tmp792
	addl	$16384, %edx	#, D.5936
	subl	%ecx, %eax	# D.5936, D.5936
	sarl	$15, %edx	#, D.5936
	addl	$16384, %eax	#, D.5936
	movw	%dx, -4(%rdi)	# D.5936, MEM[base: Fout2_66, offset: 0B]
	movl	%edx, %ecx	# D.5936, D.5936
	sarl	$15, %eax	#, D.5936
	movw	%ax, -2(%rdi)	# D.5936, MEM[base: Fout2_66, offset: 2B]
	movswl	-4(%rbx), %esi	# MEM[base: tw1_80, offset: 0B], D.5936
	movl	%eax, %r10d	# D.5936, D.5936
	movswl	-2(%rbx), %r9d	# MEM[base: tw1_80, offset: 2B], D.5936
	imull	%esi, %ecx	# D.5936, D.5936
	imull	%r9d, %r10d	# D.5936, D.5936
	imull	%r9d, %edx	# D.5936, D.5936
	imull	%esi, %eax	# D.5936, D.5936
	subl	%r10d, %ecx	# D.5936, D.5936
	movzwl	0(%rbp), %r10d	# MEM[base: Fout_53, offset: 0B], D.5939
	addl	$16384, %ecx	#, D.5936
	leal	16384(%rdx,%rax), %eax	#, D.5936
	sarl	$15, %ecx	#, D.5936
	sarl	$15, %eax	#, D.5936
	subl	%ecx, %r10d	# D.5936, D.5939
	movw	%r10w, -4(%rdi)	# D.5939, MEM[base: Fout2_66, offset: 0B]
	movzwl	2(%rbp), %edx	# MEM[base: Fout_53, offset: 2B], D.5939
	subl	%eax, %edx	# D.5936, D.5939
	movw	%dx, -2(%rdi)	# D.5939, MEM[base: Fout2_66, offset: 2B]
	addw	%cx, 0(%rbp)	# D.5936, MEM[base: Fout_53, offset: 0B]
	addw	%ax, 2(%rbp)	# D.5936, MEM[base: Fout_53, offset: 2B]
	addq	$4, %rbp	#, Fout
	cmpq	%r8, %rbp	# D.5941, Fout
# SUCC: 20 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 21 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L56	#,
# BLOCK 21 freq:250 seq:19
# PRED: 20 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	addq	$120, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%] 
	ret
# BLOCK 22 freq:350 seq:20
# PRED: 2 [28.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L71:
	.cfi_restore_state
	movslq	%r14d, %rax	# in_stride, D.5937
	movq	%rdi, %rdx	# Fout, Fout
# SUCC: 23 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	salq	$2, %rax	#, D.5937
# BLOCK 23 freq:3889 seq:21
# PRED: 22 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 23 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L47:
	movl	(%r15), %ecx	# MEM[base: f_10, offset: 0B], MEM[base: f_10, offset: 0B]
	addq	$4, %rdx	#, Fout
	addq	%rax, %r15	# D.5937, f
	movl	%ecx, -4(%rdx)	# MEM[base: f_10, offset: 0B], MEM[base: Fout_11, offset: 0B]
	cmpq	%rdx, %r12	# Fout, Fout_end
# SUCC: 23 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 24 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L47	#,
# BLOCK 24 freq:350 seq:22
# PRED: 23 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	cmpl	$3, 24(%rsp)	#, %sfp
# SUCC: 25 [20.0%]  (FALLTHRU,CAN_FALLTHRU) 6 [80.0%]  (CAN_FALLTHRU)
	jne	.L74	#,
# BLOCK 25 freq:250 seq:23
# PRED: 5 [20.0%]  (CAN_FALLTHRU) 24 [20.0%]  (FALLTHRU,CAN_FALLTHRU)
.L49:
	movslq	32(%rsp), %rax	# %sfp, m
	leaq	264(%rbx), %r13	#, tw2
	xorl	%r14d, %r14d	# ivtmp.243
	movswl	266(%rbx,%rax,4), %ebx	# MEM[(struct  *)_123 + 2B], D.5936
	movq	%rax, 8(%rsp)	# m, %sfp
	leaq	0(%rbp,%rax,4), %rdx	#, ivtmp.256
	leaq	0(%rbp,%rax,8), %r10	#, ivtmp.258
# SUCC: 26 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	%ebx, 16(%rsp)	# D.5936, %sfp
# BLOCK 26 freq:2778 seq:24
# PRED: 25 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 26 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L58:
	movswl	0(%rbp), %eax	# MEM[base: Fout_126, offset: 0B], D.5936
	imull	$10922, %eax, %eax	#, D.5936, D.5936
	addl	$16384, %eax	#, D.5936
	sarl	$15, %eax	#, D.5936
	movw	%ax, 0(%rbp)	# D.5936, MEM[base: Fout_126, offset: 0B]
	movswl	2(%rbp), %eax	# MEM[base: Fout_126, offset: 2B], D.5936
	imull	$10922, %eax, %eax	#, D.5936, D.5936
	addl	$16384, %eax	#, D.5936
	sarl	$15, %eax	#, D.5936
	movw	%ax, 2(%rbp)	# D.5936, MEM[base: Fout_126, offset: 2B]
	movswl	(%rdx), %eax	# MEM[base: _976, offset: 0B], D.5936
	imull	$10922, %eax, %eax	#, D.5936, D.5936
	addl	$16384, %eax	#, D.5936
	sarl	$15, %eax	#, D.5936
	movw	%ax, (%rdx)	# D.5936, MEM[base: _976, offset: 0B]
	movswl	2(%rdx), %eax	# MEM[base: _976, offset: 2B], D.5936
	imull	$10922, %eax, %eax	#, D.5936, D.5936
	addl	$16384, %eax	#, D.5936
	sarl	$15, %eax	#, D.5936
	movw	%ax, 2(%rdx)	# D.5936, MEM[base: _976, offset: 2B]
	movswl	(%r10), %esi	# MEM[base: _969, offset: 0B], D.5936
	movswl	2(%r10), %ecx	# MEM[base: _969, offset: 2B], D.5936
	imull	$10922, %esi, %esi	#, D.5936, D.5936
	imull	$10922, %ecx, %ecx	#, D.5936, D.5936
	addl	$16384, %esi	#, D.5936
	addl	$16384, %ecx	#, D.5936
	sarl	$15, %esi	#, D.5936
	sarl	$15, %ecx	#, D.5936
	movw	%si, (%r10)	# D.5936, MEM[base: _969, offset: 0B]
	movw	%cx, 2(%r10)	# D.5936, MEM[base: _969, offset: 2B]
	movswl	0(%r13,%r14,8), %eax	# MEM[base: tw2_125, index: ivtmp.243_120, step: 8, offset: 0B], D.5936
	movswl	(%rdx), %r12d	# MEM[base: _976, offset: 0B], D.5936
	movswl	2(%rdx), %r9d	# MEM[base: _976, offset: 2B], D.5936
	movswl	0(%r13,%r14,4), %ebx	# MEM[base: tw2_125, index: ivtmp.243_120, step: 4, offset: 0B], D.5936
	movswl	2(%r13,%r14,4), %r11d	# MEM[base: tw2_125, index: ivtmp.243_120, step: 4, offset: 2B], D.5936
	movl	%eax, %r15d	# D.5936, D.5936
	movl	%r12d, %eax	# D.5936, D.5936
	movswl	2(%r13,%r14,8), %r8d	# MEM[base: tw2_125, index: ivtmp.243_120, step: 8, offset: 2B], D.5936
	movl	%r15d, (%rsp)	# D.5936, %sfp
	movl	%r9d, %edi	# D.5936, D.5936
	imull	%ebx, %eax	# D.5936, D.5936
	imull	%r11d, %edi	# D.5936, D.5936
	imull	%ebx, %r9d	# D.5936, D.5936
	movzwl	0(%rbp), %ebx	# MEM[base: Fout_126, offset: 0B], D.5939
	imull	%r12d, %r11d	# D.5936, D.5936
	subl	%edi, %eax	# D.5936, D.5936
	movl	%r15d, %edi	# D.5936, D.5936
	movl	%ecx, %r15d	# D.5936, D.5936
	imull	%r8d, %r15d	# D.5936, D.5936
	addl	$16384, %eax	#, D.5936
	imull	%esi, %edi	# D.5936, D.5936
	sarl	$15, %eax	#, D.5936
	imull	%r8d, %esi	# D.5936, D.5936
	leal	16384(%r11,%r9), %r9d	#, D.5936
	imull	(%rsp), %ecx	# %sfp, D.5936
	sarl	$15, %r9d	#, D.5936
	subl	%r15d, %edi	# D.5936, D.5936
	addl	$16384, %edi	#, D.5936
	leal	16384(%rsi,%rcx), %ecx	#, D.5936
	sarl	$15, %edi	#, D.5936
	leal	(%rdi,%rax), %r15d	#, D.5939
	sarl	$15, %ecx	#, D.5936
	subl	%edi, %eax	# D.5936, D.5939
	movl	%r15d, %esi	# D.5939, D.5940
	cwtl
	addq	$1, %r14	#, ivtmp.243
	leal	(%rcx,%r9), %r8d	#, D.5939
	sarw	%si	# D.5940
	subl	%ecx, %r9d	# D.5936, D.5939
	subl	%esi, %ebx	# D.5940, D.5939
	movl	%r8d, %esi	# D.5939, D.5940
	movswl	%r9w, %ecx	# D.5939, D.5936
	movw	%bx, (%rdx)	# D.5939, MEM[base: _976, offset: 0B]
	movzwl	2(%rbp), %ebx	# MEM[base: Fout_126, offset: 2B], D.5939
	sarw	%si	# D.5940
	addq	$4, %r10	#, ivtmp.258
	subl	%esi, %ebx	# D.5940, D.5939
	movw	%bx, 2(%rdx)	# D.5939, MEM[base: _976, offset: 2B]
	movl	16(%rsp), %ebx	# %sfp, D.5936
	addw	%r15w, 0(%rbp)	# D.5939, MEM[base: Fout_126, offset: 0B]
	addw	%r8w, 2(%rbp)	# D.5939, MEM[base: Fout_126, offset: 2B]
	addq	$4, %rbp	#, Fout
	imull	%ebx, %ecx	# D.5936, D.5936
	imull	%ebx, %eax	# D.5936, D.5936
	addl	$16384, %ecx	#, D.5936
	sarl	$15, %ecx	#, D.5936
	addl	$16384, %eax	#, D.5936
	movl	%ecx, %esi	# D.5936, D.5939
	addw	(%rdx), %si	# MEM[base: _976, offset: 0B], D.5939
	sarl	$15, %eax	#, D.5936
	movw	%si, -4(%r10)	# D.5939, MEM[base: _969, offset: 0B]
	movzwl	2(%rdx), %esi	# MEM[base: _976, offset: 2B], D.5939
	subl	%eax, %esi	# D.5936, D.5939
	movw	%si, -2(%r10)	# D.5939, MEM[base: _969, offset: 2B]
	subw	%cx, (%rdx)	# D.5936, MEM[base: _976, offset: 0B]
	addw	%ax, 2(%rdx)	# D.5936, MEM[base: _976, offset: 2B]
	addq	$4, %rdx	#, ivtmp.256
	cmpq	%r14, 8(%rsp)	# ivtmp.243, %sfp
# SUCC: 26 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 27 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L58	#,
# BLOCK 27 freq:250 seq:25
# PRED: 26 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	addq	$120, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%] 
	ret
# BLOCK 28 freq:250 seq:26
# PRED: 18 [33.3%]  (CAN_FALLTHRU) 8 [33.3%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L48:
	.cfi_restore_state
	movl	24(%rsp), %r8d	# %sfp,
	movq	%rbx, %rdx	# st,
	movq	%rbp, %rdi	# Fout,
	movl	$1, %esi	#,
	movl	32(%rsp), %ecx	# %sfp,
	addq	$120, %rsp	#,
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%]  (ABNORMAL,SIBCALL)
	jmp	kf_bfly_generic	#
	.cfi_endproc
.LFE58:
	.size	kf_work.constprop.1, .-kf_work.constprop.1
	.section	.text.unlikely
.LCOLDE2:
	.text
.LHOTE2:
	.section	.text.unlikely
.LCOLDB12:
	.text
.LHOTB12:
	.p2align 4,,15
	.globl	kiss_fft_alloc
	.type	kiss_fft_alloc, @function
kiss_fft_alloc:
.LFB52:
	.cfi_startproc
# BLOCK 2 freq:501 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
	leal	-1(%rdi), %eax	#, D.5975
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	cltq
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edi, %ebx	# nfft, nfft
	leaq	268(,%rax,4), %rdi	#, memneeded
	subq	$56, %rsp	#,
	.cfi_def_cfa_offset 112
	testq	%rcx, %rcx	# lenmem
# SUCC: 26 [6.7%]  (CAN_FALLTHRU) 3 [93.3%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L111	#,
# BLOCK 3 freq:468 seq:1
# PRED: 2 [93.3%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rdx, %rbp	# mem, mem
	testq	%rdx, %rdx	# mem
# SUCC: 4 [85.0%]  (FALLTHRU,CAN_FALLTHRU) 5 [15.0%]  (CAN_FALLTHRU)
	je	.L78	#,
# BLOCK 4 freq:397 seq:2
# PRED: 3 [85.0%]  (FALLTHRU,CAN_FALLTHRU)
	cmpq	(%rcx), %rdi	# *lenmem_13(D), memneeded
	movl	$0, %eax	#, tmp215
# SUCC: 5 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	cmova	%rax, %rbp	# mem,, tmp215, mem
# BLOCK 5 freq:468 seq:3
# PRED: 3 [15.0%]  (CAN_FALLTHRU) 4 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
.L78:
# SUCC: 6 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rdi, (%rcx)	# memneeded, *lenmem_13(D)
# BLOCK 6 freq:501 seq:4
# PRED: 5 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 26 [100.0%]  (CAN_FALLTHRU)
.L77:
	testq	%rbp, %rbp	# mem
# SUCC: 7 [89.9%]  (FALLTHRU,CAN_FALLTHRU) 23 [10.1%]  (CAN_FALLTHRU)
	je	.L107	#,
# BLOCK 7 freq:451 seq:5
# PRED: 6 [89.9%]  (FALLTHRU,CAN_FALLTHRU)
	movl	%ebx, 0(%rbp)	# nfft, MEM[(struct kiss_fft_state *)mem_2].nfft
	movl	%esi, 4(%rbp)	# inverse_fft, MEM[(struct kiss_fft_state *)mem_2].inverse
	testl	%ebx, %ebx	# nfft
# SUCC: 8 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 25 [9.0%]  (CAN_FALLTHRU)
	jle	.L112	#,
# BLOCK 8 freq:410 seq:6
# PRED: 7 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	pxor	%xmm3, %xmm3	# D.5977
	cvtsi2sd	%ebx, %xmm3	# nfft, D.5977
	xorl	%r14d, %r14d	# i
	movsd	.LC7(%rip), %xmm0	#, tmp157
	movsd	.LC9(%rip), %xmm4	#, tmp212
	leaq	264(%rbp), %r15	#, ivtmp.339
	leaq	40(%rsp), %r13	#, tmp214
	movsd	%xmm4, 8(%rsp)	# tmp212, %sfp
	leaq	32(%rsp), %r12	#, tmp210
	movsd	.LC10(%rip), %xmm4	#, tmp208
	divsd	%xmm3, %xmm0	# D.5977, D.5977
	movsd	%xmm3, 24(%rsp)	# D.5977, %sfp
	movsd	%xmm4, (%rsp)	# tmp208, %sfp
	mulsd	.LC8(%rip), %xmm0	#, D.5977
	movsd	%xmm0, 16(%rsp)	# D.5977, %sfp
	testl	%esi, %esi	# inverse_fft
# SUCC: 9 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 19 [50.0%]  (CAN_FALLTHRU)
	jne	.L90	#,
# BLOCK 9 freq:2278 seq:7
# PRED: 8 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 9 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L86:
	pxor	%xmm0, %xmm0	# D.5977
	cvtsi2sd	%r14d, %xmm0	# i, D.5977
	movq	%r12, %rsi	# tmp210,
	mulsd	16(%rsp), %xmm0	# %sfp, phase
	movq	%r13, %rdi	# tmp214,
	call	sincos	#
	movsd	32(%rsp), %xmm1	#, D.5977
	pxor	%xmm2, %xmm2	# tmp170
	movsd	8(%rsp), %xmm3	# %sfp, tmp212
	movsd	(%rsp), %xmm5	# %sfp, tmp208
	mulsd	%xmm3, %xmm1	# tmp212, D.5977
	movsd	40(%rsp), %xmm0	#, D.5974
	mulsd	%xmm3, %xmm0	# tmp212, D.5977
	addsd	%xmm5, %xmm1	# tmp208, D.5977
	addsd	%xmm5, %xmm0	# tmp208, D.5977
	cvttsd2si	%xmm1, %eax	# D.5977, tmp169
	cvtsi2sd	%eax, %xmm2	# tmp169, tmp170
	leal	-1(%rax), %edx	#, tmp220
	comisd	%xmm1, %xmm2	# D.5977, tmp170
	pxor	%xmm1, %xmm1	# tmp178
	cmova	%edx, %eax	# tmp169,, tmp220, tmp169
	movw	%ax, (%r15)	# tmp169, MEM[base: _88, offset: 0B]
	cvttsd2si	%xmm0, %eax	# D.5977, tmp177
	cvtsi2sd	%eax, %xmm1	# tmp177, tmp178
	leal	-1(%rax), %edx	#, tmp222
	comisd	%xmm0, %xmm1	# D.5977, tmp178
	cmova	%edx, %eax	# tmp177,, tmp222, tmp177
	addl	$1, %r14d	#, i
	addq	$4, %r15	#, ivtmp.339
	movw	%ax, -2(%r15)	# tmp177, MEM[base: _88, offset: 2B]
	cmpl	%ebx, %r14d	# nfft, i
# SUCC: 9 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 10 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L86	#,
# BLOCK 10 freq:451 seq:8
# PRED: 20 [100.0%]  (CAN_FALLTHRU) 9 [9.0%]  (FALLTHRU,CAN_FALLTHRU) 25 [100.0%]  (CAN_FALLTHRU)
.L87:
	movsd	.LC6(%rip), %xmm0	#, tmp154
	sqrtsd	24(%rsp), %xmm1	# %sfp, D.5977
	movsd	.LC5(%rip), %xmm2	#, tmp150
	leaq	8(%rbp), %rsi	#, facbuf
	andpd	%xmm1, %xmm0	# D.5977, tmp152
	comisd	%xmm0, %xmm2	# tmp152, tmp150
# SUCC: 11 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 24 [50.0%]  (CAN_FALLTHRU)
	ja	.L113	#,
# BLOCK 11 freq:452 seq:9
# PRED: 10 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 24 [100.0%]  (CAN_FALLTHRU)
.L81:
	movl	$4, %ecx	#, nfft
# SUCC: 12 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
# BLOCK 12 freq:5450 seq:10
# PRED: 11 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 18 [100.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L82:
	movl	%ebx, %eax	# nfft, tmp205
	cltd
	idivl	%ecx	# nfft
	testl	%edx, %edx	# D.5975
# SUCC: 15 [50.0%]  (CAN_FALLTHRU) 13 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L96	#,
# BLOCK 13 freq:5000 seq:11
# PRED: 12 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 14 [50.0%]  (CAN_FALLTHRU)
.L114:
	movl	%eax, %ebx	# tmp205, nfft
	movl	%ecx, (%rsi)	# nfft, *facbuf_54
	leaq	8(%rsi), %rax	#, facbuf
	movl	%ebx, 4(%rsi)	# nfft, MEM[(int *)facbuf_54 + 4B]
	cmpl	$1, %ebx	#, nfft
# SUCC: 14 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 23 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT)
	jle	.L107	#,
# BLOCK 14 freq:4550 seq:12
# PRED: 13 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rax, %rsi	# facbuf, facbuf
	movl	%ebx, %eax	# nfft, tmp205
	cltd
	idivl	%ecx	# nfft
	testl	%edx, %edx	# D.5975
# SUCC: 15 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 13 [50.0%]  (CAN_FALLTHRU)
	je	.L114	#,
# BLOCK 15 freq:5000 seq:13
# PRED: 12 [50.0%]  (CAN_FALLTHRU) 14 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
.L96:
	cmpl	$2, %ecx	#, nfft
# SUCC: 21 [33.3%]  (CAN_FALLTHRU) 16 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L92	#,
# BLOCK 16 freq:3334 seq:14
# PRED: 15 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	cmpl	$4, %ecx	#, nfft
# SUCC: 17 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 22 [50.0%]  (CAN_FALLTHRU)
	jne	.L115	#,
# BLOCK 17 freq:1667 seq:15
# PRED: 16 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	movsd	.LC3(%rip), %xmm0	#, D.5977
# SUCC: 18 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	$2, %ecx	#, nfft
# BLOCK 18 freq:4999 seq:16
# PRED: 17 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 21 [100.0%]  (CAN_FALLTHRU) 22 [100.0%]  (CAN_FALLTHRU)
.L93:
	comisd	%xmm1, %xmm0	# D.5977, D.5977
	cmova	%ebx, %ecx	# nfft,, nfft, nfft
# SUCC: 12 [100.0%]  (DFS_BACK,CAN_FALLTHRU)
	jmp	.L82	#
# BLOCK 19 freq:2278 seq:17
# PRED: 8 [50.0%]  (CAN_FALLTHRU) 19 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L90:
	pxor	%xmm0, %xmm0	# D.5977
	movq	%r12, %rsi	# tmp210,
	movq	%r13, %rdi	# tmp214,
	cvtsi2sd	%r14d, %xmm0	# i, D.5977
	mulsd	16(%rsp), %xmm0	# %sfp, phase
	xorpd	.LC11(%rip), %xmm0	#, phase
	call	sincos	#
	movsd	32(%rsp), %xmm1	#, D.5977
	pxor	%xmm2, %xmm2	# tmp193
	movsd	8(%rsp), %xmm4	# %sfp, tmp212
	movsd	(%rsp), %xmm6	# %sfp, tmp208
	mulsd	%xmm4, %xmm1	# tmp212, D.5977
	movsd	40(%rsp), %xmm0	#, D.5974
	mulsd	%xmm4, %xmm0	# tmp212, D.5977
	addsd	%xmm6, %xmm1	# tmp208, D.5977
	addsd	%xmm6, %xmm0	# tmp208, D.5977
	cvttsd2si	%xmm1, %eax	# D.5977, tmp192
	cvtsi2sd	%eax, %xmm2	# tmp192, tmp193
	leal	-1(%rax), %edx	#, tmp221
	comisd	%xmm1, %xmm2	# D.5977, tmp193
	pxor	%xmm1, %xmm1	# tmp201
	cmova	%edx, %eax	# tmp192,, tmp221, tmp192
	movw	%ax, (%r15)	# tmp192, MEM[base: _81, offset: 0B]
	cvttsd2si	%xmm0, %eax	# D.5977, tmp200
	cvtsi2sd	%eax, %xmm1	# tmp200, tmp201
	leal	-1(%rax), %edx	#, tmp223
	comisd	%xmm0, %xmm1	# D.5977, tmp201
	cmova	%edx, %eax	# tmp200,, tmp223, tmp200
	addl	$1, %r14d	#, i
	addq	$4, %r15	#, ivtmp.346
	movw	%ax, -2(%r15)	# tmp200, MEM[base: _81, offset: 2B]
	cmpl	%ebx, %r14d	# nfft, i
# SUCC: 19 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 20 [9.0%]  (FALLTHRU)
	jne	.L90	#,
# BLOCK 20 freq:205 seq:18
# PRED: 19 [9.0%]  (FALLTHRU)
# SUCC: 10 [100.0%]  (CAN_FALLTHRU)
	jmp	.L87	#
# BLOCK 21 freq:1667 seq:19
# PRED: 15 [33.3%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L92:
	movsd	.LC4(%rip), %xmm0	#, D.5977
	movl	$3, %ecx	#, nfft
# SUCC: 18 [100.0%]  (CAN_FALLTHRU)
	jmp	.L93	#
# BLOCK 22 freq:1666 seq:20
# PRED: 16 [50.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L115:
	addl	$2, %ecx	#, nfft
	pxor	%xmm0, %xmm0	# D.5977
	cvtsi2sd	%ecx, %xmm0	# nfft, D.5977
# SUCC: 18 [100.0%]  (CAN_FALLTHRU)
	jmp	.L93	#
# BLOCK 23 freq:501 seq:21
# PRED: 13 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT) 6 [10.1%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L107:
	addq	$56, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbp, %rax	# mem,
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%] 
	ret
# BLOCK 24 freq:226 seq:22
# PRED: 10 [50.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L113:
	.cfi_restore_state
	cvttsd2siq	%xmm1, %rax	# D.5977, tmp155
	pxor	%xmm1, %xmm1	# D.5977
	cvtsi2sdq	%rax, %xmm1	# tmp155, D.5977
# SUCC: 11 [100.0%]  (CAN_FALLTHRU)
	jmp	.L81	#
# BLOCK 25 freq:41 seq:23
# PRED: 7 [9.0%]  (CAN_FALLTHRU)
.L112:
	pxor	%xmm7, %xmm7	# D.5977
	cvtsi2sd	%ebx, %xmm7	# nfft, D.5977
	movsd	%xmm7, 24(%rsp)	# D.5977, %sfp
# SUCC: 10 [100.0%]  (CAN_FALLTHRU)
	jmp	.L87	#
# BLOCK 26 freq:34 seq:24
# PRED: 2 [6.7%]  (CAN_FALLTHRU)
.L111:
	movl	%esi, (%rsp)	# inverse_fft, %sfp
	call	malloc	#
	movl	(%rsp), %esi	# %sfp, inverse_fft
	movq	%rax, %rbp	#, mem
# SUCC: 6 [100.0%]  (CAN_FALLTHRU)
	jmp	.L77	#
	.cfi_endproc
.LFE52:
	.size	kiss_fft_alloc, .-kiss_fft_alloc
	.section	.text.unlikely
.LCOLDE12:
	.text
.LHOTE12:
	.section	.text.unlikely
.LCOLDB13:
	.text
.LHOTB13:
	.p2align 4,,15
	.globl	kiss_fft_stride
	.type	kiss_fft_stride, @function
kiss_fft_stride:
.LFB53:
	.cfi_startproc
# BLOCK 2 freq:10000 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
	movq	%rdi, %r8	# st, st
	movq	%rdx, %rdi	# fout, fout
	movl	%ecx, %edx	# in_stride, in_stride
	cmpq	%rdi, %rsi	# fout, fin
# SUCC: 4 [10.1%]  (CAN_FALLTHRU) 3 [89.9%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L119	#,
# BLOCK 3 freq:8986 seq:1
# PRED: 2 [89.9%]  (FALLTHRU,CAN_FALLTHRU)
	leaq	8(%r8), %rcx	#, D.6005
# SUCC: EXIT [100.0%]  (ABNORMAL,SIBCALL)
	jmp	kf_work.constprop.1	#
# BLOCK 4 freq:1014 seq:2
# PRED: 2 [10.1%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L119:
	pushq	%r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	%ecx, %r12d	# in_stride, in_stride
	pushq	%rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rsi, %rbp	# fin, fin
	pushq	%rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%r8, %rbx	# st, st
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 48
	movslq	(%r8), %rdi	# st_4(D)->nfft, D.6007
	salq	$2, %rdi	#, D.6007
	call	malloc	#
	leaq	8(%rbx), %rcx	#, D.6005
	movq	%rbx, %r8	# st,
	movl	%r12d, %edx	# in_stride,
	movq	%rbp, %rsi	# fin,
	movq	%rax, %rdi	# tmp99,
	movq	%rax, %r13	#, tmp99
	call	kf_work.constprop.1	#
	movslq	(%rbx), %rdx	# st_4(D)->nfft, D.6007
	movq	%rbp, %rdi	# fin,
	movq	%r13, %rsi	# tmp99,
	salq	$2, %rdx	#, D.6007
	call	memcpy	#
	addq	$8, %rsp	#,
	.cfi_def_cfa_offset 40
	movq	%r13, %rdi	# tmp99,
	popq	%rbx	#
	.cfi_restore 3
	.cfi_def_cfa_offset 32
	popq	%rbp	#
	.cfi_restore 6
	.cfi_def_cfa_offset 24
	popq	%r12	#
	.cfi_restore 12
	.cfi_def_cfa_offset 16
	popq	%r13	#
	.cfi_restore 13
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%]  (ABNORMAL,SIBCALL)
	jmp	free	#
	.cfi_endproc
.LFE53:
	.size	kiss_fft_stride, .-kiss_fft_stride
	.section	.text.unlikely
.LCOLDE13:
	.text
.LHOTE13:
	.section	.text.unlikely
.LCOLDB14:
	.text
.LHOTB14:
	.p2align 4,,15
	.globl	kiss_fft
	.type	kiss_fft, @function
kiss_fft:
.LFB54:
	.cfi_startproc
# BLOCK 2 freq:1391 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rsi, %r13	# fin, fin
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdx, %rbp	# fout, fout
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx	# cfg, cfg
	subq	$168, %rsp	#,
	.cfi_def_cfa_offset 224
	movq	%rdi, (%rsp)	# cfg, %sfp
	cmpq	%rdx, %rsi	# fout, fin
# SUCC: 30 [10.1%]  (CAN_FALLTHRU) 3 [89.9%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L169	#,
# BLOCK 3 freq:1250 seq:1
# PRED: 2 [89.9%]  (FALLTHRU,CAN_FALLTHRU)
	movl	12(%rdi), %ebx	# MEM[(int *)cfg_2(D) + 12B], m
	movl	8(%rdi), %eax	# MEM[(int *)cfg_2(D) + 8B], p
	movl	%ebx, %edx	# m, m
	movl	%ebx, 16(%rsp)	# m, %sfp
	movl	%eax, 8(%rsp)	# p, %sfp
	imull	%ebx, %eax	# m, D.6344
	cltq
	leaq	0(%rbp,%rax,4), %rbx	#, Fout_end
	cmpl	$1, %edx	#, m
# SUCC: 18 [28.0%]  (CAN_FALLTHRU) 4 [72.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L170	#,
# BLOCK 4 freq:900 seq:2
# PRED: 3 [72.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	(%rsp), %rax	# %sfp, cfg
	movq	%rbp, 24(%rsp)	# fout, %sfp
	movslq	16(%rsp), %r12	# %sfp, D.6345
	movslq	8(%rsp), %r14	# %sfp, D.6345
	addq	$16, %rax	#, factors
	salq	$2, %r12	#, D.6345
# SUCC: 5 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rax, %r15	# factors, factors
# BLOCK 5 freq:10000 seq:3
# PRED: 4 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 5 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L147:
	movq	(%rsp), %r9	# %sfp,
	movq	%r13, %rsi	# fin,
	movq	%rbp, %rdi	# fout,
	movq	%r15, %r8	# factors,
	movl	$1, %ecx	#,
	movq	%r14, %rdx	# D.6345,
	addq	%r12, %rbp	# D.6345, fout
	addq	$4, %r13	#, fin
	call	kf_work	#
	cmpq	%rbp, %rbx	# fout, Fout_end
# SUCC: 5 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 6 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L147	#,
# BLOCK 6 freq:900 seq:4
# PRED: 5 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	cmpl	$3, 8(%rsp)	#, %sfp
	movq	24(%rsp), %rbp	# %sfp, fout
# SUCC: 21 [20.0%]  (CAN_FALLTHRU) 7 [80.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L142	#,
# BLOCK 7 freq:1000 seq:5
# PRED: 6 [80.0%]  (FALLTHRU,CAN_FALLTHRU) 20 [80.0%]  (CAN_FALLTHRU)
.L172:
# SUCC: 8 [62.5%]  (FALLTHRU,CAN_FALLTHRU) 14 [37.5%]  (CAN_FALLTHRU)
	jle	.L171	#,
# BLOCK 8 freq:625 seq:6
# PRED: 7 [62.5%]  (FALLTHRU,CAN_FALLTHRU)
	movl	8(%rsp), %eax	# %sfp, p
	cmpl	$4, %eax	#, p
# SUCC: 25 [40.0%]  (CAN_FALLTHRU) 9 [60.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L145	#,
# BLOCK 9 freq:375 seq:7
# PRED: 8 [60.0%]  (FALLTHRU,CAN_FALLTHRU)
	cmpl	$5, %eax	#, p
# SUCC: 10 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 24 [33.3%]  (CAN_FALLTHRU)
	jne	.L141	#,
# BLOCK 10 freq:250 seq:8
# PRED: 9 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movq	(%rsp), %rax	# %sfp, twiddles
	movl	16(%rsp), %r14d	# %sfp, m
	addq	$264, %rax	#, twiddles
	movq	%rax, %rbx	# twiddles, twiddles
	movq	%rax, 104(%rsp)	# twiddles, %sfp
	movslq	%r14d, %rax	# m,
	salq	$2, %rax	#, D.6345
	leaq	0(%rbp,%rax), %r9	#, Fout1
	leaq	(%r9,%rax), %r8	#, Fout2
	leaq	(%rbx,%rax), %rdx	#, D.6350
	movq	%r8, %r15	# Fout2, Fout2
	addq	%rax, %r8	# D.6345, Fout3
	movswl	(%rdx), %edi	# MEM[(struct kiss_fft_cpx *)_1221],
	movq	%r8, (%rsp)	# Fout3, %sfp
	movzwl	2(%rdx), %ecx	# MEM[(struct kiss_fft_cpx *)_1221 + 2B], ya$i
	addq	%rax, %rdx	# D.6345, D.6350
	addq	%r8, %rax	# Fout3, Fout4
	movswl	(%rdx), %esi	# MEM[(struct kiss_fft_cpx *)_1225],
	movq	%rax, 8(%rsp)	# Fout4, %sfp
	movl	%r14d, %eax	# m, m
	movzwl	2(%rdx), %edx	# MEM[(struct kiss_fft_cpx *)_1225 + 2B], yb$i
	testl	%r14d, %r14d	# m
# SUCC: 11 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 13 [9.0%]  (CAN_FALLTHRU)
	jle	.L120	#,
# BLOCK 11 freq:228 seq:9
# PRED: 10 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	%edi, 40(%rsp)	# D.6344, %sfp
	movq	(%rsp), %rdi	# %sfp, Fout3
	subl	$1, %eax	#, D.6347
	movl	%esi, 48(%rsp)	# D.6344, %sfp
	movswl	%cx, %esi	# ya$i, D.6344
	leaq	4(%r9,%rax,4), %rax	#, D.6350
	movl	%esi, 56(%rsp)	# D.6344, %sfp
	movswl	%dx, %esi	# yb$i, D.6344
	movq	%r15, %rdx	# Fout2, Fout2
	movq	%rax, 112(%rsp)	# D.6350, %sfp
	movq	%r9, %rax	# Fout1, Fout1
	movl	%esi, 64(%rsp)	# D.6344, %sfp
	movq	%rbx, 24(%rsp)	# twiddles, %sfp
# SUCC: 12 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	$0, 32(%rsp)	#, %sfp
# BLOCK 12 freq:2528 seq:10
# PRED: 11 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 12 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L156:
	movswl	0(%rbp), %ecx	# MEM[base: fout_792, offset: 0B], D.6344
	movq	8(%rsp), %rbx	# %sfp, Fout4
	movq	32(%rsp), %r15	# %sfp, ivtmp.517
	movq	104(%rsp), %r8	# %sfp, twiddles
	imull	$6553, %ecx, %ecx	#, D.6344, D.6344
	addl	$16384, %ecx	#, D.6344
	sarl	$15, %ecx	#, D.6344
	movw	%cx, 0(%rbp)	# D.6344, MEM[base: fout_792, offset: 0B]
	movswl	2(%rbp), %ecx	# MEM[base: fout_792, offset: 2B], D.6344
	imull	$6553, %ecx, %ecx	#, D.6344, D.6344
	addl	$16384, %ecx	#, D.6344
	sarl	$15, %ecx	#, D.6344
	movw	%cx, 2(%rbp)	# D.6344, MEM[base: fout_792, offset: 2B]
	movswl	(%rax), %ecx	# MEM[base: Fout1_791, offset: 0B], D.6344
	imull	$6553, %ecx, %ecx	#, D.6344, D.6344
	addl	$16384, %ecx	#, D.6344
	sarl	$15, %ecx	#, D.6344
	movw	%cx, (%rax)	# D.6344, MEM[base: Fout1_791, offset: 0B]
	movswl	2(%rax), %ecx	# MEM[base: Fout1_791, offset: 2B], D.6344
	imull	$6553, %ecx, %ecx	#, D.6344, D.6344
	addl	$16384, %ecx	#, D.6344
	sarl	$15, %ecx	#, D.6344
	movw	%cx, 2(%rax)	# D.6344, MEM[base: Fout1_791, offset: 2B]
	movswl	(%rdx), %ecx	# MEM[base: Fout2_801, offset: 0B], D.6344
	imull	$6553, %ecx, %ecx	#, D.6344, D.6344
	addl	$16384, %ecx	#, D.6344
	sarl	$15, %ecx	#, D.6344
	movw	%cx, (%rdx)	# D.6344, MEM[base: Fout2_801, offset: 0B]
	movswl	2(%rdx), %ecx	# MEM[base: Fout2_801, offset: 2B], D.6344
	imull	$6553, %ecx, %ecx	#, D.6344, D.6344
	addl	$16384, %ecx	#, D.6344
	sarl	$15, %ecx	#, D.6344
	movw	%cx, 2(%rdx)	# D.6344, MEM[base: Fout2_801, offset: 2B]
	movswl	(%rdi), %ecx	# MEM[base: Fout3_800, offset: 0B], D.6344
	imull	$6553, %ecx, %ecx	#, D.6344, D.6344
	addl	$16384, %ecx	#, D.6344
	sarl	$15, %ecx	#, D.6344
	movw	%cx, (%rdi)	# D.6344, MEM[base: Fout3_800, offset: 0B]
	movswl	2(%rdi), %ecx	# MEM[base: Fout3_800, offset: 2B], D.6344
	imull	$6553, %ecx, %ecx	#, D.6344, D.6344
	addl	$16384, %ecx	#, D.6344
	sarl	$15, %ecx	#, D.6344
	movw	%cx, 2(%rdi)	# D.6344, MEM[base: Fout3_800, offset: 2B]
	movswl	(%rbx), %esi	# MEM[base: Fout4_986, offset: 0B], D.6344
	movswl	2(%rbx), %ecx	# MEM[base: Fout4_986, offset: 2B], D.6344
	imull	$6553, %esi, %esi	#, D.6344, D.6344
	imull	$6553, %ecx, %ecx	#, D.6344, D.6344
	addl	$16384, %esi	#, D.6344
	addl	$16384, %ecx	#, D.6344
	sarl	$15, %esi	#, D.6344
	sarl	$15, %ecx	#, D.6344
	movw	%si, (%rbx)	# D.6344, MEM[base: Fout4_986, offset: 0B]
	movw	%cx, 2(%rbx)	# D.6344, MEM[base: Fout4_986, offset: 2B]
	movzwl	2(%rbp), %r9d	# MEM[base: fout_792, offset: 2B], scratch$0$i
	movswl	(%r8,%r15,2), %r11d	# MEM[base: twiddles_1217, index: ivtmp.517_1215, step: 2, offset: 0B], D.6344
	movswl	(%rdx), %r10d	# MEM[base: Fout2_801, offset: 0B], D.6344
	movswl	(%r8,%r15), %r13d	# MEM[base: twiddles_1217, index: ivtmp.517_1215, offset: 0B], D.6344
	movswl	(%rax), %r14d	# MEM[base: Fout1_791, offset: 0B], D.6344
	movw	%r9w, 16(%rsp)	# scratch$0$i, %sfp
	movswl	2(%r8,%r15), %r12d	# MEM[base: twiddles_1217, index: ivtmp.517_1215, offset: 2B], D.6344
	movl	%r11d, 92(%rsp)	# D.6344, %sfp
	movq	%r8, %r11	# twiddles, twiddles
	movswl	2(%rax), %ebx	# MEM[base: Fout1_791, offset: 2B], D.6344
	movl	%r10d, 88(%rsp)	# D.6344, %sfp
	movswl	2(%rdx), %r9d	# MEM[base: Fout2_801, offset: 2B], D.6344
	movl	%r9d, 96(%rsp)	# D.6344, %sfp
	movswl	2(%r8,%r15,2), %r9d	# MEM[base: twiddles_1217, index: ivtmp.517_1215, step: 2, offset: 2B], D.6344
	movswl	(%rdi), %r8d	# MEM[base: Fout3_800, offset: 0B], D.6344
	movl	%r8d, 100(%rsp)	# D.6344, %sfp
	movq	24(%rsp), %r8	# %sfp, ivtmp.538
	movswl	(%r8), %r10d	# MEM[base: _1184, offset: 0B], D.6344
	movswl	2(%r8), %r8d	# MEM[base: _1184, offset: 2B], D.6344
	movl	%r10d, 80(%rsp)	# D.6344, %sfp
	movswl	2(%rdi), %r10d	# MEM[base: Fout3_800, offset: 2B], D.6344
	movl	%r14d, %edi	# D.6344, D.6344
	imull	%r13d, %edi	# D.6344, D.6344
	movl	%r10d, 72(%rsp)	# D.6344, %sfp
	movswl	(%r11,%r15,4), %r10d	# MEM[base: twiddles_1217, index: ivtmp.517_1215, step: 4, offset: 0B], D.6344
	movswl	2(%r11,%r15,4), %r11d	# MEM[base: twiddles_1217, index: ivtmp.517_1215, step: 4, offset: 2B], D.6344
	movl	%ebx, %r15d	# D.6344, D.6344
	imull	%r12d, %r15d	# D.6344, D.6344
	subl	%r15d, %edi	# D.6344, D.6344
	movl	%esi, %r15d	# D.6344, D.6344
	addl	$16384, %edi	#, D.6344
	imull	%r10d, %r15d	# D.6344, D.6344
	imull	%r14d, %r12d	# D.6344, D.6344
	sarl	$15, %edi	#, D.6344
	imull	%r13d, %ebx	# D.6344, D.6344
	movl	%edi, 84(%rsp)	# D.6344, %sfp
	movl	96(%rsp), %r13d	# %sfp, D.6344
	imull	%r11d, %esi	# D.6344, D.6344
	movl	%r15d, %edi	# D.6344, D.6344
	movl	%ecx, %r15d	# D.6344, D.6344
	imull	%r10d, %ecx	# D.6344, D.6344
	leal	16384(%r12,%rbx), %ebx	#, D.6344
	movl	88(%rsp), %r12d	# %sfp, D.6344
	imull	%r11d, %r15d	# D.6344, D.6344
	movl	92(%rsp), %r11d	# %sfp, D.6344
	sarl	$15, %ebx	#, D.6344
	movl	%r13d, %r10d	# D.6344, D.6344
	leal	16384(%rsi,%rcx), %ecx	#, D.6344
	imull	%r9d, %r10d	# D.6344, D.6344
	sarl	$15, %ecx	#, D.6344
	subl	%r15d, %edi	# D.6344, D.6344
	leal	(%rcx,%rbx), %esi	#, D.6349
	movl	%ecx, %r14d	# D.6344, D.6344
	movl	%r12d, %ecx	# D.6344, D.6344
	imull	%r11d, %ecx	# D.6344, D.6344
	addl	$16384, %edi	#, D.6344
	movl	%edi, %r15d	# D.6344, D.6344
	imull	%r12d, %r9d	# D.6344, D.6344
	movzwl	0(%rbp), %r12d	# MEM[base: fout_792, offset: 0B], D.6349
	sarl	$15, %r15d	#, D.6344
	subl	%r10d, %ecx	# D.6344, D.6344
	movl	%r15d, 120(%rsp)	# D.6344, %sfp
	movl	%r15d, %edi	# D.6344, D.6349
	movl	100(%rsp), %r15d	# %sfp, D.6344
	leal	16384(%rcx), %r10d	#, D.6344
	addw	84(%rsp), %di	# %sfp, D.6349
	movl	%r10d, %ecx	# D.6344, D.6344
	movl	72(%rsp), %r10d	# %sfp, D.6344
	sarl	$15, %ecx	#, D.6344
	movl	%ecx, 88(%rsp)	# D.6344, %sfp
	movl	80(%rsp), %ecx	# %sfp, D.6344
	imull	%r8d, %r10d	# D.6344, D.6344
	imull	%r15d, %r8d	# D.6344, D.6344
	imull	%r15d, %ecx	# D.6344, D.6344
	movl	%r12d, %r15d	# D.6349, D.6349
	subl	%r10d, %ecx	# D.6344, D.6344
	movl	%r11d, %r10d	# D.6344, D.6344
	addl	$16384, %ecx	#, D.6344
	imull	%r13d, %r10d	# D.6344, D.6344
	sarl	$15, %ecx	#, D.6344
	movl	%ecx, 92(%rsp)	# D.6344, %sfp
	addw	88(%rsp), %cx	# %sfp, D.6349
	leal	16384(%r9,%r10), %r9d	#, D.6344
	movl	80(%rsp), %r10d	# %sfp, D.6344
	movw	%r15w, 80(%rsp)	# D.6349, %sfp
	imull	72(%rsp), %r10d	# %sfp, D.6344
	sarl	$15, %r9d	#, D.6344
	leal	(%rcx,%r12), %r11d	#, D.6349
	movswl	%cx, %ecx	# D.6349, D.6344
	addl	%edi, %r11d	# D.6349, tmp2115
	movw	%r11w, 0(%rbp)	# tmp2115, MEM[base: fout_792, offset: 0B]
	movzwl	16(%rsp), %r11d	# %sfp, scratch$0$i
	leal	16384(%r8,%r10), %r8d	#, D.6344
	sarl	$15, %r8d	#, D.6344
	leal	(%r8,%r9), %r10d	#, D.6349
	addl	%r10d, %r11d	# D.6349, D.6349
	addl	%esi, %r11d	# D.6349, tmp2117
	movw	%r11w, 2(%rbp)	# tmp2117, MEM[base: fout_792, offset: 2B]
	movswl	%di, %r11d	# D.6349, D.6344
	movl	%r15d, %edi	# D.6349, D.6349
	movl	%r11d, %r12d	# D.6344, D.6344
	movl	48(%rsp), %r11d	# %sfp, D.6344
	movl	%r12d, 72(%rsp)	# D.6344, %sfp
	movl	40(%rsp), %r15d	# %sfp, D.6344
	movl	%r11d, %r13d	# D.6344, D.6344
	imull	%ecx, %r13d	# D.6344, D.6344
	subl	%r14d, %ebx	# D.6344, D.6349
	movl	56(%rsp), %r14d	# %sfp, D.6344
	subl	%r8d, %r9d	# D.6344, D.6349
	imull	%r15d, %r12d	# D.6344, D.6344
	movswl	%r9w, %r9d	# D.6349, D.6344
	addl	$16384, %r13d	#, D.6344
	sarl	$15, %r13d	#, D.6344
	addl	%r13d, %edi	# D.6344, D.6349
	movl	%r12d, %r13d	# D.6344, D.6344
	addl	$16384, %r13d	#, D.6344
	sarl	$15, %r13d	#, D.6344
	addl	%edi, %r13d	# D.6349, D.6349
	movl	%r13d, %r12d	# D.6349, D.6349
	movswl	%si, %r13d	# D.6349, D.6344
	movswl	%r10w, %esi	# D.6349, D.6344
	movzwl	16(%rsp), %r10d	# %sfp, scratch$0$i
	imull	%esi, %r11d	# D.6344, D.6344
	addl	$16384, %r11d	#, D.6344
	sarl	$15, %r11d	#, D.6344
	leal	(%r10,%r11), %edi	#, D.6349
	movl	%r15d, %r10d	# D.6344, D.6344
	movswl	%bx, %r15d	# D.6349, D.6344
	imull	%r13d, %r10d	# D.6344, D.6344
	movl	%r10d, %r11d	# D.6344, D.6344
	movl	%r14d, %r10d	# D.6344, D.6344
	imull	%r15d, %r10d	# D.6344, D.6344
	addl	$16384, %r11d	#, D.6344
	sarl	$15, %r11d	#, D.6344
	addl	%edi, %r11d	# D.6349, D.6349
	movl	%r10d, %ebx	# D.6344, D.6344
	addl	$16384, %ebx	#, D.6344
	movl	%ebx, %r10d	# D.6344, D.6344
	sarl	$15, %r10d	#, D.6344
	movl	%r10d, %r8d	# D.6344, D.6344
	movl	64(%rsp), %r10d	# %sfp, D.6344
	imull	%r9d, %r10d	# D.6344, D.6344
	movl	%r10d, %ebx	# D.6344, D.6344
	addl	$16384, %ebx	#, D.6344
	movl	%ebx, %r10d	# D.6344, D.6344
	sarl	$15, %r10d	#, D.6344
	leal	(%r8,%r10), %ebx	#, D.6349
	movzwl	84(%rsp), %r10d	# %sfp, D.6349
	movw	%r12w, 84(%rsp)	# D.6349, %sfp
	subw	120(%rsp), %r10w	# %sfp, D.6349
	subl	%ebx, %r12d	# D.6349, tmp2148
	movw	%r12w, (%rax)	# tmp2148, MEM[base: Fout1_791, offset: 0B]
	movzwl	80(%rsp), %r12d	# %sfp, D.6349
	movswl	%r10w, %r8d	# D.6349,
	movzwl	88(%rsp), %r10d	# %sfp, D.6349
	imull	%r8d, %r14d	# D.6344, D.6344
	subw	92(%rsp), %r10w	# %sfp, D.6349
	movl	%r14d, %edi	# D.6344, D.6344
	addl	$16384, %edi	#, D.6344
	movswl	%r10w, %r10d	# D.6349, D.6344
	movl	%edi, %r14d	# D.6344, D.6344
	movl	64(%rsp), %edi	# %sfp, D.6344
	sarl	$15, %r14d	#, D.6344
	imull	%r10d, %edi	# D.6344, D.6344
	addl	$16384, %edi	#, D.6344
	sarl	$15, %edi	#, D.6344
	addl	%r14d, %edi	# D.6344, D.6349
	addw	84(%rsp), %bx	# %sfp, tmp2150
	leal	(%r11,%rdi), %r14d	#, tmp2149
	subl	%edi, %r11d	# D.6349, tmp2151
	movw	%r14w, 2(%rax)	# tmp2149, MEM[base: Fout1_791, offset: 2B]
	movq	8(%rsp), %r14	# %sfp, Fout4
	movw	%bx, (%r14)	# tmp2150, MEM[base: Fout4_986, offset: 0B]
	movl	40(%rsp), %ebx	# %sfp, D.6344
	movw	%r11w, 2(%r14)	# tmp2151, MEM[base: Fout4_986, offset: 2B]
	movl	48(%rsp), %r11d	# %sfp, D.6344
	imull	%ebx, %ecx	# D.6344, D.6344
	imull	%ebx, %esi	# D.6344, D.6344
	movzwl	16(%rsp), %ebx	# %sfp, scratch$0$i
	addl	$16384, %ecx	#, D.6344
	sarl	$15, %ecx	#, D.6344
	addl	$16384, %esi	#, D.6344
	addl	%ecx, %r12d	# D.6344, D.6349
	movl	72(%rsp), %ecx	# %sfp, D.6344
	sarl	$15, %esi	#, D.6344
	imull	%r11d, %ecx	# D.6344, D.6344
	movl	%ecx, %edi	# D.6344, D.6344
	leal	(%rbx,%rsi), %ecx	#, D.6349
	movl	%r13d, %esi	# D.6344, D.6344
	addl	$16384, %edi	#, D.6344
	imull	%r11d, %esi	# D.6344, D.6344
	movl	64(%rsp), %r11d	# %sfp, D.6344
	sarl	$15, %edi	#, D.6344
	addl	%edi, %r12d	# D.6344, D.6349
	movq	(%rsp), %rdi	# %sfp, Fout3
	addl	$16384, %esi	#, D.6344
	sarl	$15, %esi	#, D.6344
	imull	%r11d, %r15d	# D.6344, D.6344
	addl	%ecx, %esi	# D.6349, D.6349
	movl	56(%rsp), %ecx	# %sfp, D.6344
	imull	%r11d, %r8d	# D.6344, D.6344
	addl	$16384, %r15d	#, D.6344
	sarl	$15, %r15d	#, D.6344
	addl	$16384, %r8d	#, D.6344
	imull	%ecx, %r9d	# D.6344, D.6344
	sarl	$15, %r8d	#, D.6344
	imull	%ecx, %r10d	# D.6344, D.6344
	addl	$16384, %r9d	#, D.6344
	sarl	$15, %r9d	#, D.6344
	addl	$16384, %r10d	#, D.6344
	subl	%r15d, %r9d	# D.6344, D.6349
	sarl	$15, %r10d	#, D.6344
	leal	(%r12,%r9), %ecx	#, tmp2178
	subl	%r10d, %r8d	# D.6344, D.6349
	subl	%r9d, %r12d	# D.6349, tmp2180
	movw	%cx, (%rdx)	# tmp2178, MEM[base: Fout2_801, offset: 0B]
	leal	(%rsi,%r8), %ecx	#, tmp2179
	subl	%r8d, %esi	# D.6349, tmp2181
	addq	$4, %rbp	#, fout
	movw	%cx, 2(%rdx)	# tmp2179, MEM[base: Fout2_801, offset: 2B]
	addq	$4, %rdi	#, Fout3
	addq	$4, %r14	#, Fout4
	addq	$4, %rax	#, Fout1
	addq	$4, 32(%rsp)	#, %sfp
	movw	%r12w, -4(%rdi)	# tmp2180, MEM[base: Fout3_800, offset: 0B]
	addq	$4, %rdx	#, Fout2
	movw	%si, -2(%rdi)	# tmp2181, MEM[base: Fout3_800, offset: 2B]
	movq	%r14, 8(%rsp)	# Fout4, %sfp
	movq	%rdi, (%rsp)	# Fout3, %sfp
	addq	$12, 24(%rsp)	#, %sfp
	cmpq	112(%rsp), %rax	# %sfp, Fout1
# SUCC: 12 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 13 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L156	#,
# BLOCK 13 freq:1000 seq:11
# PRED: 17 [100.0%]  (CAN_FALLTHRU) 10 [9.0%]  (CAN_FALLTHRU) 27 [9.0%]  (CAN_FALLTHRU) 12 [9.0%]  (FALLTHRU,CAN_FALLTHRU) 23 [100.0%]  (CAN_FALLTHRU)
.L120:
	addq	$168, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%] 
	ret
# BLOCK 14 freq:375 seq:12
# PRED: 7 [37.5%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L171:
	.cfi_restore_state
	cmpl	$2, 8(%rsp)	#, %sfp
# SUCC: 15 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 24 [33.3%]  (CAN_FALLTHRU)
	jne	.L141	#,
# BLOCK 15 freq:250 seq:13
# PRED: 14 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movl	16(%rsp), %ebx	# %sfp, m
	movq	(%rsp), %r8	# %sfp, tw1
	movslq	%ebx, %rax	# m,
	leaq	0(%rbp,%rax,4), %rdi	#, Fout2
	movl	%ebx, %eax	# m, m
	addq	$264, %r8	#, tw1
	subl	$1, %eax	#, D.6347
# SUCC: 16 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	leaq	4(%rbp,%rax,4), %r9	#, D.6350
# BLOCK 16 freq:2778 seq:14
# PRED: 15 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 16 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L149:
	movswl	0(%rbp), %edx	# MEM[base: fout_817, offset: 0B], D.6344
	addq	$4, %r8	#, tw1
	addq	$4, %rdi	#, Fout2
	movl	%edx, %eax	# D.6344, tmp1835
	sall	$14, %eax	#, tmp1835
	subl	%edx, %eax	# D.6344, D.6344
	movswl	2(%rbp), %edx	# MEM[base: fout_817, offset: 2B], D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, 0(%rbp)	# D.6344, MEM[base: fout_817, offset: 0B]
	movl	%edx, %eax	# D.6344, tmp1841
	sall	$14, %eax	#, tmp1841
	subl	%edx, %eax	# D.6344, D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, 2(%rbp)	# D.6344, MEM[base: fout_817, offset: 2B]
	movswl	-4(%rdi), %eax	# MEM[base: Fout2_830, offset: 0B], D.6344
	movswl	-2(%rdi), %ecx	# MEM[base: Fout2_830, offset: 2B], D.6344
	movl	%eax, %edx	# D.6344, tmp1847
	sall	$14, %edx	#, tmp1847
	subl	%eax, %edx	# D.6344, D.6344
	movl	%ecx, %eax	# D.6344, tmp1852
	sall	$14, %eax	#, tmp1852
	addl	$16384, %edx	#, D.6344
	subl	%ecx, %eax	# D.6344, D.6344
	sarl	$15, %edx	#, D.6344
	addl	$16384, %eax	#, D.6344
	movw	%dx, -4(%rdi)	# D.6344, MEM[base: Fout2_830, offset: 0B]
	movl	%edx, %ecx	# D.6344, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, -2(%rdi)	# D.6344, MEM[base: Fout2_830, offset: 2B]
	movswl	-4(%r8), %esi	# MEM[base: tw1_844, offset: 0B], D.6344
	movl	%eax, %r11d	# D.6344, D.6344
	movswl	-2(%r8), %r10d	# MEM[base: tw1_844, offset: 2B], D.6344
	imull	%esi, %ecx	# D.6344, D.6344
	imull	%r10d, %r11d	# D.6344, D.6344
	imull	%r10d, %edx	# D.6344, D.6344
	imull	%esi, %eax	# D.6344, D.6344
	subl	%r11d, %ecx	# D.6344, D.6344
	movzwl	0(%rbp), %r11d	# MEM[base: fout_817, offset: 0B], D.6349
	addl	$16384, %ecx	#, D.6344
	leal	16384(%rdx,%rax), %eax	#, D.6344
	sarl	$15, %ecx	#, D.6344
	sarl	$15, %eax	#, D.6344
	subl	%ecx, %r11d	# D.6344, D.6349
	movw	%r11w, -4(%rdi)	# D.6349, MEM[base: Fout2_830, offset: 0B]
	movzwl	2(%rbp), %edx	# MEM[base: fout_817, offset: 2B], D.6349
	subl	%eax, %edx	# D.6344, D.6349
	movw	%dx, -2(%rdi)	# D.6349, MEM[base: Fout2_830, offset: 2B]
	addw	%cx, 0(%rbp)	# D.6344, MEM[base: fout_817, offset: 0B]
	addw	%ax, 2(%rbp)	# D.6344, MEM[base: fout_817, offset: 2B]
	addq	$4, %rbp	#, fout
	cmpq	%r9, %rbp	# D.6350, fout
# SUCC: 16 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 17 [9.0%]  (FALLTHRU)
	jne	.L149	#,
# BLOCK 17 freq:250 seq:15
# PRED: 16 [9.0%]  (FALLTHRU)
# SUCC: 13 [100.0%]  (CAN_FALLTHRU)
	jmp	.L120	#
# BLOCK 18 freq:350 seq:16
# PRED: 3 [28.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L170:
# SUCC: 19 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rbp, %rax	# fout, fout
# BLOCK 19 freq:3889 seq:17
# PRED: 18 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 19 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L140:
	movl	0(%r13), %edx	# MEM[base: fin_789, offset: 0B], MEM[base: fin_789, offset: 0B]
	addq	$4, %rax	#, fout
	addq	$4, %r13	#, fin
	movl	%edx, -4(%rax)	# MEM[base: fin_789, offset: 0B], MEM[base: fout_790, offset: 0B]
	cmpq	%rax, %rbx	# fout, Fout_end
# SUCC: 19 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 20 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L140	#,
# BLOCK 20 freq:350 seq:18
# PRED: 19 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	cmpl	$3, 8(%rsp)	#, %sfp
# SUCC: 21 [20.0%]  (FALLTHRU,CAN_FALLTHRU) 7 [80.0%]  (CAN_FALLTHRU)
	jne	.L172	#,
# BLOCK 21 freq:250 seq:19
# PRED: 6 [20.0%]  (CAN_FALLTHRU) 20 [20.0%]  (FALLTHRU,CAN_FALLTHRU)
.L142:
	movslq	16(%rsp), %rax	# %sfp, m
	xorl	%r13d, %r13d	# ivtmp.469
	movq	(%rsp), %rbx	# %sfp, cfg
	movq	%rax, 8(%rsp)	# m, %sfp
	leaq	0(%rbp,%rax,4), %rdx	#, ivtmp.482
	leaq	264(%rbx), %r14	#, tw2
	movswl	266(%rbx,%rax,4), %ebx	# MEM[(struct  *)_888 + 2B], D.6344
	leaq	0(%rbp,%rax,8), %r10	#, ivtmp.484
# SUCC: 22 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	%ebx, 16(%rsp)	# D.6344, %sfp
# BLOCK 22 freq:2778 seq:20
# PRED: 21 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 22 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L151:
	movswl	0(%rbp), %eax	# MEM[base: fout_891, offset: 0B], D.6344
	imull	$10922, %eax, %eax	#, D.6344, D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, 0(%rbp)	# D.6344, MEM[base: fout_891, offset: 0B]
	movswl	2(%rbp), %eax	# MEM[base: fout_891, offset: 2B], D.6344
	imull	$10922, %eax, %eax	#, D.6344, D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, 2(%rbp)	# D.6344, MEM[base: fout_891, offset: 2B]
	movswl	(%rdx), %eax	# MEM[base: _597, offset: 0B], D.6344
	imull	$10922, %eax, %eax	#, D.6344, D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, (%rdx)	# D.6344, MEM[base: _597, offset: 0B]
	movswl	2(%rdx), %eax	# MEM[base: _597, offset: 2B], D.6344
	imull	$10922, %eax, %eax	#, D.6344, D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, 2(%rdx)	# D.6344, MEM[base: _597, offset: 2B]
	movswl	(%r10), %esi	# MEM[base: _1931, offset: 0B], D.6344
	movswl	2(%r10), %ecx	# MEM[base: _1931, offset: 2B], D.6344
	imull	$10922, %esi, %esi	#, D.6344, D.6344
	imull	$10922, %ecx, %ecx	#, D.6344, D.6344
	addl	$16384, %esi	#, D.6344
	addl	$16384, %ecx	#, D.6344
	sarl	$15, %esi	#, D.6344
	sarl	$15, %ecx	#, D.6344
	movw	%si, (%r10)	# D.6344, MEM[base: _1931, offset: 0B]
	movw	%cx, 2(%r10)	# D.6344, MEM[base: _1931, offset: 2B]
	movswl	(%r14,%r13,8), %eax	# MEM[base: tw2_890, index: ivtmp.469_884, step: 8, offset: 0B], D.6344
	movswl	(%rdx), %r12d	# MEM[base: _597, offset: 0B], D.6344
	movswl	2(%rdx), %r9d	# MEM[base: _597, offset: 2B], D.6344
	movswl	(%r14,%r13,4), %ebx	# MEM[base: tw2_890, index: ivtmp.469_884, step: 4, offset: 0B], D.6344
	movswl	2(%r14,%r13,4), %r11d	# MEM[base: tw2_890, index: ivtmp.469_884, step: 4, offset: 2B], D.6344
	movl	%eax, %r15d	# D.6344, D.6344
	movl	%r12d, %eax	# D.6344, D.6344
	movswl	2(%r14,%r13,8), %r8d	# MEM[base: tw2_890, index: ivtmp.469_884, step: 8, offset: 2B], D.6344
	movl	%r15d, (%rsp)	# D.6344, %sfp
	movl	%r9d, %edi	# D.6344, D.6344
	imull	%ebx, %eax	# D.6344, D.6344
	imull	%r11d, %edi	# D.6344, D.6344
	imull	%ebx, %r9d	# D.6344, D.6344
	movzwl	0(%rbp), %ebx	# MEM[base: fout_891, offset: 0B], D.6349
	imull	%r12d, %r11d	# D.6344, D.6344
	subl	%edi, %eax	# D.6344, D.6344
	movl	%r15d, %edi	# D.6344, D.6344
	movl	%ecx, %r15d	# D.6344, D.6344
	imull	%r8d, %r15d	# D.6344, D.6344
	addl	$16384, %eax	#, D.6344
	imull	%esi, %edi	# D.6344, D.6344
	sarl	$15, %eax	#, D.6344
	imull	%r8d, %esi	# D.6344, D.6344
	leal	16384(%r11,%r9), %r9d	#, D.6344
	imull	(%rsp), %ecx	# %sfp, D.6344
	sarl	$15, %r9d	#, D.6344
	subl	%r15d, %edi	# D.6344, D.6344
	addl	$16384, %edi	#, D.6344
	leal	16384(%rsi,%rcx), %ecx	#, D.6344
	sarl	$15, %edi	#, D.6344
	leal	(%rdi,%rax), %r15d	#, D.6349
	sarl	$15, %ecx	#, D.6344
	subl	%edi, %eax	# D.6344, D.6349
	movl	%r15d, %esi	# D.6349, D.6348
	cwtl
	addq	$1, %r13	#, ivtmp.469
	leal	(%rcx,%r9), %r8d	#, D.6349
	sarw	%si	# D.6348
	subl	%ecx, %r9d	# D.6344, D.6349
	subl	%esi, %ebx	# D.6348, D.6349
	movl	%r8d, %esi	# D.6349, D.6348
	movswl	%r9w, %ecx	# D.6349, D.6344
	movw	%bx, (%rdx)	# D.6349, MEM[base: _597, offset: 0B]
	movzwl	2(%rbp), %ebx	# MEM[base: fout_891, offset: 2B], D.6349
	sarw	%si	# D.6348
	addq	$4, %r10	#, ivtmp.484
	subl	%esi, %ebx	# D.6348, D.6349
	movw	%bx, 2(%rdx)	# D.6349, MEM[base: _597, offset: 2B]
	movl	16(%rsp), %ebx	# %sfp, D.6344
	addw	%r15w, 0(%rbp)	# D.6349, MEM[base: fout_891, offset: 0B]
	addw	%r8w, 2(%rbp)	# D.6349, MEM[base: fout_891, offset: 2B]
	addq	$4, %rbp	#, fout
	imull	%ebx, %ecx	# D.6344, D.6344
	imull	%ebx, %eax	# D.6344, D.6344
	addl	$16384, %ecx	#, D.6344
	sarl	$15, %ecx	#, D.6344
	addl	$16384, %eax	#, D.6344
	movl	%ecx, %esi	# D.6344, D.6349
	addw	(%rdx), %si	# MEM[base: _597, offset: 0B], D.6349
	sarl	$15, %eax	#, D.6344
	movw	%si, -4(%r10)	# D.6349, MEM[base: _1931, offset: 0B]
	movzwl	2(%rdx), %esi	# MEM[base: _597, offset: 2B], D.6349
	subl	%eax, %esi	# D.6344, D.6349
	movw	%si, -2(%r10)	# D.6349, MEM[base: _1931, offset: 2B]
	subw	%cx, (%rdx)	# D.6344, MEM[base: _597, offset: 0B]
	addw	%ax, 2(%rdx)	# D.6344, MEM[base: _597, offset: 2B]
	addq	$4, %rdx	#, ivtmp.482
	cmpq	%r13, 8(%rsp)	# ivtmp.469, %sfp
# SUCC: 22 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 23 [9.0%]  (FALLTHRU)
	jne	.L151	#,
# BLOCK 23 freq:250 seq:21
# PRED: 22 [9.0%]  (FALLTHRU)
# SUCC: 13 [100.0%]  (CAN_FALLTHRU)
	jmp	.L120	#
# BLOCK 24 freq:250 seq:22
# PRED: 14 [33.3%]  (CAN_FALLTHRU) 9 [33.3%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L141:
	movl	8(%rsp), %r8d	# %sfp,
	movq	%rbp, %rdi	# fout,
	movl	$1, %esi	#,
	movl	16(%rsp), %ecx	# %sfp,
	movq	(%rsp), %rdx	# %sfp,
	addq	$168, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%]  (ABNORMAL,SIBCALL)
	jmp	kf_bfly_generic	#
# BLOCK 25 freq:250 seq:23
# PRED: 8 [40.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L145:
	.cfi_restore_state
	movq	(%rsp), %rdx	# %sfp, cfg
	xorl	%r8d, %r8d	# ivtmp.489
	movslq	16(%rsp), %rax	# %sfp, k
	movq	%rdx, %rbx	# cfg, cfg
	addq	$264, %rbx	#, tw3
	movq	%rax, 64(%rsp)	# k, %sfp
	salq	$2, %rax	#, D.6345
	leaq	0(%rbp,%rax), %r9	#, ivtmp.505
	movq	%rbx, %rsi	# tw3, tw3
	movl	4(%rdx), %ebx	# cfg_2(D)->inverse, D.6344
	movq	%rsi, %r14	# tw3, tw3
	movq	%rsi, (%rsp)	# tw3, %sfp
	movl	%ebx, 80(%rsp)	# D.6344, %sfp
	leaq	(%r9,%rax), %rbx	#, ivtmp.507
	leaq	(%rbx,%rax), %r11	#, ivtmp.509
# SUCC: 28 [100.0%]  (CAN_FALLTHRU)
	jmp	.L155	#
# BLOCK 26 freq:1389 seq:24
# PRED: 28 [50.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L173:
	movzwl	56(%rsp), %edi	# %sfp, D.6349
	subl	%r12d, %eax	# D.6349, tmp2023
	movw	%ax, (%r9)	# tmp2023, MEM[base: _1892, offset: 0B]
	movl	%edi, %eax	# D.6349, D.6349
	addl	%edx, %eax	# D.6349, tmp2024
	movw	%ax, 2(%r9)	# tmp2024, MEM[base: _1892, offset: 2B]
	movl	%esi, %eax	# D.6349, D.6349
	addl	%eax, %r12d	# D.6349, tmp2025
	movl	%edi, %eax	# D.6349, tmp2026
	subl	%edx, %eax	# D.6349, tmp2026
	movw	%r12w, (%r11)	# tmp2025, MEM[base: _1884, offset: 0B]
# SUCC: 27 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movw	%ax, 2(%r11)	# tmp2026, MEM[base: _1884, offset: 2B]
# BLOCK 27 freq:2778 seq:25
# PRED: 26 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 29 [100.0%]  (CAN_FALLTHRU)
.L154:
	addq	$4, %rbp	#, fout
	addq	$1, %r8	#, ivtmp.489
	addq	$4, %r9	#, ivtmp.505
	addq	$4, %rbx	#, ivtmp.507
	addq	$4, %r11	#, ivtmp.509
	cmpq	%r8, 64(%rsp)	# ivtmp.489, %sfp
# SUCC: 28 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 13 [9.0%]  (CAN_FALLTHRU)
	je	.L120	#,
# BLOCK 28 freq:2778 seq:26
# PRED: 27 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 25 [100.0%]  (CAN_FALLTHRU)
.L155:
	movswl	0(%rbp), %edx	# MEM[base: fout_1043, offset: 0B], D.6344
	movl	%edx, %eax	# D.6344, tmp1947
	sall	$13, %eax	#, tmp1947
	subl	%edx, %eax	# D.6344, D.6344
	movswl	2(%rbp), %edx	# MEM[base: fout_1043, offset: 2B], D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, 0(%rbp)	# D.6344, MEM[base: fout_1043, offset: 0B]
	movl	%edx, %eax	# D.6344, tmp1953
	sall	$13, %eax	#, tmp1953
	subl	%edx, %eax	# D.6344, D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, 2(%rbp)	# D.6344, MEM[base: fout_1043, offset: 2B]
	movswl	(%r9), %edx	# MEM[base: _1892, offset: 0B], D.6344
	movl	%edx, %eax	# D.6344, tmp1959
	sall	$13, %eax	#, tmp1959
	subl	%edx, %eax	# D.6344, D.6344
	movswl	2(%r9), %edx	# MEM[base: _1892, offset: 2B], D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, (%r9)	# D.6344, MEM[base: _1892, offset: 0B]
	movl	%edx, %eax	# D.6344, tmp1965
	sall	$13, %eax	#, tmp1965
	subl	%edx, %eax	# D.6344, D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, 2(%r9)	# D.6344, MEM[base: _1892, offset: 2B]
	movswl	(%rbx), %edx	# MEM[base: _1888, offset: 0B], D.6344
	movl	%edx, %eax	# D.6344, tmp1971
	sall	$13, %eax	#, tmp1971
	subl	%edx, %eax	# D.6344, D.6344
	movswl	2(%rbx), %edx	# MEM[base: _1888, offset: 2B], D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, (%rbx)	# D.6344, MEM[base: _1888, offset: 0B]
	movl	%edx, %eax	# D.6344, tmp1977
	sall	$13, %eax	#, tmp1977
	subl	%edx, %eax	# D.6344, D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, 2(%rbx)	# D.6344, MEM[base: _1888, offset: 2B]
	movswl	(%r11), %eax	# MEM[base: _1884, offset: 0B], D.6344
	movl	%eax, %edi	# D.6344, tmp1983
	sall	$13, %edi	#, tmp1983
	subl	%eax, %edi	# D.6344, D.6344
	movswl	2(%r11), %eax	# MEM[base: _1884, offset: 2B], D.6344
	addl	$16384, %edi	#, D.6344
	sarl	$15, %edi	#, D.6344
	movw	%di, (%r11)	# D.6344, MEM[base: _1884, offset: 0B]
	movl	%eax, %esi	# D.6344, tmp1988
	sall	$13, %esi	#, tmp1988
	subl	%eax, %esi	# D.6344, D.6344
	addl	$16384, %esi	#, D.6344
	sarl	$15, %esi	#, D.6344
	movw	%si, 2(%r11)	# D.6344, MEM[base: _1884, offset: 2B]
	movswl	(%r9), %eax	# MEM[base: _1892, offset: 0B], D.6344
	movswl	2(%r9), %edx	# MEM[base: _1892, offset: 2B], D.6344
	movswl	2(%r14,%r8,4), %ecx	# MEM[base: tw3_1042, index: ivtmp.489_1038, step: 4, offset: 2B], D.6344
	movswl	(%rbx), %r12d	# MEM[base: _1888, offset: 0B], D.6344
	movl	%eax, %r15d	# D.6344, D.6344
	movswl	(%r14,%r8,4), %eax	# MEM[base: tw3_1042, index: ivtmp.489_1038, step: 4, offset: 0B], D.6344
	movl	%edx, 16(%rsp)	# D.6344, %sfp
	movswl	2(%rbx), %edx	# MEM[base: _1888, offset: 2B], D.6344
	movswl	(%r14,%r8,8), %r10d	# MEM[base: tw3_1042, index: ivtmp.489_1038, step: 8, offset: 0B], D.6344
	movl	%ecx, 24(%rsp)	# D.6344, %sfp
	movswl	2(%r14,%r8,8), %ecx	# MEM[base: tw3_1042, index: ivtmp.489_1038, step: 8, offset: 2B], D.6344
	movl	%eax, 8(%rsp)	# D.6344, %sfp
	movq	(%rsp), %rax	# %sfp, tw3
	movswl	(%rax), %r13d	# MEM[base: tw3_1141, offset: 0B], D.6344
	movswl	2(%rax), %eax	# MEM[base: tw3_1141, offset: 2B], D.6344
	movl	%r13d, 32(%rsp)	# D.6344, %sfp
	movl	%edx, %r13d	# D.6344, D.6344
	movl	%eax, 40(%rsp)	# D.6344, %sfp
	movl	%r12d, %eax	# D.6344, D.6344
	imull	%r10d, %eax	# D.6344, D.6344
	imull	%ecx, %r13d	# D.6344, D.6344
	imull	%r10d, %edx	# D.6344, D.6344
	imull	%r12d, %ecx	# D.6344, D.6344
	subl	%r13d, %eax	# D.6344, D.6344
	movzwl	0(%rbp), %r13d	# MEM[base: fout_1043, offset: 0B], D.6349
	addl	$16384, %eax	#, D.6344
	leal	16384(%rcx,%rdx), %ecx	#, D.6344
	sarl	$15, %eax	#, D.6344
	sarl	$15, %ecx	#, D.6344
	subl	%eax, %r13d	# D.6344, D.6349
	movw	%r13w, 48(%rsp)	# D.6349, %sfp
	movzwl	2(%rbp), %r13d	# MEM[base: fout_1043, offset: 2B], D.6349
	movl	8(%rsp), %edx	# %sfp, D.6344
	movl	16(%rsp), %r10d	# %sfp, D.6344
	imull	24(%rsp), %r10d	# %sfp, D.6344
	movl	%r13d, %r12d	# D.6349, D.6349
	addw	0(%rbp), %ax	# MEM[base: fout_1043, offset: 0B], D.6349
	addq	$12, (%rsp)	#, %sfp
	imull	%r15d, %edx	# D.6344, D.6344
	subl	%ecx, %r12d	# D.6344, D.6349
	addl	%r13d, %ecx	# D.6349, D.6349
	movl	32(%rsp), %r13d	# %sfp, D.6344
	movw	%r12w, 56(%rsp)	# D.6349, %sfp
	movl	40(%rsp), %r12d	# %sfp, D.6344
	subl	%r10d, %edx	# D.6344, D.6344
	movw	%cx, 2(%rbp)	# D.6349, MEM[base: fout_1043, offset: 2B]
	movw	%ax, 0(%rbp)	# D.6349, MEM[base: fout_1043, offset: 0B]
	addl	$16384, %edx	#, D.6344
	imull	%edi, %r13d	# D.6344, D.6344
	sarl	$15, %edx	#, D.6344
	imull	%esi, %r12d	# D.6344, D.6344
	imull	40(%rsp), %edi	# %sfp, D.6344
	imull	32(%rsp), %esi	# %sfp, D.6344
	movl	%r13d, %r10d	# D.6344, D.6344
	subl	%r12d, %r10d	# D.6344, D.6344
	movl	24(%rsp), %r12d	# %sfp, D.6344
	addl	$16384, %r10d	#, D.6344
	leal	16384(%rdi,%rsi), %esi	#, D.6344
	sarl	$15, %r10d	#, D.6344
	leal	(%r10,%rdx), %r13d	#, D.6349
	sarl	$15, %esi	#, D.6344
	subl	%r10d, %edx	# D.6344, D.6349
	imull	%r15d, %r12d	# D.6344, D.6344
	subl	%r13d, %eax	# D.6349, tmp2021
	movw	%ax, (%rbx)	# tmp2021, MEM[base: _1888, offset: 0B]
	movl	%r12d, %r15d	# D.6344, D.6344
	movl	8(%rsp), %r12d	# %sfp, D.6344
	imull	16(%rsp), %r12d	# %sfp, D.6344
	leal	16384(%r15,%r12), %r12d	#, D.6344
	sarl	$15, %r12d	#, D.6344
	leal	(%rsi,%r12), %edi	#, D.6349
	subl	%esi, %r12d	# D.6344, D.6349
	movzwl	48(%rsp), %esi	# %sfp, D.6349
	subl	%edi, %ecx	# D.6349, tmp2022
	movw	%cx, 2(%rbx)	# tmp2022, MEM[base: _1888, offset: 2B]
	movl	80(%rsp), %ecx	# %sfp,
	addw	%r13w, 0(%rbp)	# D.6349, MEM[base: fout_1043, offset: 0B]
	addw	%di, 2(%rbp)	# D.6349, MEM[base: fout_1043, offset: 2B]
	movl	%esi, %eax	# D.6349, tmp2023
	testl	%ecx, %ecx	#
# SUCC: 26 [50.0%]  (CAN_FALLTHRU) 29 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L173	#,
# BLOCK 29 freq:1389 seq:27
# PRED: 28 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	movzwl	56(%rsp), %edi	# %sfp, D.6349
	addl	%r12d, %eax	# D.6349, tmp2027
	movw	%ax, (%r9)	# tmp2027, MEM[base: _1892, offset: 0B]
	movl	%edi, %eax	# D.6349, tmp2028
	subl	%edx, %eax	# D.6349, tmp2028
	movw	%ax, 2(%r9)	# tmp2028, MEM[base: _1892, offset: 2B]
	movl	%esi, %eax	# D.6349, tmp2029
	subl	%r12d, %eax	# D.6349, tmp2029
	movw	%ax, (%r11)	# tmp2029, MEM[base: _1884, offset: 0B]
	movl	%edi, %eax	# D.6349, D.6349
	addl	%eax, %edx	# D.6349, tmp2030
	movw	%dx, 2(%r11)	# tmp2030, MEM[base: _1884, offset: 2B]
# SUCC: 27 [100.0%]  (CAN_FALLTHRU)
	jmp	.L154	#
# BLOCK 30 freq:141 seq:28
# PRED: 2 [10.1%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L169:
	movslq	(%rdi), %rdi	# cfg_2(D)->nfft, D.6345
	salq	$2, %rdi	#, D.6345
	call	malloc	#
	movl	8(%rbx), %esi	# MEM[(int *)cfg_2(D) + 8B], p
	movl	12(%rbx), %ebx	# MEM[(int *)cfg_2(D) + 12B], m
	movq	%rax, %rdx	#, Fout
	movq	%rax, 128(%rsp)	# Fout, %sfp
	movl	%esi, 8(%rsp)	# p, %sfp
	imull	%ebx, %esi	# m, D.6344
	movl	%ebx, 16(%rsp)	# m, %sfp
	movslq	%esi, %rax	# D.6344,
	movq	%rdx, %rsi	# Fout, Fout
	leaq	(%rdx,%rax,4), %r12	#, Fout_end
	cmpl	$1, %ebx	#, m
# SUCC: 52 [28.0%]  (CAN_FALLTHRU) 31 [72.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L174	#,
# BLOCK 31 freq:102 seq:29
# PRED: 30 [72.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	(%rsp), %rax	# %sfp, cfg
	movq	%r13, %rbx	# fin, fin
	movq	%r13, 24(%rsp)	# fin, %sfp
	movq	%rsi, %r13	# Fout, Fout
	movslq	16(%rsp), %rbp	# %sfp, D.6345
	movslq	8(%rsp), %r14	# %sfp, D.6345
	addq	$16, %rax	#, factors
	salq	$2, %rbp	#, D.6345
# SUCC: 32 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rax, %r15	# factors, factors
# BLOCK 32 freq:1128 seq:30
# PRED: 31 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 32 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L129:
	movq	(%rsp), %r9	# %sfp,
	movq	%rbx, %rsi	# fin,
	movq	%r13, %rdi	# Fout,
	movq	%r15, %r8	# factors,
	movl	$1, %ecx	#,
	movq	%r14, %rdx	# D.6345,
	addq	%rbp, %r13	# D.6345, Fout
	addq	$4, %rbx	#, fin
	call	kf_work	#
	cmpq	%r13, %r12	# Fout, Fout_end
# SUCC: 32 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 33 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L129	#,
# BLOCK 33 freq:102 seq:31
# PRED: 32 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
# SUCC: 34 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	24(%rsp), %r13	# %sfp, fin
# BLOCK 34 freq:142 seq:32
# PRED: 33 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 52 [100.0%]  (CAN_FALLTHRU)
.L130:
	cmpl	$3, 8(%rsp)	#, %sfp
# SUCC: 53 [20.0%]  (CAN_FALLTHRU) 35 [80.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L124	#,
# BLOCK 35 freq:114 seq:33
# PRED: 34 [80.0%]  (FALLTHRU,CAN_FALLTHRU)
# SUCC: 36 [62.5%]  (FALLTHRU,CAN_FALLTHRU) 48 [37.5%]  (CAN_FALLTHRU)
	jle	.L175	#,
# BLOCK 36 freq:71 seq:34
# PRED: 35 [62.5%]  (FALLTHRU,CAN_FALLTHRU)
	movl	8(%rsp), %eax	# %sfp, p
	cmpl	$4, %eax	#, p
# SUCC: 43 [40.0%]  (CAN_FALLTHRU) 37 [60.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L127	#,
# BLOCK 37 freq:43 seq:35
# PRED: 36 [60.0%]  (FALLTHRU,CAN_FALLTHRU)
	cmpl	$5, %eax	#, p
# SUCC: 38 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 56 [33.3%]  (CAN_FALLTHRU)
	jne	.L123	#,
# BLOCK 38 freq:28 seq:36
# PRED: 37 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movq	(%rsp), %rax	# %sfp, cfg
	movl	16(%rsp), %r14d	# %sfp, m
	movq	128(%rsp), %r8	# %sfp, Fout
	addq	$264, %rax	#, twiddles
	movq	%rax, %rbx	# twiddles, twiddles
	movq	%rax, 136(%rsp)	# twiddles, %sfp
	movslq	%r14d, %rax	# m,
	salq	$2, %rax	#, D.6345
	movq	%r8, %r9	# Fout, Fout
	leaq	(%rbx,%rax), %rdx	#, D.6350
	addq	%rax, %r9	# D.6345, Fout1
	movq	%r9, %r12	# Fout1, Fout1
	addq	%rax, %r9	# D.6345, Fout2
	movzwl	(%rdx), %edi	# MEM[(struct kiss_fft_cpx *)_453], ya$r
	leaq	(%r9,%rax), %r11	#, Fout3
	movzwl	2(%rdx), %ecx	# MEM[(struct kiss_fft_cpx *)_453 + 2B], ya$i
	addq	%rax, %rdx	# D.6345, D.6350
	addq	%r11, %rax	# Fout3, Fout4
	movzwl	(%rdx), %esi	# MEM[(struct kiss_fft_cpx *)_457], yb$r
	movq	%r11, 16(%rsp)	# Fout3, %sfp
	movzwl	2(%rdx), %edx	# MEM[(struct kiss_fft_cpx *)_457 + 2B], yb$i
	movq	%rax, 24(%rsp)	# Fout4, %sfp
	testl	%r14d, %r14d	# m
# SUCC: 39 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 42 [9.0%]  (CAN_FALLTHRU)
	jle	.L132	#,
# BLOCK 39 freq:25 seq:37
# PRED: 38 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	movswl	%di, %eax	# ya$r, D.6344
	movq	%rbx, 40(%rsp)	# twiddles, %sfp
	movl	%eax, 56(%rsp)	# D.6344, %sfp
	movswl	%si, %eax	# yb$r, D.6344
	movl	%eax, 64(%rsp)	# D.6344, %sfp
	movswl	%cx, %eax	# ya$i, D.6344
	movl	%eax, 80(%rsp)	# D.6344, %sfp
	movswl	%dx, %eax	# yb$i, D.6344
	movl	%eax, 72(%rsp)	# D.6344, %sfp
	movl	%r14d, %eax	# m, m
	subl	$1, %eax	#, D.6347
	movq	%r13, 152(%rsp)	# fin, %sfp
	movq	%r9, %r13	# Fout2, Fout2
	leaq	4(%r9,%rax,4), %rax	#, D.6350
	movq	%r8, 8(%rsp)	# Fout, %sfp
	movq	%rax, 144(%rsp)	# D.6350, %sfp
# SUCC: 40 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	$0, 48(%rsp)	#, %sfp
# BLOCK 40 freq:285 seq:38
# PRED: 39 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 40 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L138:
	movq	8(%rsp), %r14	# %sfp, Fout
	movq	16(%rsp), %rbx	# %sfp, Fout3
	movq	24(%rsp), %rsi	# %sfp, Fout4
	movq	136(%rsp), %rcx	# %sfp, twiddles
	movswl	(%r14), %eax	# MEM[base: Fout_419, offset: 0B], D.6344
	imull	$6553, %eax, %eax	#, D.6344, D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, (%r14)	# D.6344, MEM[base: Fout_419, offset: 0B]
	movswl	2(%r14), %eax	# MEM[base: Fout_419, offset: 2B], D.6344
	imull	$6553, %eax, %eax	#, D.6344, D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, 2(%r14)	# D.6344, MEM[base: Fout_419, offset: 2B]
	movswl	(%r12), %eax	# MEM[base: Fout1_417, offset: 0B], D.6344
	imull	$6553, %eax, %eax	#, D.6344, D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, (%r12)	# D.6344, MEM[base: Fout1_417, offset: 0B]
	movswl	2(%r12), %eax	# MEM[base: Fout1_417, offset: 2B], D.6344
	imull	$6553, %eax, %eax	#, D.6344, D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, 2(%r12)	# D.6344, MEM[base: Fout1_417, offset: 2B]
	movswl	0(%r13), %eax	# MEM[base: Fout2_415, offset: 0B], D.6344
	imull	$6553, %eax, %eax	#, D.6344, D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, 0(%r13)	# D.6344, MEM[base: Fout2_415, offset: 0B]
	movswl	2(%r13), %eax	# MEM[base: Fout2_415, offset: 2B], D.6344
	imull	$6553, %eax, %eax	#, D.6344, D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, 2(%r13)	# D.6344, MEM[base: Fout2_415, offset: 2B]
	movswl	(%rbx), %eax	# MEM[base: Fout3_802, offset: 0B], D.6344
	imull	$6553, %eax, %eax	#, D.6344, D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, (%rbx)	# D.6344, MEM[base: Fout3_802, offset: 0B]
	movswl	2(%rbx), %eax	# MEM[base: Fout3_802, offset: 2B], D.6344
	imull	$6553, %eax, %eax	#, D.6344, D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, 2(%rbx)	# D.6344, MEM[base: Fout3_802, offset: 2B]
	movswl	(%rsi), %edx	# MEM[base: Fout4_862, offset: 0B], D.6344
	movswl	2(%rsi), %eax	# MEM[base: Fout4_862, offset: 2B], D.6344
	imull	$6553, %edx, %edx	#, D.6344, D.6344
	imull	$6553, %eax, %eax	#, D.6344, D.6344
	addl	$16384, %edx	#, D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %edx	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%dx, (%rsi)	# D.6344, MEM[base: Fout4_862, offset: 0B]
	movw	%ax, 2(%rsi)	# D.6344, MEM[base: Fout4_862, offset: 2B]
	movzwl	2(%r14), %edi	# MEM[base: Fout_419, offset: 2B], scratch$0$i
	movswl	2(%r12), %r15d	# MEM[base: Fout1_417, offset: 2B], D.6344
	movswl	(%r12), %r14d	# MEM[base: Fout1_417, offset: 0B], D.6344
	movw	%di, 32(%rsp)	# scratch$0$i, %sfp
	movq	48(%rsp), %rdi	# %sfp, ivtmp.418
	movswl	(%rcx,%rdi), %r9d	# MEM[base: twiddles_449, index: ivtmp.418_447, offset: 0B], D.6344
	movswl	2(%rcx,%rdi), %esi	# MEM[base: twiddles_449, index: ivtmp.418_447, offset: 2B], D.6344
	movl	%r9d, 84(%rsp)	# D.6344, %sfp
	movq	%rdi, %r9	# ivtmp.418, ivtmp.418
	movl	%esi, 88(%rsp)	# D.6344, %sfp
	movswl	0(%r13), %r8d	# MEM[base: Fout2_415, offset: 0B], D.6344
	movq	40(%rsp), %r11	# %sfp, ivtmp.439
	movswl	(%rcx,%rdi,2), %ebp	# MEM[base: twiddles_449, index: ivtmp.418_447, step: 2, offset: 0B], D.6344
	movswl	2(%rcx,%rdi,2), %edi	# MEM[base: twiddles_449, index: ivtmp.418_447, step: 2, offset: 2B], D.6344
	movl	%r8d, 100(%rsp)	# D.6344, %sfp
	movq	%rcx, %r8	# twiddles, twiddles
	movq	%rbx, %rcx	# Fout3, Fout3
	movswl	2(%r13), %esi	# MEM[base: Fout2_415, offset: 2B], D.6344
	movswl	(%r11), %r10d	# MEM[base: _416, offset: 0B], D.6344
	movswl	(%rbx), %ebx	# MEM[base: Fout3_802, offset: 0B], D.6344
	movl	%r10d, 120(%rsp)	# D.6344, %sfp
	movswl	2(%rcx), %r10d	# MEM[base: Fout3_802, offset: 2B], D.6344
	movq	%r8, %rcx	# twiddles, twiddles
	movswl	(%r8,%r9,4), %r8d	# MEM[base: twiddles_449, index: ivtmp.418_447, step: 4, offset: 0B], D.6344
	movswl	2(%rcx,%r9,4), %r9d	# MEM[base: twiddles_449, index: ivtmp.418_447, step: 4, offset: 2B], D.6344
	movl	%r10d, 92(%rsp)	# D.6344, %sfp
	movswl	2(%r11), %r10d	# MEM[base: _416, offset: 2B], D.6344
	movl	88(%rsp), %r11d	# %sfp, D.6344
	movl	%r10d, 104(%rsp)	# D.6344, %sfp
	movl	84(%rsp), %r10d	# %sfp, D.6344
	imull	%r15d, %r11d	# D.6344, D.6344
	imull	%r14d, %r10d	# D.6344, D.6344
	movl	%r10d, %ecx	# D.6344, D.6344
	movl	%eax, %r10d	# D.6344, D.6344
	subl	%r11d, %ecx	# D.6344, D.6344
	addl	$16384, %ecx	#, D.6344
	imull	%r9d, %r10d	# D.6344, D.6344
	sarl	$15, %ecx	#, D.6344
	imull	%r8d, %eax	# D.6344, D.6344
	movl	%ecx, %r11d	# D.6344, D.6344
	movl	%edx, %ecx	# D.6344, D.6344
	imull	%r8d, %ecx	# D.6344, D.6344
	movl	%r11d, 96(%rsp)	# D.6344, %sfp
	movl	88(%rsp), %r11d	# %sfp, D.6344
	movl	%esi, %r8d	# D.6344, D.6344
	imull	%r9d, %edx	# D.6344, D.6344
	imull	%edi, %r8d	# D.6344, D.6344
	subl	%r10d, %ecx	# D.6344, D.6344
	imull	%ebp, %esi	# D.6344, D.6344
	addl	$16384, %ecx	#, D.6344
	imull	%r14d, %r11d	# D.6344, D.6344
	movl	120(%rsp), %r14d	# %sfp, D.6344
	leal	16384(%rdx,%rax), %eax	#, D.6344
	sarl	$15, %ecx	#, D.6344
	movl	%ecx, %r10d	# D.6344, D.6349
	addw	96(%rsp), %r10w	# %sfp, D.6349
	movl	%ecx, 112(%rsp)	# D.6344, %sfp
	sarl	$15, %eax	#, D.6344
	movl	%eax, 124(%rsp)	# D.6344, %sfp
	movl	%r10d, %ecx	# D.6349, D.6349
	movl	84(%rsp), %r10d	# %sfp, D.6344
	imull	%r15d, %r10d	# D.6344, D.6344
	movl	%eax, %r15d	# D.6344, tmp2408
	leal	16384(%r11,%r10), %r10d	#, D.6344
	movl	100(%rsp), %r11d	# %sfp, D.6344
	sarl	$15, %r10d	#, D.6344
	leal	(%r15,%r10), %eax	#, D.6349
	movl	104(%rsp), %r15d	# %sfp, D.6344
	movl	%r11d, %edx	# D.6344, D.6344
	imull	%r11d, %edi	# D.6344, D.6344
	movq	8(%rsp), %r11	# %sfp, Fout
	imull	%ebp, %edx	# D.6344, D.6344
	subl	%r8d, %edx	# D.6344, D.6344
	movl	92(%rsp), %r8d	# %sfp, D.6344
	addl	$16384, %edx	#, D.6344
	sarl	$15, %edx	#, D.6344
	movl	%edx, %r9d	# D.6344, D.6344
	movl	%r14d, %edx	# D.6344, D.6344
	imull	%r15d, %r8d	# D.6344, D.6344
	movl	%r9d, 84(%rsp)	# D.6344, %sfp
	imull	%ebx, %edx	# D.6344, D.6344
	imull	92(%rsp), %r14d	# %sfp, D.6344
	imull	%r15d, %ebx	# D.6344, D.6344
	subl	%r8d, %edx	# D.6344, D.6344
	addl	$16384, %edx	#, D.6344
	sarl	$15, %edx	#, D.6344
	movl	%edx, 100(%rsp)	# D.6344, %sfp
	addw	84(%rsp), %dx	# %sfp, D.6349
	movswl	%dx, %r9d	# D.6349,
	leal	16384(%rdi,%rsi), %edx	#, D.6344
	leal	16384(%rbx,%r14), %esi	#, D.6344
	movzwl	(%r11), %ebx	# MEM[base: Fout_419, offset: 0B], D.6349
	sarl	$15, %edx	#, D.6344
	sarl	$15, %esi	#, D.6344
	leal	(%rsi,%rdx), %r8d	#, D.6349
	leal	(%r9,%rbx), %edi	#, D.6349
	addl	%ecx, %edi	# D.6349, tmp1746
	movw	%di, (%r11)	# tmp1746, MEM[base: Fout_419, offset: 0B]
	movzwl	32(%rsp), %r15d	# %sfp, scratch$0$i
	movl	%r15d, %r14d	# scratch$0$i, scratch$0$i
	leal	(%r8,%r14), %edi	#, D.6349
	movswl	%cx, %r14d	# D.6349, D.6344
	movswl	%r8w, %r8d	# D.6349, D.6344
	addl	%eax, %edi	# D.6349, tmp1748
	movw	%di, 2(%r11)	# tmp1748, MEM[base: Fout_419, offset: 2B]
	movl	64(%rsp), %r11d	# %sfp, D.6344
	movl	%r14d, %edi	# D.6344, D.6344
	movl	%edi, 88(%rsp)	# D.6344, %sfp
	movl	%r11d, %r14d	# D.6344, D.6344
	imull	%r9d, %r14d	# D.6344, D.6344
	subw	124(%rsp), %r10w	# %sfp, D.6349
	subl	%esi, %edx	# D.6344, D.6349
	imull	%r8d, %r11d	# D.6344, D.6344
	movswl	%dx, %edx	# D.6349, D.6344
	movzwl	84(%rsp), %esi	# %sfp, D.6349
	subw	100(%rsp), %si	# %sfp, D.6349
	movl	%r14d, %ebp	# D.6344, D.6344
	movswl	%ax, %r14d	# D.6349, D.6344
	addl	$16384, %ebp	#, D.6344
	addl	$16384, %r11d	#, D.6344
	movl	%r15d, %eax	# scratch$0$i, scratch$0$i
	movl	72(%rsp), %r15d	# %sfp, D.6344
	sarl	$15, %ebp	#, D.6344
	sarl	$15, %r11d	#, D.6344
	leal	(%rbx,%rbp), %ecx	#, D.6349
	movl	%edi, %ebp	# D.6344, D.6344
	movl	56(%rsp), %edi	# %sfp, D.6344
	addl	%r11d, %eax	# D.6344, D.6349
	movswl	%si, %esi	# D.6349, D.6344
	imull	%edi, %ebp	# D.6344, D.6344
	imull	%r14d, %edi	# D.6344, D.6344
	addl	$16384, %ebp	#, D.6344
	movl	%edi, %r11d	# D.6344, D.6344
	movswl	%r10w, %edi	# D.6349, D.6344
	movl	80(%rsp), %r10d	# %sfp, D.6344
	sarl	$15, %ebp	#, D.6344
	addl	$16384, %r11d	#, D.6344
	addl	%ecx, %ebp	# D.6349, D.6349
	sarl	$15, %r11d	#, D.6344
	addl	%eax, %r11d	# D.6349, D.6349
	imull	%edi, %r10d	# D.6344, D.6344
	addl	$16384, %r10d	#, D.6344
	movl	%r10d, %eax	# D.6344, D.6344
	sarl	$15, %eax	#, D.6344
	movl	%eax, %ecx	# D.6344, D.6344
	movl	%r15d, %eax	# D.6344, D.6344
	imull	%edx, %eax	# D.6344, D.6344
	movl	%eax, %r10d	# D.6344, D.6344
	addl	$16384, %r10d	#, D.6344
	movl	%r10d, %eax	# D.6344, D.6344
	sarl	$15, %eax	#, D.6344
	leal	(%rcx,%rax), %r10d	#, D.6349
	movzwl	96(%rsp), %eax	# %sfp, D.6349
	subw	112(%rsp), %ax	# %sfp, D.6349
	movl	80(%rsp), %ecx	# %sfp, D.6344
	cwtl
	imull	%eax, %ecx	# D.6344, D.6344
	addl	$16384, %ecx	#, D.6344
	sarl	$15, %ecx	#, D.6344
	movl	%ecx, 84(%rsp)	# D.6344, %sfp
	movl	%r15d, %ecx	# D.6344, D.6344
	movl	%ebp, %r15d	# D.6349, tmp2438
	imull	%esi, %ecx	# D.6344, D.6344
	subl	%r10d, %r15d	# D.6349, tmp2438
	movw	%r15w, (%r12)	# tmp2438, MEM[base: Fout1_417, offset: 0B]
	addl	$16384, %ecx	#, D.6344
	sarl	$15, %ecx	#, D.6344
	addw	84(%rsp), %cx	# %sfp, D.6349
	addl	%ebp, %r10d	# D.6349, tmp1781
	movq	24(%rsp), %rbp	# %sfp, Fout4
	leal	(%r11,%rcx), %r15d	#, tmp2439
	subl	%ecx, %r11d	# D.6349, tmp1782
	movw	%r15w, 2(%r12)	# tmp2439, MEM[base: Fout1_417, offset: 2B]
	movw	%r10w, 0(%rbp)	# tmp1781, MEM[base: Fout4_862, offset: 0B]
	movl	56(%rsp), %r10d	# %sfp, D.6344
	movw	%r11w, 2(%rbp)	# tmp1782, MEM[base: Fout4_862, offset: 2B]
	movl	64(%rsp), %r11d	# %sfp, D.6344
	imull	%r10d, %r8d	# D.6344, D.6344
	imull	%r10d, %r9d	# D.6344, D.6344
	movl	80(%rsp), %r10d	# %sfp, D.6344
	imull	%r11d, %r14d	# D.6344, D.6344
	addl	$16384, %r8d	#, D.6344
	sarl	$15, %r8d	#, D.6344
	addw	32(%rsp), %r8w	# %sfp, D.6349
	addl	$16384, %r9d	#, D.6344
	sarl	$15, %r9d	#, D.6344
	addl	$16384, %r14d	#, D.6344
	addl	%r9d, %ebx	# D.6344, D.6349
	sarl	$15, %r14d	#, D.6344
	movl	88(%rsp), %r9d	# %sfp, D.6344
	imull	%r10d, %edx	# D.6344, D.6344
	imull	%r10d, %esi	# D.6344, D.6344
	addl	%r14d, %r8d	# D.6344, D.6349
	movl	72(%rsp), %r14d	# %sfp, D.6344
	addl	$16384, %edx	#, D.6344
	imull	%r11d, %r9d	# D.6344, D.6344
	sarl	$15, %edx	#, D.6344
	addl	$16384, %esi	#, D.6344
	sarl	$15, %esi	#, D.6344
	imull	%r14d, %edi	# D.6344, D.6344
	imull	%r14d, %eax	# D.6344, D.6344
	movl	%r9d, %ecx	# D.6344, D.6344
	addl	$16384, %ecx	#, D.6344
	addl	$16384, %edi	#, D.6344
	sarl	$15, %ecx	#, D.6344
	sarl	$15, %edi	#, D.6344
	addl	$16384, %eax	#, D.6344
	addl	%ecx, %ebx	# D.6344, D.6349
	subl	%edi, %edx	# D.6344, D.6349
	sarl	$15, %eax	#, D.6344
	leal	(%rbx,%rdx), %ecx	#, tmp1809
	subl	%esi, %eax	# D.6344, D.6349
	subl	%edx, %ebx	# D.6349, tmp1811
	movw	%cx, 0(%r13)	# tmp1809, MEM[base: Fout2_415, offset: 0B]
	leal	(%r8,%rax), %ecx	#, tmp1810
	subl	%eax, %r8d	# D.6349, tmp1812
	addq	$4, %rbp	#, Fout4
	movw	%cx, 2(%r13)	# tmp1810, MEM[base: Fout2_415, offset: 2B]
	movq	16(%rsp), %rcx	# %sfp, Fout3
	addq	$4, %r12	#, Fout1
	addq	$4, %r13	#, Fout2
	addq	$4, 8(%rsp)	#, %sfp
	movw	%bx, (%rcx)	# tmp1811, MEM[base: Fout3_802, offset: 0B]
	addq	$4, %rcx	#, Fout3
	movw	%r8w, -2(%rcx)	# tmp1812, MEM[base: Fout3_802, offset: 2B]
	movq	%rcx, 16(%rsp)	# Fout3, %sfp
	addq	$4, 48(%rsp)	#, %sfp
	movq	%rbp, 24(%rsp)	# Fout4, %sfp
	addq	$12, 40(%rsp)	#, %sfp
	cmpq	144(%rsp), %r13	# %sfp, Fout2
# SUCC: 40 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 41 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L138	#,
# BLOCK 41 freq:26 seq:39
# PRED: 40 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
# SUCC: 42 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	152(%rsp), %r13	# %sfp, fin
# BLOCK 42 freq:141 seq:40
# PRED: 55 [100.0%]  (CAN_FALLTHRU) 51 [100.0%]  (CAN_FALLTHRU) 56 [100.0%]  (CAN_FALLTHRU) 41 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 38 [9.0%]  (CAN_FALLTHRU) 57 [100.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L132:
	movq	(%rsp), %rax	# %sfp, cfg
	movq	%r13, %rdi	# fin,
	movq	128(%rsp), %rbx	# %sfp, Fout
	movslq	(%rax), %rdx	# cfg_2(D)->nfft, D.6345
	movq	%rbx, %rsi	# Fout,
	salq	$2, %rdx	#, D.6345
	call	memcpy	#
	addq	$168, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbx, %rdi	# Fout,
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
# SUCC: EXIT [100.0%]  (ABNORMAL,SIBCALL)
	jmp	free	#
# BLOCK 43 freq:28 seq:41
# PRED: 36 [40.0%]  (CAN_FALLTHRU)
.L127:
	.cfi_restore_state
	movq	(%rsp), %rdx	# %sfp, cfg
	xorl	%r8d, %r8d	# ivtmp.390
	movq	%r13, 72(%rsp)	# fin, %sfp
	movslq	16(%rsp), %rax	# %sfp, k
	movq	128(%rsp), %r11	# %sfp, Fout
	movq	%rdx, %rbx	# cfg, cfg
	addq	$264, %rbx	#, tw3
	movq	%rax, 56(%rsp)	# k, %sfp
	salq	$2, %rax	#, D.6345
	movq	%rbx, 64(%rsp)	# tw3, %sfp
	leaq	(%r11,%rax), %r9	#, ivtmp.406
	movq	%rbx, %rsi	# tw3, tw3
	movl	4(%rdx), %ebx	# cfg_2(D)->inverse, D.6344
	movq	%rsi, 8(%rsp)	# tw3, %sfp
	movl	%ebx, 80(%rsp)	# D.6344, %sfp
	leaq	(%r9,%rax), %rbx	#, ivtmp.408
	leaq	(%rbx,%rax), %rbp	#, ivtmp.410
# SUCC: 46 [100.0%]  (CAN_FALLTHRU)
	jmp	.L137	#
# BLOCK 44 freq:157 seq:42
# PRED: 46 [50.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L177:
	subl	%esi, %eax	# D.6349, tmp1654
	movw	%ax, (%r9)	# tmp1654, MEM[base: _1990, offset: 0B]
	leal	0(%r13,%r15), %eax	#, tmp1655
	subl	%r13d, %r15d	# D.6349, tmp1657
	movw	%ax, 2(%r9)	# tmp1655, MEM[base: _1990, offset: 2B]
	movl	%edx, %eax	# D.6349, D.6349
	addl	%eax, %esi	# D.6349, tmp1656
	movw	%r15w, 2(%rbp)	# tmp1657, MEM[base: _1965, offset: 2B]
# SUCC: 45 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movw	%si, 0(%rbp)	# tmp1656, MEM[base: _1965, offset: 0B]
# BLOCK 45 freq:313 seq:43
# PRED: 44 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 47 [100.0%]  (CAN_FALLTHRU)
.L136:
	addq	$4, %r11	#, Fout
	addq	$1, %r8	#, ivtmp.390
	addq	$4, %r9	#, ivtmp.406
	addq	$4, %rbx	#, ivtmp.408
	addq	$4, %rbp	#, ivtmp.410
	cmpq	%r8, 56(%rsp)	# ivtmp.390, %sfp
# SUCC: 46 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 57 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT)
	je	.L176	#,
# BLOCK 46 freq:313 seq:44
# PRED: 45 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 43 [100.0%]  (CAN_FALLTHRU)
.L137:
	movswl	(%r11), %edx	# MEM[base: Fout_275, offset: 0B], D.6344
	movl	%edx, %eax	# D.6344, tmp1578
	sall	$13, %eax	#, tmp1578
	subl	%edx, %eax	# D.6344, D.6344
	movswl	2(%r11), %edx	# MEM[base: Fout_275, offset: 2B], D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, (%r11)	# D.6344, MEM[base: Fout_275, offset: 0B]
	movl	%edx, %eax	# D.6344, tmp1584
	sall	$13, %eax	#, tmp1584
	subl	%edx, %eax	# D.6344, D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, 2(%r11)	# D.6344, MEM[base: Fout_275, offset: 2B]
	movswl	(%r9), %edx	# MEM[base: _1990, offset: 0B], D.6344
	movl	%edx, %eax	# D.6344, tmp1590
	sall	$13, %eax	#, tmp1590
	subl	%edx, %eax	# D.6344, D.6344
	movswl	2(%r9), %edx	# MEM[base: _1990, offset: 2B], D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, (%r9)	# D.6344, MEM[base: _1990, offset: 0B]
	movl	%edx, %eax	# D.6344, tmp1596
	sall	$13, %eax	#, tmp1596
	subl	%edx, %eax	# D.6344, D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, 2(%r9)	# D.6344, MEM[base: _1990, offset: 2B]
	movswl	(%rbx), %edx	# MEM[base: _1994, offset: 0B], D.6344
	movl	%edx, %eax	# D.6344, tmp1602
	sall	$13, %eax	#, tmp1602
	subl	%edx, %eax	# D.6344, D.6344
	movswl	2(%rbx), %edx	# MEM[base: _1994, offset: 2B], D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, (%rbx)	# D.6344, MEM[base: _1994, offset: 0B]
	movl	%edx, %eax	# D.6344, tmp1608
	sall	$13, %eax	#, tmp1608
	subl	%edx, %eax	# D.6344, D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, 2(%rbx)	# D.6344, MEM[base: _1994, offset: 2B]
	movswl	0(%rbp), %eax	# MEM[base: _1965, offset: 0B], D.6344
	movl	%eax, %ecx	# D.6344, tmp1614
	sall	$13, %ecx	#, tmp1614
	subl	%eax, %ecx	# D.6344, D.6344
	movswl	2(%rbp), %eax	# MEM[base: _1965, offset: 2B], D.6344
	addl	$16384, %ecx	#, D.6344
	sarl	$15, %ecx	#, D.6344
	movw	%cx, 0(%rbp)	# D.6344, MEM[base: _1965, offset: 0B]
	movl	%eax, %edx	# D.6344, tmp1619
	sall	$13, %edx	#, tmp1619
	subl	%eax, %edx	# D.6344, D.6344
	movq	64(%rsp), %rax	# %sfp, tw3
	addl	$16384, %edx	#, D.6344
	sarl	$15, %edx	#, D.6344
	movw	%dx, 2(%rbp)	# D.6344, MEM[base: _1965, offset: 2B]
	movswl	(%rbx), %r14d	# MEM[base: _1994, offset: 0B], D.6344
	movswl	(%rax,%r8,4), %esi	# MEM[base: tw3_274, index: ivtmp.390_270, step: 4, offset: 0B], D.6344
	movswl	(%rax,%r8,8), %r13d	# MEM[base: tw3_274, index: ivtmp.390_270, step: 8, offset: 0B], D.6344
	movswl	2(%rax,%r8,8), %r10d	# MEM[base: tw3_274, index: ivtmp.390_270, step: 8, offset: 2B], D.6344
	movswl	2(%r9), %edi	# MEM[base: _1990, offset: 2B], D.6344
	movl	%esi, 16(%rsp)	# D.6344, %sfp
	movswl	2(%rax,%r8,4), %esi	# MEM[base: tw3_274, index: ivtmp.390_270, step: 4, offset: 2B], D.6344
	movq	8(%rsp), %rax	# %sfp, tw3
	movswl	(%r9), %r12d	# MEM[base: _1990, offset: 0B], D.6344
	movl	%edi, 24(%rsp)	# D.6344, %sfp
	movswl	2(%rbx), %edi	# MEM[base: _1994, offset: 2B], D.6344
	movswl	(%rax), %r15d	# MEM[base: tw3_373, offset: 0B], D.6344
	movl	%r15d, 32(%rsp)	# D.6344, %sfp
	movswl	2(%rax), %r15d	# MEM[base: tw3_373, offset: 2B], D.6344
	movl	%r15d, 40(%rsp)	# D.6344, %sfp
	movl	%r14d, %r15d	# D.6344, D.6344
	imull	%r13d, %r15d	# D.6344, D.6344
	movl	%r15d, %eax	# D.6344, D.6344
	movl	%edi, %r15d	# D.6344, D.6344
	imull	%r10d, %r15d	# D.6344, D.6344
	imull	%r14d, %r10d	# D.6344, D.6344
	imull	%r13d, %edi	# D.6344, D.6344
	subl	%r15d, %eax	# D.6344, D.6344
	movzwl	(%r11), %r15d	# MEM[base: Fout_275, offset: 0B], D.6349
	addl	$16384, %eax	#, D.6344
	leal	16384(%r10,%rdi), %edi	#, D.6344
	sarl	$15, %eax	#, D.6344
	sarl	$15, %edi	#, D.6344
	subl	%eax, %r15d	# D.6344, D.6349
	movw	%r15w, 48(%rsp)	# D.6349, %sfp
	movzwl	2(%r11), %r10d	# MEM[base: Fout_275, offset: 2B], D.6349
	movl	16(%rsp), %r13d	# %sfp, D.6344
	movl	32(%rsp), %r14d	# %sfp, D.6344
	addw	(%r11), %ax	# MEM[base: Fout_275, offset: 0B], D.6349
	addq	$12, 8(%rsp)	#, %sfp
	subl	%edi, %r10d	# D.6344, D.6349
	imull	%r12d, %r13d	# D.6344, D.6344
	movl	%r10d, %r15d	# D.6349, D.6349
	movl	24(%rsp), %r10d	# %sfp, D.6344
	imull	%ecx, %r14d	# D.6344, D.6344
	addw	2(%r11), %di	# MEM[base: Fout_275, offset: 2B], D.6349
	imull	40(%rsp), %ecx	# %sfp, D.6344
	movw	%ax, (%r11)	# D.6349, MEM[base: Fout_275, offset: 0B]
	imull	%esi, %r10d	# D.6344, D.6344
	imull	%r12d, %esi	# D.6344, D.6344
	movl	16(%rsp), %r12d	# %sfp, D.6344
	movw	%di, 2(%r11)	# D.6349, MEM[base: Fout_275, offset: 2B]
	imull	24(%rsp), %r12d	# %sfp, D.6344
	subl	%r10d, %r13d	# D.6344, D.6344
	movl	%r14d, %r10d	# D.6344, D.6344
	movl	40(%rsp), %r14d	# %sfp, D.6344
	addl	$16384, %r13d	#, D.6344
	leal	16384(%rsi,%r12), %esi	#, D.6344
	sarl	$15, %r13d	#, D.6344
	sarl	$15, %esi	#, D.6344
	imull	%edx, %r14d	# D.6344, D.6344
	imull	32(%rsp), %edx	# %sfp, D.6344
	subl	%r14d, %r10d	# D.6344, D.6344
	leal	16384(%rcx,%rdx), %edx	#, D.6344
	addl	$16384, %r10d	#, D.6344
	sarl	$15, %edx	#, D.6344
	sarl	$15, %r10d	#, D.6344
	leal	(%rdx,%rsi), %ecx	#, D.6349
	subl	%edx, %esi	# D.6344, D.6349
	movzwl	48(%rsp), %edx	# %sfp, D.6349
	leal	(%r10,%r13), %r14d	#, D.6349
	subl	%ecx, %edi	# D.6349, tmp1653
	subl	%r10d, %r13d	# D.6344, D.6349
	movw	%di, 2(%rbx)	# tmp1653, MEM[base: _1994, offset: 2B]
	movl	80(%rsp), %edi	# %sfp,
	subl	%r14d, %eax	# D.6349, tmp1652
	movw	%ax, (%rbx)	# tmp1652, MEM[base: _1994, offset: 0B]
	addw	%r14w, (%r11)	# D.6349, MEM[base: Fout_275, offset: 0B]
	movl	%edx, %eax	# D.6349, tmp1654
	addw	%cx, 2(%r11)	# D.6349, MEM[base: Fout_275, offset: 2B]
	testl	%edi, %edi	#
# SUCC: 44 [50.0%]  (CAN_FALLTHRU) 47 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L177	#,
# BLOCK 47 freq:157 seq:45
# PRED: 46 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	addl	%esi, %eax	# D.6349, tmp1658
	movw	%ax, (%r9)	# tmp1658, MEM[base: _1990, offset: 0B]
	movl	%r15d, %eax	# D.6349, tmp1659
	subl	%r13d, %eax	# D.6349, tmp1659
	addl	%r15d, %r13d	# D.6349, tmp1661
	movw	%ax, 2(%r9)	# tmp1659, MEM[base: _1990, offset: 2B]
	movl	%edx, %eax	# D.6349, tmp1660
	subl	%esi, %eax	# D.6349, tmp1660
	movw	%r13w, 2(%rbp)	# tmp1661, MEM[base: _1965, offset: 2B]
	movw	%ax, 0(%rbp)	# tmp1660, MEM[base: _1965, offset: 0B]
# SUCC: 45 [100.0%]  (CAN_FALLTHRU)
	jmp	.L136	#
# BLOCK 48 freq:43 seq:46
# PRED: 35 [37.5%]  (CAN_FALLTHRU)
.L175:
	cmpl	$2, 8(%rsp)	#, %sfp
# SUCC: 49 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 56 [33.3%]  (CAN_FALLTHRU)
	jne	.L123	#,
# BLOCK 49 freq:28 seq:47
# PRED: 48 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movq	(%rsp), %rax	# %sfp, cfg
	movl	16(%rsp), %esi	# %sfp, m
	movq	128(%rsp), %rbx	# %sfp, Fout
	leaq	264(%rax), %r9	#, tw1
	movslq	%esi, %rax	# m,
	leaq	(%rbx,%rax,4), %r8	#, Fout2
	movl	%esi, %eax	# m, m
	movq	%rbx, %rdi	# Fout, Fout
	subl	$1, %eax	#, D.6347
# SUCC: 50 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	leaq	4(%rbx,%rax,4), %r10	#, D.6350
# BLOCK 50 freq:313 seq:48
# PRED: 49 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 50 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L131:
	movswl	(%rdi), %edx	# MEM[base: Fout_49, offset: 0B], D.6344
	addq	$4, %r9	#, tw1
	addq	$4, %r8	#, Fout2
	movswl	-4(%r9), %esi	# MEM[base: tw1_76, offset: 0B], D.6344
	movswl	-2(%r9), %r11d	# MEM[base: tw1_76, offset: 2B], D.6344
	movl	%edx, %eax	# D.6344, tmp1466
	sall	$14, %eax	#, tmp1466
	subl	%edx, %eax	# D.6344, D.6344
	movswl	2(%rdi), %edx	# MEM[base: Fout_49, offset: 2B], D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, (%rdi)	# D.6344, MEM[base: Fout_49, offset: 0B]
	movl	%edx, %eax	# D.6344, tmp1472
	sall	$14, %eax	#, tmp1472
	subl	%edx, %eax	# D.6344, D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, 2(%rdi)	# D.6344, MEM[base: Fout_49, offset: 2B]
	movswl	-4(%r8), %eax	# MEM[base: Fout2_62, offset: 0B], D.6344
	movswl	-2(%r8), %edx	# MEM[base: Fout2_62, offset: 2B], D.6344
	movl	%eax, %ecx	# D.6344, tmp1478
	sall	$14, %ecx	#, tmp1478
	subl	%eax, %ecx	# D.6344, D.6344
	movl	%edx, %eax	# D.6344, tmp1483
	sall	$14, %eax	#, tmp1483
	addl	$16384, %ecx	#, D.6344
	subl	%edx, %eax	# D.6344, D.6344
	sarl	$15, %ecx	#, D.6344
	addl	$16384, %eax	#, D.6344
	movl	%ecx, %edx	# D.6344, D.6344
	movw	%cx, -4(%r8)	# D.6344, MEM[base: Fout2_62, offset: 0B]
	sarl	$15, %eax	#, D.6344
	imull	%esi, %edx	# D.6344, D.6344
	movl	%eax, %ebx	# D.6344, D.6344
	movw	%ax, -2(%r8)	# D.6344, MEM[base: Fout2_62, offset: 2B]
	imull	%r11d, %ecx	# D.6344, D.6344
	imull	%r11d, %ebx	# D.6344, D.6344
	imull	%esi, %eax	# D.6344, D.6344
	subl	%ebx, %edx	# D.6344, D.6344
	movzwl	(%rdi), %ebx	# MEM[base: Fout_49, offset: 0B], D.6349
	leal	16384(%rcx,%rax), %eax	#, D.6344
	addl	$16384, %edx	#, D.6344
	sarl	$15, %edx	#, D.6344
	sarl	$15, %eax	#, D.6344
	subl	%edx, %ebx	# D.6344, D.6349
	movw	%bx, -4(%r8)	# D.6349, MEM[base: Fout2_62, offset: 0B]
	movzwl	2(%rdi), %ecx	# MEM[base: Fout_49, offset: 2B], D.6349
	subl	%eax, %ecx	# D.6344, D.6349
	movw	%cx, -2(%r8)	# D.6349, MEM[base: Fout2_62, offset: 2B]
	addw	%dx, (%rdi)	# D.6344, MEM[base: Fout_49, offset: 0B]
	addw	%ax, 2(%rdi)	# D.6344, MEM[base: Fout_49, offset: 2B]
	addq	$4, %rdi	#, Fout
	cmpq	%r10, %rdi	# D.6350, Fout
# SUCC: 50 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 51 [9.0%]  (FALLTHRU)
	jne	.L131	#,
# BLOCK 51 freq:28 seq:49
# PRED: 50 [9.0%]  (FALLTHRU)
# SUCC: 42 [100.0%]  (CAN_FALLTHRU)
	jmp	.L132	#
# BLOCK 52 freq:39 seq:50
# PRED: 30 [28.0%]  (CAN_FALLTHRU)
.L174:
	movq	%rdx, %rax	# Fout, Fout
	movq	%rdx, %rdi	# Fout, Fout
	movq	%r13, %rsi	# fin,
	addq	$4, %rax	#, D.6350
	subq	%rax, %r12	# D.6350, D.6351
	shrq	$2, %r12	#, D.6351
	leaq	4(,%r12,4), %rdx	#, D.6347
	call	memcpy	#
# SUCC: 34 [100.0%]  (CAN_FALLTHRU)
	jmp	.L130	#
# BLOCK 53 freq:28 seq:51
# PRED: 34 [20.0%]  (CAN_FALLTHRU)
.L124:
	movslq	16(%rsp), %rax	# %sfp, m
	xorl	%r15d, %r15d	# ivtmp.370
	movq	%r13, 32(%rsp)	# fin, %sfp
	movq	(%rsp), %rbx	# %sfp, cfg
	movq	%rax, 16(%rsp)	# m, %sfp
	leaq	264(%rbx), %r10	#, tw2
	movswl	266(%rbx,%rax,4), %ebx	# MEM[(struct  *)_120 + 2B], D.6344
	movl	%ebx, 24(%rsp)	# D.6344, %sfp
	movq	128(%rsp), %rbx	# %sfp, Fout
	leaq	(%rbx,%rax,4), %rdx	#, ivtmp.383
	movq	%rbx, %rsi	# Fout, Fout
# SUCC: 54 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	leaq	(%rbx,%rax,8), %r11	#, ivtmp.385
# BLOCK 54 freq:313 seq:52
# PRED: 53 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 54 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L133:
	movswl	(%rsi), %eax	# MEM[base: Fout_123, offset: 0B], D.6344
	movswl	(%r10,%r15,4), %r12d	# MEM[base: tw2_122, index: ivtmp.370_116, step: 4, offset: 0B], D.6344
	movswl	2(%r10,%r15,4), %ebp	# MEM[base: tw2_122, index: ivtmp.370_116, step: 4, offset: 2B], D.6344
	movswl	(%r10,%r15,8), %r8d	# MEM[base: tw2_122, index: ivtmp.370_116, step: 8, offset: 0B], D.6344
	imull	$10922, %eax, %eax	#, D.6344, D.6344
	movswl	2(%r10,%r15,8), %r9d	# MEM[base: tw2_122, index: ivtmp.370_116, step: 8, offset: 2B], D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, (%rsi)	# D.6344, MEM[base: Fout_123, offset: 0B]
	movswl	2(%rsi), %eax	# MEM[base: Fout_123, offset: 2B], D.6344
	imull	$10922, %eax, %eax	#, D.6344, D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, 2(%rsi)	# D.6344, MEM[base: Fout_123, offset: 2B]
	movswl	(%rdx), %eax	# MEM[base: _1984, offset: 0B], D.6344
	imull	$10922, %eax, %eax	#, D.6344, D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, (%rdx)	# D.6344, MEM[base: _1984, offset: 0B]
	movswl	2(%rdx), %eax	# MEM[base: _1984, offset: 2B], D.6344
	imull	$10922, %eax, %eax	#, D.6344, D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%ax, 2(%rdx)	# D.6344, MEM[base: _1984, offset: 2B]
	movswl	(%r11), %ecx	# MEM[base: _26, offset: 0B], D.6344
	movswl	2(%r11), %eax	# MEM[base: _26, offset: 2B], D.6344
	imull	$10922, %ecx, %ecx	#, D.6344, D.6344
	imull	$10922, %eax, %eax	#, D.6344, D.6344
	addl	$16384, %ecx	#, D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %ecx	#, D.6344
	sarl	$15, %eax	#, D.6344
	movw	%cx, (%r11)	# D.6344, MEM[base: _26, offset: 0B]
	movw	%ax, 2(%r11)	# D.6344, MEM[base: _26, offset: 2B]
	movswl	(%rdx), %r13d	# MEM[base: _1984, offset: 0B], D.6344
	movswl	2(%rdx), %ebx	# MEM[base: _1984, offset: 2B], D.6344
	movl	%r13d, %edi	# D.6344, D.6344
	movl	%ebx, %r14d	# D.6344, D.6344
	imull	%r12d, %edi	# D.6344, D.6344
	imull	%ebp, %r14d	# D.6344, D.6344
	imull	%r12d, %ebx	# D.6344, D.6344
	imull	%r13d, %ebp	# D.6344, D.6344
	subl	%r14d, %edi	# D.6344, D.6344
	movl	%eax, %r14d	# D.6344, D.6344
	addl	$16384, %edi	#, D.6344
	imull	%r9d, %r14d	# D.6344, D.6344
	leal	16384(%rbp,%rbx), %ebx	#, D.6344
	sarl	$15, %edi	#, D.6344
	movl	%edi, 8(%rsp)	# D.6344, %sfp
	movl	%ecx, %edi	# D.6344, D.6344
	sarl	$15, %ebx	#, D.6344
	imull	%r9d, %ecx	# D.6344, D.6344
	imull	%r8d, %edi	# D.6344, D.6344
	movzwl	(%rsi), %r9d	# MEM[base: Fout_123, offset: 0B], D.6349
	subl	%r14d, %edi	# D.6344, D.6344
	movzwl	8(%rsp), %r14d	# %sfp, tmp2287
	addl	$16384, %edi	#, D.6344
	sarl	$15, %edi	#, D.6344
	addl	%edi, %r14d	# D.6344, D.6349
	imull	%r8d, %eax	# D.6344, D.6344
	addq	$1, %r15	#, ivtmp.370
	addq	$4, %r11	#, ivtmp.385
	leal	16384(%rcx,%rax), %eax	#, D.6344
	movl	%r14d, %ecx	# D.6349, D.6348
	sarw	%cx	# D.6348
	sarl	$15, %eax	#, D.6344
	leal	(%rax,%rbx), %r8d	#, D.6349
	subl	%ecx, %r9d	# D.6348, D.6349
	subl	%eax, %ebx	# D.6344, D.6349
	movw	%r9w, (%rdx)	# D.6349, MEM[base: _1984, offset: 0B]
	movzwl	2(%rsi), %r9d	# MEM[base: Fout_123, offset: 2B], D.6349
	movl	%r8d, %ecx	# D.6349, D.6348
	sarw	%cx	# D.6348
	subl	%ecx, %r9d	# D.6348, D.6349
	movswl	%bx, %ecx	# D.6349, D.6344
	movl	24(%rsp), %ebx	# %sfp, D.6344
	movw	%r9w, 2(%rdx)	# D.6349, MEM[base: _1984, offset: 2B]
	addw	%r14w, (%rsi)	# D.6349, MEM[base: Fout_123, offset: 0B]
	addw	%r8w, 2(%rsi)	# D.6349, MEM[base: Fout_123, offset: 2B]
	addq	$4, %rsi	#, Fout
	imull	%ebx, %ecx	# D.6344, D.6344
	addl	$16384, %ecx	#, D.6344
	sarl	$15, %ecx	#, D.6344
	movl	%ecx, %eax	# D.6344, D.6349
	addw	(%rdx), %ax	# MEM[base: _1984, offset: 0B], D.6349
	movw	%ax, -4(%r11)	# D.6349, MEM[base: _26, offset: 0B]
	movzwl	8(%rsp), %eax	# %sfp, D.6349
	subl	%edi, %eax	# D.6344, D.6349
	movzwl	2(%rdx), %edi	# MEM[base: _1984, offset: 2B], D.6349
	cwtl
	imull	%ebx, %eax	# D.6344, D.6344
	addl	$16384, %eax	#, D.6344
	sarl	$15, %eax	#, D.6344
	subl	%eax, %edi	# D.6344, D.6349
	movw	%di, -2(%r11)	# D.6349, MEM[base: _26, offset: 2B]
	subw	%cx, (%rdx)	# D.6344, MEM[base: _1984, offset: 0B]
	addw	%ax, 2(%rdx)	# D.6344, MEM[base: _1984, offset: 2B]
	addq	$4, %rdx	#, ivtmp.383
	cmpq	%r15, 16(%rsp)	# ivtmp.370, %sfp
# SUCC: 54 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 55 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L133	#,
# BLOCK 55 freq:28 seq:53
# PRED: 54 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	movq	32(%rsp), %r13	# %sfp, fin
# SUCC: 42 [100.0%]  (CAN_FALLTHRU)
	jmp	.L132	#
# BLOCK 56 freq:28 seq:54
# PRED: 48 [33.3%]  (CAN_FALLTHRU) 37 [33.3%]  (CAN_FALLTHRU)
.L123:
	movl	8(%rsp), %r8d	# %sfp,
	movl	$1, %esi	#,
	movl	16(%rsp), %ecx	# %sfp,
	movq	(%rsp), %rdx	# %sfp,
	movq	128(%rsp), %rdi	# %sfp,
	call	kf_bfly_generic	#
# SUCC: 42 [100.0%]  (CAN_FALLTHRU)
	jmp	.L132	#
# BLOCK 57 freq:28 seq:55
# PRED: 45 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT)
.L176:
	movq	72(%rsp), %r13	# %sfp, fin
# SUCC: 42 [100.0%]  (CAN_FALLTHRU)
	jmp	.L132	#
	.cfi_endproc
.LFE54:
	.size	kiss_fft, .-kiss_fft
	.section	.text.unlikely
.LCOLDE14:
	.text
.LHOTE14:
	.section	.text.unlikely
.LCOLDB15:
	.text
.LHOTB15:
	.p2align 4,,15
	.globl	kiss_fft_cleanup
	.type	kiss_fft_cleanup, @function
kiss_fft_cleanup:
.LFB55:
	.cfi_startproc
# BLOCK 2 freq:10000 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
# SUCC: EXIT [100.0%] 
	ret
	.cfi_endproc
.LFE55:
	.size	kiss_fft_cleanup, .-kiss_fft_cleanup
	.section	.text.unlikely
.LCOLDE15:
	.text
.LHOTE15:
	.section	.text.unlikely
.LCOLDB16:
	.text
.LHOTB16:
	.p2align 4,,15
	.globl	kiss_fft_next_fast_size
	.type	kiss_fft_next_fast_size, @function
kiss_fft_next_fast_size:
.LFB56:
	.cfi_startproc
# BLOCK 2 freq:81 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
	movl	$1431655766, %r8d	#, tmp150
# SUCC: 3 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	$1717986919, %esi	#, tmp151
# BLOCK 3 freq:900 seq:1
# PRED: 2 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 12 [100.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L187:
	movl	%edi, %ecx	# n, n
	testb	$1, %dil	#, n
# SUCC: 4 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 7 [9.0%]  (CAN_FALLTHRU)
	jne	.L180	#,
# BLOCK 4 freq:9100 seq:2
# PRED: 3 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L181:
	movl	%ecx, %edx	# n, tmp100
	shrl	$31, %edx	#, tmp100
	addl	%edx, %ecx	# tmp100, tmp101
	sarl	%ecx	# n
	testb	$1, %cl	#, n
# SUCC: 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 5 [9.0%]  (FALLTHRU)
	je	.L181	#,
# BLOCK 5 freq:819 seq:3
# PRED: 4 [9.0%]  (FALLTHRU)
# SUCC: 7 [100.0%]  (CAN_FALLTHRU,LOOP_EXIT)
	jmp	.L180	#
# BLOCK 6 freq:9100 seq:4
# PRED: 7 [91.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L195:
	movl	%ecx, %eax	# n, tmp153
	sarl	$31, %ecx	#, tmp115
	imull	%r8d	# tmp150
	subl	%ecx, %edx	# tmp115, n
# SUCC: 7 [100.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU)
	movl	%edx, %ecx	# n, n
# BLOCK 7 freq:10000 seq:5
# PRED: 3 [9.0%]  (CAN_FALLTHRU) 6 [100.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 5 [100.0%]  (CAN_FALLTHRU,LOOP_EXIT)
.L180:
	movl	%ecx, %eax	# n, tmp152
	imull	%r8d	# tmp150
	movl	%ecx, %eax	# n, tmp107
	sarl	$31, %eax	#, tmp107
	subl	%eax, %edx	# tmp107, tmp104
	leal	(%rdx,%rdx,2), %eax	#, tmp110
	cmpl	%eax, %ecx	# tmp110, n
# SUCC: 6 [91.0%]  (CAN_FALLTHRU) 8 [9.0%]  (FALLTHRU)
	je	.L195	#,
# BLOCK 8 freq:900 seq:6
# PRED: 7 [9.0%]  (FALLTHRU)
# SUCC: 10 [100.0%]  (CAN_FALLTHRU,LOOP_EXIT)
	jmp	.L182	#
# BLOCK 9 freq:9100 seq:7
# PRED: 10 [91.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L196:
	movl	%ecx, %eax	# n, tmp156
	sarl	$31, %ecx	#, tmp137
	imull	%esi	# tmp151
	sarl	%edx	# tmp136
	subl	%ecx, %edx	# tmp137, n
# SUCC: 10 [100.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU)
	movl	%edx, %ecx	# n, n
# BLOCK 10 freq:10000 seq:8
# PRED: 9 [100.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 8 [100.0%]  (CAN_FALLTHRU,LOOP_EXIT)
.L182:
	movl	%ecx, %eax	# n, tmp155
	imull	%esi	# tmp151
	movl	%ecx, %eax	# n, tmp128
	sarl	$31, %eax	#, tmp128
	sarl	%edx	# tmp127
	subl	%eax, %edx	# tmp128, tmp124
	leal	(%rdx,%rdx,4), %eax	#, tmp131
	cmpl	%eax, %ecx	# tmp131, n
# SUCC: 9 [91.0%]  (CAN_FALLTHRU) 11 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	je	.L196	#,
# BLOCK 11 freq:900 seq:9
# PRED: 10 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	cmpl	$1, %ecx	#, n
# SUCC: 13 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT) 12 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	jle	.L186	#,
# BLOCK 12 freq:819 seq:10
# PRED: 11 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	addl	$1, %edi	#, n
# SUCC: 3 [100.0%]  (DFS_BACK,CAN_FALLTHRU)
	jmp	.L187	#
# BLOCK 13 freq:81 seq:11
# PRED: 11 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT)
.L186:
	movl	%edi, %eax	# n,
# SUCC: EXIT [100.0%] 
	ret
	.cfi_endproc
.LFE56:
	.size	kiss_fft_next_fast_size, .-kiss_fft_next_fast_size
	.section	.text.unlikely
.LCOLDE16:
	.text
.LHOTE16:
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	0
	.long	1073741824
	.align 8
.LC4:
	.long	0
	.long	1074266112
	.align 8
.LC5:
	.long	0
	.long	1127219200
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC6:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC7:
	.long	0
	.long	1072693248
	.align 8
.LC8:
	.long	1413754136
	.long	-1072094725
	.align 8
.LC9:
	.long	0
	.long	1088421824
	.align 8
.LC10:
	.long	0
	.long	1071644672
	.section	.rodata.cst16
	.align 16
.LC11:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.ident	"GCC: (GNU) 4.9.2 20150304 (prerelease)"
	.section	.note.GNU-stack,"",@progbits
