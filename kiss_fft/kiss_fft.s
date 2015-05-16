	.file	"kiss_fft.c"
# GNU C (GCC) version 4.9.2 20150304 (prerelease) (x86_64-unknown-linux-gnu)
#	compiled by GNU C version 4.9.2 20150304 (prerelease), GMP version 6.0.0, MPFR version 3.1.2-p11, MPC version 1.0.3
# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  kiss_fft.c --param l1-cache-size=32
# --param l1-cache-line-size=64 --param l2-cache-size=6144 -mtune=haswell
# -march=x86-64 -O3 -ffast-math -fomit-frame-pointer -fverbose-asm
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
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14	# Fout, Fout
	movslq	%r8d, %rdi	# p, D.5157
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	salq	$3, %rdi	#, D.5157
	movl	%ecx, %r13d	# m, m
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12	# fstride, fstride
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	leaq	264(%rdx), %rbp	#, twiddles
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp	#,
	.cfi_def_cfa_offset 96
	movl	(%rdx), %ebx	# st_13(D)->nfft, Norig
	movl	%r8d, 16(%rsp)	# p, %sfp
	call	malloc	#
	testl	%r13d, %r13d	# m
# SUCC: 3 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 13 [9.0%]  (CAN_FALLTHRU)
	jle	.L2	#,
# BLOCK 3 freq:8 seq:1
# PRED: 2 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	16(%rsp), %r8d	# %sfp, p
	leal	-1(%r13), %edx	#, D.5159
	movq	%r14, 8(%rsp)	# ivtmp.108, %sfp
	leaq	8(%r14,%rdx,8), %rdi	#, D.5163
	movl	%r12d, 20(%rsp)	# fstride, %sfp
	movq	%rdi, 24(%rsp)	# D.5163, %sfp
	movslq	%r13d, %rdi	# m, D.5157
	imull	%r12d, %r13d	# fstride, D.5158
	salq	$3, %rdi	#, D.5157
	movl	$0, 16(%rsp)	#, %sfp
	leal	-1(%r8), %edx	#, D.5159
	leaq	8(%rax,%rdx,8), %r14	#, D.5163
	leal	-2(%r8), %edx	#, D.5159
# SUCC: 4 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	leaq	16(%rax,%rdx,8), %r10	#, D.5163
# BLOCK 4 freq:89 seq:2
# PRED: 12 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 3 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
.L3:
	testl	%r8d, %r8d	# p
# SUCC: 5 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 12 [9.0%]  (CAN_FALLTHRU)
	jle	.L7	#,
# BLOCK 5 freq:81 seq:3
# PRED: 4 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	8(%rsp), %rcx	# %sfp, ivtmp.101
# SUCC: 6 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rax, %rdx	# scratch, ivtmp.103
# BLOCK 6 freq:900 seq:4
# PRED: 6 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 5 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L4:
	movq	(%rcx), %rsi	# MEM[base: _37, offset: 0B], MEM[base: _37, offset: 0B]
	addq	$8, %rdx	#, ivtmp.103
	addq	%rdi, %rcx	# D.5157, ivtmp.101
	movq	%rsi, -8(%rdx)	# MEM[base: _37, offset: 0B], MEM[base: _120, offset: 0B]
	cmpq	%r14, %rdx	# D.5163, ivtmp.103
# SUCC: 6 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 7 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L4	#,
# BLOCK 7 freq:81 seq:5
# PRED: 6 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	movl	16(%rsp), %r9d	# %sfp, ivtmp.92
	xorl	%r11d, %r11d	# q1
	movq	8(%rsp), %rsi	# %sfp, ivtmp.90
# SUCC: 8 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	(%rax), %r12	# *scratch_21, *scratch_21
# BLOCK 8 freq:900 seq:6
# PRED: 7 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 11 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L6:
	movq	%r12, (%rsi)	# *scratch_21, MEM[base: _137, offset: 0B]
	cmpl	$1, %r8d	#, p
# SUCC: 9 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 11 [9.0%]  (CAN_FALLTHRU)
	je	.L9	#,
# BLOCK 9 freq:819 seq:7
# PRED: 8 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	(%rsi), %xmm6	# MEM[base: _137, offset: 0B], D.5161
	leaq	8(%rax), %rcx	#, ivtmp.79
	xorl	%edx, %edx	# twidx
# SUCC: 10 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	4(%rsi), %xmm5	# MEM[base: _137, offset: 4B], D.5161
# BLOCK 10 freq:9100 seq:8
# PRED: 9 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 10 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L8:
	addl	%r9d, %edx	# ivtmp.92, D.5158
	movss	(%rcx), %xmm1	# MEM[base: _159, offset: 0B], D.5161
	movl	%edx, %r15d	# D.5158, twidx
	movss	4(%rcx), %xmm3	# MEM[base: _159, offset: 4B], D.5161
	subl	%ebx, %r15d	# Norig, twidx
	cmpl	%edx, %ebx	# D.5158, Norig
	movaps	%xmm1, %xmm4	# D.5161, D.5161
	cmovle	%r15d, %edx	# twidx,, twidx
	movaps	%xmm3, %xmm7	# D.5161, D.5161
	addq	$8, %rcx	#, ivtmp.79
	movslq	%edx, %r15	# twidx, D.5157
	leaq	0(%rbp,%r15,8), %r15	#, D.5162
	movss	(%r15), %xmm2	# _53->r, D.5161
	movss	4(%r15), %xmm0	# _53->i, D.5161
	mulss	%xmm2, %xmm4	# D.5161, D.5161
	mulss	%xmm0, %xmm7	# D.5161, D.5161
	mulss	%xmm3, %xmm2	# D.5161, D.5161
	mulss	%xmm1, %xmm0	# D.5161, D.5161
	subss	%xmm7, %xmm4	# D.5161, D.5161
	addss	%xmm2, %xmm0	# D.5161, D.5161
	addss	%xmm4, %xmm6	# D.5161, D.5161
	addss	%xmm0, %xmm5	# D.5161, D.5161
	movss	%xmm6, (%rsi)	# D.5161, MEM[base: _137, offset: 0B]
	movss	%xmm5, 4(%rsi)	# D.5161, MEM[base: _137, offset: 4B]
	cmpq	%r10, %rcx	# D.5163, ivtmp.79
# SUCC: 10 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 11 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L8	#,
# BLOCK 11 freq:900 seq:9
# PRED: 8 [9.0%]  (CAN_FALLTHRU) 10 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
.L9:
	addl	$1, %r11d	#, q1
	addq	%rdi, %rsi	# D.5157, ivtmp.90
	addl	%r13d, %r9d	# D.5158, ivtmp.92
	cmpl	%r8d, %r11d	# p, q1
# SUCC: 8 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 12 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L6	#,
# BLOCK 12 freq:89 seq:10
# PRED: 4 [9.0%]  (CAN_FALLTHRU) 11 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
.L7:
	addq	$8, 8(%rsp)	#, %sfp
	movl	20(%rsp), %edx	# %sfp, D.5158
	movq	8(%rsp), %rsi	# %sfp, ivtmp.108
	addl	%edx, 16(%rsp)	# D.5158, %sfp
	cmpq	24(%rsp), %rsi	# %sfp, ivtmp.108
# SUCC: 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 13 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L3	#,
# BLOCK 13 freq:9 seq:11
# PRED: 2 [9.0%]  (CAN_FALLTHRU) 12 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
.L2:
	addq	$40, %rsp	#,
	.cfi_def_cfa_offset 56
	movq	%rax, %rdi	# scratch,
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
.LCOLDB2:
	.text
.LHOTB2:
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
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14	# Fout, Fout
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
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
	movq	%rsi, %rbx	# f, f
	subq	$72, %rsp	#,
	.cfi_def_cfa_offset 128
	movl	(%r8), %eax	# *factors_11(D), p
	movl	4(%r8), %edi	# MEM[(int *)factors_11(D) + 4B], m
	movq	%rdx, 32(%rsp)	# fstride, %sfp
	movq	%r9, 8(%rsp)	# st, %sfp
	movl	%eax, %edx	# p, D.5322
	movl	%eax, 40(%rsp)	# p, %sfp
	imull	%edi, %edx	# m, D.5322
	movl	%edi, 44(%rsp)	# m, %sfp
	movslq	%edx, %rdx	# D.5322, D.5323
	leaq	(%r14,%rdx,8), %r12	#, Fout_end
	cmpl	$1, %edi	#, m
# SUCC: 22 [28.0%]  (CAN_FALLTHRU) 3 [72.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L42	#,
# BLOCK 3 freq:900 seq:1
# PRED: 2 [72.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	32(%rsp), %rsi	# %sfp, fstride
	movslq	%ebp, %r15	# in_stride, D.5323
	movq	%r14, 56(%rsp)	# Fout, %sfp
	movslq	40(%rsp), %rax	# %sfp, D.5323
	leaq	8(%r8), %rdi	#, factors
	movslq	44(%rsp), %rdx	# %sfp, D.5323
	leaq	0(,%rsi,8), %r13	#, D.5323
	imulq	%r13, %r15	# D.5323, D.5323
	movq	%r13, 48(%rsp)	# D.5323, %sfp
	movq	%rbx, %r13	# f, f
	imulq	%rsi, %rax	# fstride, D.5323
	leaq	0(,%rdx,8), %rsi	#, D.5323
	movq	%rsi, 24(%rsp)	# D.5323, %sfp
	movq	%r15, 16(%rsp)	# D.5323, %sfp
	movq	%r14, %r15	# Fout, Fout
	movq	%r15, %rbx	# Fout, Fout
	movq	%rax, %r14	# D.5323, D.5323
# SUCC: 4 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rdi, %r15	# factors, factors
# BLOCK 4 freq:10000 seq:2
# PRED: 3 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L20:
	movq	8(%rsp), %r9	# %sfp,
	movq	%r13, %rsi	# f,
	movq	%rbx, %rdi	# Fout,
	movq	%r15, %r8	# factors,
	movl	%ebp, %ecx	# in_stride,
	movq	%r14, %rdx	# D.5323,
	call	kf_work	#
	addq	24(%rsp), %rbx	# %sfp, Fout
	addq	16(%rsp), %r13	# %sfp, f
	cmpq	%r12, %rbx	# Fout_end, Fout
# SUCC: 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 5 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L20	#,
# BLOCK 5 freq:900 seq:3
# PRED: 4 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	cmpl	$3, 40(%rsp)	#, %sfp
	movq	48(%rsp), %r13	# %sfp, D.5323
	movq	56(%rsp), %r14	# %sfp, Fout
# SUCC: 25 [20.0%]  (CAN_FALLTHRU) 6 [80.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L22	#,
# BLOCK 6 freq:1000 seq:4
# PRED: 5 [80.0%]  (FALLTHRU,CAN_FALLTHRU) 24 [80.0%]  (CAN_FALLTHRU)
.L45:
# SUCC: 7 [62.5%]  (FALLTHRU,CAN_FALLTHRU) 18 [37.5%]  (CAN_FALLTHRU)
	jle	.L43	#,
# BLOCK 7 freq:625 seq:5
# PRED: 6 [62.5%]  (FALLTHRU,CAN_FALLTHRU)
	movl	40(%rsp), %eax	# %sfp, p
	cmpl	$4, %eax	#, p
# SUCC: 13 [40.0%]  (CAN_FALLTHRU) 8 [60.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L25	#,
# BLOCK 8 freq:375 seq:6
# PRED: 7 [60.0%]  (FALLTHRU,CAN_FALLTHRU)
	cmpl	$5, %eax	#, p
# SUCC: 9 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 28 [33.3%]  (CAN_FALLTHRU)
	jne	.L21	#,
# BLOCK 9 freq:250 seq:7
# PRED: 8 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movslq	44(%rsp), %rcx	# %sfp,
	movq	32(%rsp), %rdx	# %sfp, D.5323
	movq	8(%rsp), %rbx	# %sfp, twiddles
	movq	%rcx, %rax	#,
	imulq	%rcx, %rdx	# D.5323, D.5323
	salq	$3, %rcx	#, D.5323
	addq	$264, %rbx	#, twiddles
	salq	$3, %rdx	#, D.5323
	leaq	(%rbx,%rdx), %rsi	#, D.5324
	movss	(%rsi), %xmm5	# MEM[(struct kiss_fft_cpx *)_228], ya$r
	addq	%rsi, %rdx	# D.5324, D.5324
	movss	4(%rdx), %xmm15	# MEM[(struct kiss_fft_cpx *)_232 + 4B], yb$i
	movss	%xmm5, 8(%rsp)	# ya$r, %sfp
	movss	4(%rsi), %xmm5	# MEM[(struct kiss_fft_cpx *)_228 + 4B], ya$i
	leaq	(%r14,%rcx), %rsi	#, Fout1
	leaq	(%rsi,%rcx), %rdi	#, Fout2
	movss	%xmm5, 16(%rsp)	# ya$i, %sfp
	movss	(%rdx), %xmm5	# MEM[(struct kiss_fft_cpx *)_232], yb$r
	leaq	(%rdi,%rcx), %r8	#, Fout3
	addq	%r8, %rcx	# Fout3, Fout4
	movss	%xmm5, 24(%rsp)	# yb$r, %sfp
	testl	%eax, %eax	# m
# SUCC: 10 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 12 [9.0%]  (CAN_FALLTHRU)
	jle	.L16	#,
# BLOCK 10 freq:228 seq:8
# PRED: 9 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	leal	-1(%rax), %edx	#, D.5326
	movq	%rbx, %r9	# twiddles, ivtmp.200
	leaq	8(%rcx,%rdx,8), %r11	#, D.5324
	xorl	%edx, %edx	# ivtmp.193
# SUCC: 11 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	leaq	0(%r13,%r13,2), %r10	#, tmp480
# BLOCK 11 freq:2528 seq:9
# PRED: 10 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 11 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L34:
	movss	(%rsi), %xmm0	# MEM[base: Fout1_445, offset: 0B], D.5325
	addq	$8, %rcx	#, Fout4
	addq	$8, %r14	#, Fout
	addq	$8, %rsi	#, Fout1
	movss	(%rbx,%rdx), %xmm3	# MEM[base: twiddles_46, index: ivtmp.193_179, offset: 0B], D.5325
	addq	$8, %rdi	#, Fout2
	addq	$8, %r8	#, Fout3
	movss	4(%rbx,%rdx), %xmm2	# MEM[base: twiddles_46, index: ivtmp.193_179, offset: 4B], D.5325
	movss	-4(%rsi), %xmm4	# MEM[base: Fout1_445, offset: 4B], D.5325
	movaps	%xmm3, %xmm1	# D.5325, D.5325
	mulss	%xmm0, %xmm1	# D.5325, D.5325
	movaps	%xmm2, %xmm5	# D.5325, D.5325
	movss	-4(%rdi), %xmm6	# MEM[base: Fout2_442, offset: 4B], D.5325
	mulss	%xmm2, %xmm0	# D.5325, D.5325
	movss	(%r9), %xmm9	# MEM[base: _873, offset: 0B], D.5325
	mulss	%xmm4, %xmm3	# D.5325, D.5325
	movss	-8(%r14), %xmm10	# MEM[base: Fout_446, offset: 0B], scratch$0$r
	mulss	%xmm4, %xmm5	# D.5325, D.5325
	movss	(%rbx,%rdx,2), %xmm4	# MEM[base: twiddles_46, index: ivtmp.193_179, step: 2, offset: 0B], D.5325
	movss	-4(%r14), %xmm8	# MEM[base: Fout_446, offset: 4B], scratch$0$i
	movss	24(%rsp), %xmm14	# %sfp, yb$r
	addss	%xmm0, %xmm3	# D.5325, D.5325
	movss	4(%rbx,%rdx,2), %xmm0	# MEM[base: twiddles_46, index: ivtmp.193_179, step: 2, offset: 4B], D.5325
	subss	%xmm5, %xmm1	# D.5325, D.5325
	movaps	%xmm4, %xmm5	# D.5325, D.5325
	mulss	%xmm6, %xmm4	# D.5325, D.5325
	movaps	%xmm0, %xmm7	# D.5325, D.5325
	mulss	%xmm6, %xmm7	# D.5325, D.5325
	movaps	%xmm3, %xmm2	# D.5325, D.5325
	movss	-8(%rdi), %xmm3	# MEM[base: Fout2_442, offset: 0B], D.5325
	movss	4(%r9), %xmm6	# MEM[base: _873, offset: 4B], D.5325
	addq	%r10, %r9	# tmp480, ivtmp.200
	mulss	%xmm3, %xmm5	# D.5325, D.5325
	mulss	%xmm0, %xmm3	# D.5325, D.5325
	movaps	%xmm4, %xmm0	# D.5325, D.5325
	movss	-4(%r8), %xmm4	# MEM[base: Fout3_444, offset: 4B], D.5325
	movaps	%xmm6, %xmm11	# D.5325, D.5325
	mulss	%xmm4, %xmm11	# D.5325, D.5325
	subss	%xmm7, %xmm5	# D.5325, D.5325
	mulss	%xmm9, %xmm4	# D.5325, D.5325
	movaps	%xmm9, %xmm7	# D.5325, D.5325
	movss	(%rbx,%rdx,4), %xmm9	# MEM[base: twiddles_46, index: ivtmp.193_179, step: 4, offset: 0B], D.5325
	addss	%xmm3, %xmm0	# D.5325, D.5325
	movss	-8(%r8), %xmm3	# MEM[base: Fout3_444, offset: 0B], D.5325
	movaps	%xmm9, %xmm12	# D.5325, D.5325
	mulss	%xmm3, %xmm7	# D.5325, D.5325
	mulss	%xmm6, %xmm3	# D.5325, D.5325
	movaps	%xmm4, %xmm6	# D.5325, D.5325
	movss	-8(%rcx), %xmm4	# MEM[base: Fout4_441, offset: 0B], D.5325
	mulss	%xmm4, %xmm12	# D.5325, D.5325
	subss	%xmm11, %xmm7	# D.5325, D.5325
	movss	4(%rbx,%rdx,4), %xmm11	# MEM[base: twiddles_46, index: ivtmp.193_179, step: 4, offset: 4B], D.5325
	addq	%r13, %rdx	# D.5323, ivtmp.193
	addss	%xmm3, %xmm6	# D.5325, D.5325
	movss	-4(%rcx), %xmm3	# MEM[base: Fout4_441, offset: 4B], D.5325
	movaps	%xmm11, %xmm13	# D.5325, D.5325
	mulss	%xmm3, %xmm13	# D.5325, D.5325
	mulss	%xmm3, %xmm9	# D.5325, D.5325
	movaps	%xmm11, %xmm3	# D.5325, D.5325
	mulss	%xmm4, %xmm3	# D.5325, D.5325
	movaps	%xmm7, %xmm4	# D.5325, D.5325
	addss	%xmm5, %xmm4	# D.5325, D.5325
	subss	%xmm13, %xmm12	# D.5325, D.5325
	subss	%xmm7, %xmm5	# D.5325, D.5325
	movaps	%xmm14, %xmm7	# yb$r, D.5325
	addss	%xmm9, %xmm3	# D.5325, D.5325
	mulss	%xmm4, %xmm7	# D.5325, D.5325
	movaps	%xmm12, %xmm11	# D.5325, D.5325
	addss	%xmm1, %xmm11	# D.5325, D.5325
	movaps	%xmm3, %xmm9	# D.5325, D.5325
	subss	%xmm12, %xmm1	# D.5325, D.5325
	addss	%xmm2, %xmm9	# D.5325, D.5325
	subss	%xmm3, %xmm2	# D.5325, D.5325
	movaps	%xmm6, %xmm3	# D.5325, D.5325
	addss	%xmm0, %xmm3	# D.5325, D.5325
	subss	%xmm6, %xmm0	# D.5325, D.5325
	movaps	%xmm11, %xmm6	# D.5325, D.5325
	addss	%xmm10, %xmm6	# scratch$0$r, D.5325
	movaps	%xmm0, %xmm12	# D.5325, D.5325
	addss	%xmm4, %xmm6	# D.5325, D.5325
	mulss	%xmm15, %xmm12	# yb$i, D.5325
	movss	%xmm6, -8(%r14)	# D.5325, MEM[base: Fout_446, offset: 0B]
	movaps	%xmm9, %xmm6	# D.5325, D.5325
	addss	%xmm8, %xmm6	# scratch$0$i, D.5325
	addss	%xmm3, %xmm6	# D.5325, D.5325
	movss	%xmm6, -4(%r14)	# D.5325, MEM[base: Fout_446, offset: 4B]
	movss	8(%rsp), %xmm6	# %sfp, ya$r
	movaps	%xmm6, %xmm13	# ya$r, D.5325
	mulss	%xmm11, %xmm13	# D.5325, D.5325
	mulss	%xmm9, %xmm6	# D.5325, D.5325
	addss	%xmm10, %xmm13	# scratch$0$r, D.5325
	addss	%xmm8, %xmm6	# scratch$0$i, D.5325
	addss	%xmm7, %xmm13	# D.5325, D.5325
	movaps	%xmm14, %xmm7	# yb$r, D.5325
	movss	16(%rsp), %xmm14	# %sfp, D.5325
	mulss	%xmm3, %xmm7	# D.5325, D.5325
	mulss	%xmm2, %xmm14	# D.5325, D.5325
	mulss	%xmm15, %xmm2	# yb$i, D.5325
	addss	%xmm7, %xmm6	# D.5325, D.5325
	movaps	%xmm14, %xmm7	# D.5325, D.5325
	movaps	%xmm5, %xmm14	# D.5325, D.5325
	addss	%xmm12, %xmm7	# D.5325, D.5325
	movss	16(%rsp), %xmm12	# %sfp, D.5325
	mulss	%xmm15, %xmm14	# yb$i, D.5325
	mulss	%xmm1, %xmm12	# D.5325, D.5325
	mulss	%xmm15, %xmm1	# yb$i, D.5325
	addss	%xmm14, %xmm12	# D.5325, D.5325
	movaps	%xmm13, %xmm14	# D.5325, D.5325
	subss	%xmm7, %xmm14	# D.5325, D.5325
	addss	%xmm13, %xmm7	# D.5325, D.5325
	movss	%xmm14, -8(%rsi)	# D.5325, MEM[base: Fout1_445, offset: 0B]
	movaps	%xmm6, %xmm14	# D.5325, D.5325
	subss	%xmm12, %xmm6	# D.5325, D.5325
	addss	%xmm12, %xmm14	# D.5325, D.5325
	movss	16(%rsp), %xmm12	# %sfp, ya$i
	mulss	%xmm12, %xmm0	# ya$i, D.5325
	movss	%xmm14, -4(%rsi)	# D.5325, MEM[base: Fout1_445, offset: 4B]
	mulss	%xmm12, %xmm5	# ya$i, D.5325
	movss	%xmm7, -8(%rcx)	# D.5325, MEM[base: Fout4_441, offset: 0B]
	movss	24(%rsp), %xmm7	# %sfp, yb$r
	movss	%xmm6, -4(%rcx)	# D.5325, MEM[base: Fout4_441, offset: 4B]
	movss	8(%rsp), %xmm6	# %sfp, ya$r
	mulss	%xmm7, %xmm11	# yb$r, D.5325
	subss	%xmm2, %xmm0	# D.5325, D.5325
	mulss	%xmm6, %xmm4	# ya$r, D.5325
	subss	%xmm5, %xmm1	# D.5325, D.5325
	mulss	%xmm7, %xmm9	# yb$r, D.5325
	mulss	%xmm6, %xmm3	# ya$r, D.5325
	addss	%xmm11, %xmm10	# D.5325, D.5325
	addss	%xmm9, %xmm8	# D.5325, D.5325
	addss	%xmm4, %xmm10	# D.5325, D.5325
	addss	%xmm3, %xmm8	# D.5325, D.5325
	movaps	%xmm10, %xmm2	# D.5325, D.5325
	subss	%xmm0, %xmm10	# D.5325, D.5325
	addss	%xmm0, %xmm2	# D.5325, D.5325
	movss	%xmm2, -8(%rdi)	# D.5325, MEM[base: Fout2_442, offset: 0B]
	movaps	%xmm8, %xmm2	# D.5325, D.5325
	subss	%xmm1, %xmm8	# D.5325, D.5325
	addss	%xmm1, %xmm2	# D.5325, D.5325
	movss	%xmm2, -4(%rdi)	# D.5325, MEM[base: Fout2_442, offset: 4B]
	movss	%xmm10, -8(%r8)	# D.5325, MEM[base: Fout3_444, offset: 0B]
	movss	%xmm8, -4(%r8)	# D.5325, MEM[base: Fout3_444, offset: 4B]
	cmpq	%r11, %rcx	# D.5324, Fout4
# SUCC: 11 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 12 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L34	#,
# BLOCK 12 freq:500 seq:10
# PRED: 11 [9.0%]  (FALLTHRU,CAN_FALLTHRU) 9 [9.0%]  (CAN_FALLTHRU) 15 [9.0%]  (CAN_FALLTHRU)
.L16:
	addq	$72, %rsp	#,
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
.L25:
	.cfi_restore_state
	movslq	44(%rsp), %r10	# %sfp, k
	movq	8(%rsp), %rsi	# %sfp, st
	movq	32(%rsp), %rax	# %sfp, fstride
	leaq	0(,%r10,8), %rdx	#, D.5323
	leaq	264(%rsi), %rdi	#, tw3
	movl	4(%rsi), %ebx	# st_33(D)->inverse, D.5322
	leaq	(%r14,%rdx), %rsi	#, ivtmp.167
	movq	%rax, %r11	# fstride, D.5323
	movq	%rdi, %r9	# tw3, tw3
	leaq	(%rax,%rax,2), %rbp	#, tmp449
	salq	$4, %r11	#, D.5323
	movq	%rdi, %r8	# tw3, tw3
	leaq	(%rsi,%rdx), %rcx	#, ivtmp.170
	salq	$3, %rbp	#, tmp450
	addq	%rcx, %rdx	# ivtmp.170, ivtmp.173
# SUCC: 16 [100.0%]  (CAN_FALLTHRU)
	jmp	.L33	#
# BLOCK 14 freq:1389 seq:12
# PRED: 16 [50.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L44:
	movaps	%xmm8, %xmm1	# D.5325, D.5325
	subss	%xmm0, %xmm1	# D.5325, D.5325
	addss	%xmm8, %xmm0	# D.5325, D.5325
	movss	%xmm1, (%rsi)	# D.5325, MEM[base: _892, offset: 0B]
	movaps	%xmm6, %xmm1	# D.5325, D.5325
	addss	%xmm7, %xmm1	# D.5325, D.5325
	subss	%xmm6, %xmm7	# D.5325, D.5325
	movss	%xmm1, 4(%rsi)	# D.5325, MEM[base: _892, offset: 4B]
	movss	%xmm0, (%rdx)	# D.5325, MEM[base: _888, offset: 0B]
# SUCC: 15 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	%xmm7, 4(%rdx)	# D.5325, MEM[base: _888, offset: 4B]
# BLOCK 15 freq:2778 seq:13
# PRED: 14 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 17 [100.0%]  (CAN_FALLTHRU)
.L32:
	addq	$8, %r14	#, Fout
	addq	$8, %rsi	#, ivtmp.167
	addq	$8, %rcx	#, ivtmp.170
	addq	$8, %rdx	#, ivtmp.173
	subq	$1, %r10	#, k
# SUCC: 16 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 12 [9.0%]  (CAN_FALLTHRU)
	je	.L16	#,
# BLOCK 16 freq:2778 seq:14
# PRED: 15 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 13 [100.0%]  (CAN_FALLTHRU)
.L33:
	movss	(%rsi), %xmm0	# MEM[base: _892, offset: 0B], D.5325
	movss	(%rdi), %xmm2	# MEM[base: tw3_155, offset: 0B], D.5325
	movss	4(%rsi), %xmm3	# MEM[base: _892, offset: 4B], D.5325
	movaps	%xmm0, %xmm6	# D.5325, D.5325
	movss	4(%rdi), %xmm1	# MEM[base: tw3_155, offset: 4B], D.5325
	mulss	%xmm2, %xmm6	# D.5325, D.5325
	addq	%r13, %rdi	# D.5323, tw3
	mulss	%xmm3, %xmm2	# D.5325, D.5325
	movaps	%xmm3, %xmm4	# D.5325, D.5325
	movss	(%rcx), %xmm5	# MEM[base: _890, offset: 0B], D.5325
	mulss	%xmm1, %xmm4	# D.5325, D.5325
	movss	4(%r8), %xmm3	# MEM[base: tw3_168, offset: 4B], D.5325
	mulss	%xmm0, %xmm1	# D.5325, D.5325
	movaps	%xmm2, %xmm0	# D.5325, D.5325
	movaps	%xmm5, %xmm2	# D.5325, D.5325
	subss	%xmm4, %xmm6	# D.5325, D.5325
	movss	(%r8), %xmm4	# MEM[base: tw3_168, offset: 0B], D.5325
	addq	%r11, %r8	# D.5323, tw3
	addss	%xmm1, %xmm0	# D.5325, D.5325
	movss	4(%rcx), %xmm1	# MEM[base: _890, offset: 4B], D.5325
	mulss	%xmm4, %xmm2	# D.5325, D.5325
	movaps	%xmm1, %xmm7	# D.5325, D.5325
	mulss	%xmm3, %xmm7	# D.5325, D.5325
	mulss	%xmm4, %xmm1	# D.5325, D.5325
	movss	4(%r9), %xmm4	# MEM[base: tw3_181, offset: 4B], D.5325
	mulss	%xmm5, %xmm3	# D.5325, D.5325
	subss	%xmm7, %xmm2	# D.5325, D.5325
	movaps	%xmm1, %xmm5	# D.5325, D.5325
	movss	(%r9), %xmm1	# MEM[base: tw3_181, offset: 0B], D.5325
	addq	%rbp, %r9	# tmp450, tw3
	addss	%xmm3, %xmm5	# D.5325, D.5325
	movss	4(%rdx), %xmm3	# MEM[base: _888, offset: 4B], D.5325
	movaps	%xmm2, %xmm10	# D.5325, D.5325
	movss	(%rdx), %xmm2	# MEM[base: _888, offset: 0B], D.5325
	movaps	%xmm3, %xmm7	# D.5325, D.5325
	mulss	%xmm4, %xmm7	# D.5325, D.5325
	movaps	%xmm2, %xmm9	# D.5325, D.5325
	mulss	%xmm2, %xmm4	# D.5325, D.5325
	movss	(%r14), %xmm2	# MEM[base: Fout_152, offset: 0B], D.5325
	mulss	%xmm1, %xmm9	# D.5325, D.5325
	mulss	%xmm3, %xmm1	# D.5325, D.5325
	movaps	%xmm2, %xmm8	# D.5325, D.5325
	addss	%xmm10, %xmm2	# D.5325, D.5325
	subss	%xmm10, %xmm8	# D.5325, D.5325
	subss	%xmm7, %xmm9	# D.5325, D.5325
	addss	%xmm4, %xmm1	# D.5325, D.5325
	movss	%xmm2, (%r14)	# D.5325, MEM[base: Fout_152, offset: 0B]
	movaps	%xmm1, %xmm3	# D.5325, D.5325
	movss	4(%r14), %xmm1	# MEM[base: Fout_152, offset: 4B], D.5325
	movaps	%xmm3, %xmm4	# D.5325, D.5325
	movaps	%xmm1, %xmm7	# D.5325, D.5325
	addss	%xmm5, %xmm1	# D.5325, D.5325
	subss	%xmm5, %xmm7	# D.5325, D.5325
	movaps	%xmm9, %xmm5	# D.5325, D.5325
	addss	%xmm6, %xmm5	# D.5325, D.5325
	addss	%xmm0, %xmm4	# D.5325, D.5325
	movss	%xmm1, 4(%r14)	# D.5325, MEM[base: Fout_152, offset: 4B]
	subss	%xmm9, %xmm6	# D.5325, D.5325
	subss	%xmm5, %xmm2	# D.5325, D.5325
	subss	%xmm4, %xmm1	# D.5325, D.5325
	subss	%xmm3, %xmm0	# D.5325, D.5325
	movss	%xmm2, (%rcx)	# D.5325, MEM[base: _890, offset: 0B]
	movss	%xmm1, 4(%rcx)	# D.5325, MEM[base: _890, offset: 4B]
	addss	(%r14), %xmm5	# MEM[base: Fout_152, offset: 0B], D.5325
	addss	4(%r14), %xmm4	# MEM[base: Fout_152, offset: 4B], D.5325
	movss	%xmm5, (%r14)	# D.5325, MEM[base: Fout_152, offset: 0B]
	movss	%xmm4, 4(%r14)	# D.5325, MEM[base: Fout_152, offset: 4B]
	testl	%ebx, %ebx	# D.5322
# SUCC: 14 [50.0%]  (CAN_FALLTHRU) 17 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L44	#,
# BLOCK 17 freq:1389 seq:15
# PRED: 16 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	movaps	%xmm0, %xmm1	# D.5325, D.5325
	addss	%xmm8, %xmm1	# D.5325, D.5325
	subss	%xmm0, %xmm8	# D.5325, D.5325
	movss	%xmm1, (%rsi)	# D.5325, MEM[base: _892, offset: 0B]
	movaps	%xmm7, %xmm1	# D.5325, D.5325
	addss	%xmm6, %xmm7	# D.5325, D.5325
	subss	%xmm6, %xmm1	# D.5325, D.5325
	movss	%xmm1, 4(%rsi)	# D.5325, MEM[base: _892, offset: 4B]
	movss	%xmm8, (%rdx)	# D.5325, MEM[base: _888, offset: 0B]
	movss	%xmm7, 4(%rdx)	# D.5325, MEM[base: _888, offset: 4B]
# SUCC: 15 [100.0%]  (CAN_FALLTHRU)
	jmp	.L32	#
# BLOCK 18 freq:375 seq:16
# PRED: 6 [37.5%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L43:
	cmpl	$2, 40(%rsp)	#, %sfp
# SUCC: 19 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 28 [33.3%]  (CAN_FALLTHRU)
	jne	.L21	#,
# BLOCK 19 freq:250 seq:17
# PRED: 18 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movslq	44(%rsp), %rdx	# %sfp,
	movq	8(%rsp), %rbx	# %sfp, tw1
	movq	%rdx, %rax	#,
	leal	-1(%rax), %ecx	#, D.5326
	addq	$264, %rbx	#, tw1
	leaq	(%r14,%rdx,8), %rdx	#, Fout2
# SUCC: 20 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	leaq	8(%rdx,%rcx,8), %rcx	#, D.5324
# BLOCK 20 freq:2778 seq:18
# PRED: 19 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 20 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L27:
	movss	4(%rbx), %xmm0	# MEM[base: tw1_56, offset: 4B], D.5325
	addq	$8, %rdx	#, Fout2
	addq	$8, %r14	#, Fout
	movss	(%rbx), %xmm3	# MEM[base: tw1_56, offset: 0B], D.5325
	addq	%r13, %rbx	# D.5323, tw1
	movss	-8(%rdx), %xmm1	# MEM[base: Fout2_54, offset: 0B], D.5325
	movaps	%xmm0, %xmm5	# D.5325, D.5325
	movss	-4(%rdx), %xmm4	# MEM[base: Fout2_54, offset: 4B], D.5325
	movaps	%xmm3, %xmm2	# D.5325, D.5325
	mulss	%xmm1, %xmm2	# D.5325, D.5325
	mulss	%xmm4, %xmm5	# D.5325, D.5325
	mulss	%xmm4, %xmm3	# D.5325, D.5325
	mulss	%xmm0, %xmm1	# D.5325, D.5325
	subss	%xmm5, %xmm2	# D.5325, D.5325
	movaps	%xmm3, %xmm0	# D.5325, D.5325
	addss	%xmm1, %xmm0	# D.5325, D.5325
	movss	-8(%r14), %xmm1	# MEM[base: Fout_68, offset: 0B], MEM[base: Fout_68, offset: 0B]
	subss	%xmm2, %xmm1	# D.5325, D.5325
	movss	%xmm1, -8(%rdx)	# D.5325, MEM[base: Fout2_54, offset: 0B]
	movss	-4(%r14), %xmm1	# MEM[base: Fout_68, offset: 4B], MEM[base: Fout_68, offset: 4B]
	subss	%xmm0, %xmm1	# D.5325, D.5325
	movss	%xmm1, -4(%rdx)	# D.5325, MEM[base: Fout2_54, offset: 4B]
	addss	-8(%r14), %xmm2	# MEM[base: Fout_68, offset: 0B], D.5325
	addss	-4(%r14), %xmm0	# MEM[base: Fout_68, offset: 4B], D.5325
	movss	%xmm2, -8(%r14)	# D.5325, MEM[base: Fout_68, offset: 0B]
	movss	%xmm0, -4(%r14)	# D.5325, MEM[base: Fout_68, offset: 4B]
	cmpq	%rcx, %rdx	# D.5324, Fout2
# SUCC: 20 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 21 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L27	#,
# BLOCK 21 freq:250 seq:19
# PRED: 20 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	addq	$72, %rsp	#,
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
.L42:
	.cfi_restore_state
	movq	32(%rsp), %rax	# %sfp, fstride
	movq	%r14, %rdx	# Fout, Fout
	leaq	0(,%rax,8), %r13	#, D.5323
# SUCC: 23 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	imulq	%r13, %rbp	# D.5323, D.5323
# BLOCK 23 freq:3889 seq:21
# PRED: 22 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 23 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L18:
	movq	(%rbx), %rax	# MEM[base: f_3, offset: 0B], MEM[base: f_3, offset: 0B]
	addq	$8, %rdx	#, Fout
	addq	%rbp, %rbx	# D.5323, f
	movq	%rax, -8(%rdx)	# MEM[base: f_3, offset: 0B], MEM[base: Fout_1, offset: 0B]
	cmpq	%r12, %rdx	# Fout_end, Fout
# SUCC: 23 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 24 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L18	#,
# BLOCK 24 freq:350 seq:22
# PRED: 23 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	cmpl	$3, 40(%rsp)	#, %sfp
# SUCC: 25 [20.0%]  (FALLTHRU,CAN_FALLTHRU) 6 [80.0%]  (CAN_FALLTHRU)
	jne	.L45	#,
# BLOCK 25 freq:250 seq:23
# PRED: 5 [20.0%]  (CAN_FALLTHRU) 24 [20.0%]  (FALLTHRU,CAN_FALLTHRU)
.L22:
	movq	32(%rsp), %r8	# %sfp, fstride
	movslq	44(%rsp), %rdi	# %sfp, m
	movq	8(%rsp), %rax	# %sfp, st
	movsd	.LC1(%rip), %xmm6	#, tmp534
	movq	%r8, %rdx	# fstride, D.5323
	salq	$4, %r8	#, D.5323
	imulq	%rdi, %rdx	# m, D.5323
	leaq	0(,%rdi,8), %rcx	#, D.5323
	leaq	264(%rax), %rbx	#, tw2
	movq	%rbx, %rsi	# tw2, tw2
	movss	268(%rax,%rdx,8), %xmm7	# MEM[(struct  *)_82 + 4B], epi3$i
	leaq	(%r14,%rcx), %rdx	#, ivtmp.143
# SUCC: 26 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	addq	%rdx, %rcx	# ivtmp.143, ivtmp.146
# BLOCK 26 freq:2778 seq:24
# PRED: 25 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 26 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L29:
	movss	(%rdx), %xmm1	# MEM[base: _205, offset: 0B], D.5325
	addq	$8, %r14	#, Fout
	addq	$8, %rdx	#, ivtmp.143
	addq	$8, %rcx	#, ivtmp.146
	movss	-4(%rdx), %xmm4	# MEM[base: _205, offset: 4B], D.5325
	pxor	%xmm15, %xmm15	# tmp626
	movss	(%rbx), %xmm3	# MEM[base: tw2_89, offset: 0B], D.5325
	movaps	%xmm1, %xmm0	# D.5325, D.5325
	movss	4(%rbx), %xmm2	# MEM[base: tw2_89, offset: 4B], D.5325
	movaps	%xmm4, %xmm5	# D.5325, D.5325
	addq	%r13, %rbx	# D.5323, tw2
	mulss	%xmm3, %xmm0	# D.5325, D.5325
	movss	-4(%rcx), %xmm8	# MEM[base: _213, offset: 4B], D.5325
	mulss	%xmm2, %xmm5	# D.5325, D.5325
	mulss	%xmm4, %xmm3	# D.5325, D.5325
	movss	(%rsi), %xmm4	# MEM[base: tw2_102, offset: 0B], D.5325
	movaps	%xmm8, %xmm9	# D.5325, D.5325
	mulss	%xmm1, %xmm2	# D.5325, D.5325
	subss	%xmm5, %xmm0	# D.5325, D.5325
	addss	%xmm2, %xmm3	# D.5325, D.5325
	movss	-8(%rcx), %xmm2	# MEM[base: _213, offset: 0B], D.5325
	movaps	%xmm2, %xmm5	# D.5325, D.5325
	mulss	%xmm4, %xmm5	# D.5325, D.5325
	movaps	%xmm3, %xmm1	# D.5325, D.5325
	movss	4(%rsi), %xmm3	# MEM[base: tw2_102, offset: 4B], D.5325
	addq	%r8, %rsi	# D.5323, tw2
	mulss	%xmm8, %xmm4	# D.5325, D.5325
	pxor	%xmm8, %xmm8	# D.5328
	cvtss2sd	-8(%r14), %xmm8	# MEM[base: Fout_86, offset: 0B], D.5328
	mulss	%xmm3, %xmm9	# D.5325, D.5325
	mulss	%xmm2, %xmm3	# D.5325, D.5325
	subss	%xmm9, %xmm5	# D.5325, D.5325
	pxor	%xmm9, %xmm9	# D.5328
	addss	%xmm3, %xmm4	# D.5325, D.5325
	movaps	%xmm5, %xmm3	# D.5325, D.5325
	addss	%xmm0, %xmm3	# D.5325, D.5325
	movaps	%xmm4, %xmm2	# D.5325, D.5325
	addss	%xmm1, %xmm4	# D.5325, D.5325
	subss	%xmm2, %xmm1	# D.5325, D.5325
	cvtss2sd	%xmm3, %xmm9	# D.5325, D.5328
	mulsd	%xmm6, %xmm9	# tmp534, D.5328
	subss	%xmm5, %xmm0	# D.5325, D.5325
	mulss	%xmm7, %xmm1	# epi3$i, D.5325
	mulss	%xmm7, %xmm0	# epi3$i, D.5325
	subsd	%xmm9, %xmm8	# D.5328, D.5328
	pxor	%xmm9, %xmm9	# D.5328
	cvtss2sd	%xmm4, %xmm9	# D.5325, D.5328
	mulsd	%xmm6, %xmm9	# tmp534, D.5328
	cvtsd2ss	%xmm8, %xmm15	# D.5328, tmp626
	movss	%xmm15, -8(%rdx)	# tmp626, MEM[base: _205, offset: 0B]
	pxor	%xmm8, %xmm8	# D.5328
	pxor	%xmm15, %xmm15	# tmp627
	cvtss2sd	-4(%r14), %xmm8	# MEM[base: Fout_86, offset: 4B], D.5328
	subsd	%xmm9, %xmm8	# D.5328, D.5328
	cvtsd2ss	%xmm8, %xmm15	# D.5328, tmp627
	movss	%xmm15, -4(%rdx)	# tmp627, MEM[base: _205, offset: 4B]
	addss	-8(%r14), %xmm3	# MEM[base: Fout_86, offset: 0B], D.5325
	addss	-4(%r14), %xmm4	# MEM[base: Fout_86, offset: 4B], D.5325
	movss	%xmm3, -8(%r14)	# D.5325, MEM[base: Fout_86, offset: 0B]
	movss	%xmm4, -4(%r14)	# D.5325, MEM[base: Fout_86, offset: 4B]
	movss	-8(%rdx), %xmm2	# MEM[base: _205, offset: 0B], D.5325
	addss	%xmm1, %xmm2	# D.5325, D.5325
	movss	%xmm2, -8(%rcx)	# D.5325, MEM[base: _213, offset: 0B]
	movss	-4(%rdx), %xmm2	# MEM[base: _205, offset: 4B], MEM[base: _205, offset: 4B]
	subss	%xmm0, %xmm2	# D.5325, D.5325
	movss	%xmm2, -4(%rcx)	# D.5325, MEM[base: _213, offset: 4B]
	movss	-8(%rdx), %xmm2	# MEM[base: _205, offset: 0B], MEM[base: _205, offset: 0B]
	addss	-4(%rdx), %xmm0	# MEM[base: _205, offset: 4B], D.5325
	subss	%xmm1, %xmm2	# D.5325, D.5325
	movss	%xmm0, -4(%rdx)	# D.5325, MEM[base: _205, offset: 4B]
	movss	%xmm2, -8(%rdx)	# D.5325, MEM[base: _205, offset: 0B]
	subq	$1, %rdi	#, m
# SUCC: 26 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 27 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L29	#,
# BLOCK 27 freq:250 seq:25
# PRED: 26 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	addq	$72, %rsp	#,
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
.L21:
	.cfi_restore_state
	movl	40(%rsp), %r8d	# %sfp,
	movq	%r14, %rdi	# Fout,
	movl	44(%rsp), %ecx	# %sfp,
	movq	8(%rsp), %rdx	# %sfp,
	movq	32(%rsp), %rsi	# %sfp,
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
	jmp	kf_bfly_generic	#
	.cfi_endproc
.LFE50:
	.size	kf_work, .-kf_work
	.section	.text.unlikely
.LCOLDE2:
	.text
.LHOTE2:
	.section	.text.unlikely
.LCOLDB3:
	.text
.LHOTB3:
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
	movq	%rdi, %r14	# Fout, Fout
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movslq	%edx, %rbp	# in_stride,
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%r8, %rbx	# st, st
	subq	$56, %rsp	#,
	.cfi_def_cfa_offset 112
	movl	(%rcx), %eax	# *factors_1(D), p
	movl	4(%rcx), %edi	# MEM[(int *)factors_1(D) + 4B], m
	movl	%eax, %edx	# p, D.5571
	movl	%eax, 32(%rsp)	# p, %sfp
	imull	%edi, %edx	# m, D.5571
	movl	%edi, 36(%rsp)	# m, %sfp
	movslq	%edx, %rdx	# D.5571, D.5572
	leaq	(%r14,%rdx,8), %r12	#, Fout_end
	cmpl	$1, %edi	#, m
# SUCC: 29 [28.0%]  (CAN_FALLTHRU) 3 [72.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L89	#,
# BLOCK 3 freq:900 seq:1
# PRED: 2 [72.0%]  (FALLTHRU,CAN_FALLTHRU)
	movslq	%ebp, %r13	# in_stride, D.5572
	movslq	36(%rsp), %rdx	# %sfp, D.5572
	movl	%ebp, %edi	# in_stride, in_stride
	movq	%r14, 40(%rsp)	# Fout, %sfp
	leaq	0(,%r13,8), %rax	#, D.5572
	movq	%r14, %r13	# Fout, Fout
	movq	%rsi, %r14	# f, f
	movq	%rax, 8(%rsp)	# D.5572, %sfp
	movslq	32(%rsp), %rax	# %sfp, D.5572
	movq	%r13, %rbp	# Fout, Fout
	movl	%edi, %r13d	# in_stride, in_stride
	movq	%rax, 16(%rsp)	# D.5572, %sfp
	leaq	0(,%rdx,8), %rax	#, D.5572
	movq	%rax, 24(%rsp)	# D.5572, %sfp
	leaq	8(%rcx), %rax	#, factors
# SUCC: 4 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rax, %r15	# factors, factors
# BLOCK 4 freq:10000 seq:2
# PRED: 3 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L55:
	movq	16(%rsp), %rdx	# %sfp,
	movq	%r14, %rsi	# f,
	movq	%rbp, %rdi	# Fout,
	movq	%rbx, %r9	# st,
	movq	%r15, %r8	# factors,
	movl	%r13d, %ecx	# in_stride,
	call	kf_work	#
	addq	24(%rsp), %rbp	# %sfp, Fout
	addq	8(%rsp), %r14	# %sfp, f
	cmpq	%rbp, %r12	# Fout, Fout_end
# SUCC: 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 5 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L55	#,
# BLOCK 5 freq:900 seq:3
# PRED: 4 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	cmpl	$3, 32(%rsp)	#, %sfp
	movq	40(%rsp), %r14	# %sfp, Fout
# SUCC: 32 [20.0%]  (CAN_FALLTHRU) 6 [80.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L50	#,
# BLOCK 6 freq:1000 seq:4
# PRED: 5 [80.0%]  (FALLTHRU,CAN_FALLTHRU) 31 [80.0%]  (CAN_FALLTHRU)
.L92:
# SUCC: 7 [62.5%]  (FALLTHRU,CAN_FALLTHRU) 18 [37.5%]  (CAN_FALLTHRU)
	jle	.L90	#,
# BLOCK 7 freq:625 seq:5
# PRED: 6 [62.5%]  (FALLTHRU,CAN_FALLTHRU)
	movl	32(%rsp), %eax	# %sfp, p
	cmpl	$4, %eax	#, p
# SUCC: 13 [40.0%]  (CAN_FALLTHRU) 8 [60.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L53	#,
# BLOCK 8 freq:375 seq:6
# PRED: 7 [60.0%]  (FALLTHRU,CAN_FALLTHRU)
	cmpl	$5, %eax	#, p
# SUCC: 9 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 35 [33.3%]  (CAN_FALLTHRU)
	jne	.L49	#,
# BLOCK 9 freq:250 seq:7
# PRED: 8 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movslq	36(%rsp), %rcx	# %sfp,
	addq	$264, %rbx	#, twiddles
	movq	%rcx, %rax	#,
	salq	$3, %rcx	#, D.5572
	leaq	(%rbx,%rcx), %rdx	#, D.5577
	movss	(%rdx), %xmm5	# MEM[(struct kiss_fft_cpx *)_227], ya$r
	leaq	(%r14,%rcx), %rsi	#, Fout1
	leaq	(%rsi,%rcx), %rdi	#, Fout2
	movss	%xmm5, 8(%rsp)	# ya$r, %sfp
	movss	4(%rdx), %xmm5	# MEM[(struct kiss_fft_cpx *)_227 + 4B], ya$i
	addq	%rcx, %rdx	# D.5572, D.5577
	leaq	(%rdi,%rcx), %r8	#, Fout3
	movss	4(%rdx), %xmm15	# MEM[(struct kiss_fft_cpx *)_231 + 4B], yb$i
	movss	%xmm5, 16(%rsp)	# ya$i, %sfp
	movss	(%rdx), %xmm5	# MEM[(struct kiss_fft_cpx *)_231], yb$r
	addq	%r8, %rcx	# Fout3, Fout4
	movss	%xmm5, 24(%rsp)	# yb$r, %sfp
	testl	%eax, %eax	# m
# SUCC: 10 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 12 [9.0%]  (CAN_FALLTHRU)
	jle	.L46	#,
# BLOCK 10 freq:228 seq:8
# PRED: 9 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	leal	-1(%rax), %edx	#, D.5575
	movq	%rbx, %r9	# twiddles, ivtmp.379
	leaq	8(%rcx,%rdx,8), %r10	#, D.5577
# SUCC: 11 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	xorl	%edx, %edx	# ivtmp.360
# BLOCK 11 freq:2528 seq:9
# PRED: 10 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 11 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L71:
	movss	(%rsi), %xmm0	# MEM[base: Fout1_428, offset: 0B], D.5579
	addq	$8, %rcx	#, Fout4
	addq	$8, %r14	#, Fout
	addq	$8, %rsi	#, Fout1
	movss	(%rbx,%rdx), %xmm3	# MEM[base: twiddles_46, index: ivtmp.360_178, offset: 0B], D.5579
	addq	$8, %rdi	#, Fout2
	addq	$8, %r8	#, Fout3
	addq	$24, %r9	#, ivtmp.379
	movss	4(%rbx,%rdx), %xmm2	# MEM[base: twiddles_46, index: ivtmp.360_178, offset: 4B], D.5579
	movss	-4(%rsi), %xmm4	# MEM[base: Fout1_428, offset: 4B], D.5579
	movaps	%xmm3, %xmm1	# D.5579, D.5579
	mulss	%xmm0, %xmm1	# D.5579, D.5579
	movaps	%xmm2, %xmm5	# D.5579, D.5579
	movss	-4(%rdi), %xmm6	# MEM[base: Fout2_425, offset: 4B], D.5579
	mulss	%xmm2, %xmm0	# D.5579, D.5579
	movss	-24(%r9), %xmm9	# MEM[base: _648, offset: 0B], D.5579
	mulss	%xmm4, %xmm3	# D.5579, D.5579
	movss	-8(%r14), %xmm10	# MEM[base: Fout_429, offset: 0B], scratch$0$r
	mulss	%xmm4, %xmm5	# D.5579, D.5579
	movss	(%rbx,%rdx,2), %xmm4	# MEM[base: twiddles_46, index: ivtmp.360_178, step: 2, offset: 0B], D.5579
	movss	-4(%r14), %xmm8	# MEM[base: Fout_429, offset: 4B], scratch$0$i
	movss	24(%rsp), %xmm14	# %sfp, yb$r
	addss	%xmm0, %xmm3	# D.5579, D.5579
	movss	4(%rbx,%rdx,2), %xmm0	# MEM[base: twiddles_46, index: ivtmp.360_178, step: 2, offset: 4B], D.5579
	subss	%xmm5, %xmm1	# D.5579, D.5579
	movaps	%xmm4, %xmm5	# D.5579, D.5579
	mulss	%xmm6, %xmm4	# D.5579, D.5579
	movaps	%xmm0, %xmm7	# D.5579, D.5579
	mulss	%xmm6, %xmm7	# D.5579, D.5579
	movaps	%xmm3, %xmm2	# D.5579, D.5579
	movss	-8(%rdi), %xmm3	# MEM[base: Fout2_425, offset: 0B], D.5579
	movss	-20(%r9), %xmm6	# MEM[base: _648, offset: 4B], D.5579
	mulss	%xmm3, %xmm5	# D.5579, D.5579
	mulss	%xmm0, %xmm3	# D.5579, D.5579
	movaps	%xmm4, %xmm0	# D.5579, D.5579
	movss	-4(%r8), %xmm4	# MEM[base: Fout3_427, offset: 4B], D.5579
	movaps	%xmm6, %xmm11	# D.5579, D.5579
	mulss	%xmm4, %xmm11	# D.5579, D.5579
	subss	%xmm7, %xmm5	# D.5579, D.5579
	mulss	%xmm9, %xmm4	# D.5579, D.5579
	movaps	%xmm9, %xmm7	# D.5579, D.5579
	movss	(%rbx,%rdx,4), %xmm9	# MEM[base: twiddles_46, index: ivtmp.360_178, step: 4, offset: 0B], D.5579
	addss	%xmm3, %xmm0	# D.5579, D.5579
	movss	-8(%r8), %xmm3	# MEM[base: Fout3_427, offset: 0B], D.5579
	movaps	%xmm9, %xmm12	# D.5579, D.5579
	mulss	%xmm3, %xmm7	# D.5579, D.5579
	mulss	%xmm6, %xmm3	# D.5579, D.5579
	movaps	%xmm4, %xmm6	# D.5579, D.5579
	movss	-8(%rcx), %xmm4	# MEM[base: Fout4_424, offset: 0B], D.5579
	mulss	%xmm4, %xmm12	# D.5579, D.5579
	subss	%xmm11, %xmm7	# D.5579, D.5579
	movss	4(%rbx,%rdx,4), %xmm11	# MEM[base: twiddles_46, index: ivtmp.360_178, step: 4, offset: 4B], D.5579
	addq	$8, %rdx	#, ivtmp.360
	addss	%xmm3, %xmm6	# D.5579, D.5579
	movss	-4(%rcx), %xmm3	# MEM[base: Fout4_424, offset: 4B], D.5579
	movaps	%xmm11, %xmm13	# D.5579, D.5579
	mulss	%xmm3, %xmm13	# D.5579, D.5579
	mulss	%xmm3, %xmm9	# D.5579, D.5579
	movaps	%xmm11, %xmm3	# D.5579, D.5579
	mulss	%xmm4, %xmm3	# D.5579, D.5579
	movaps	%xmm7, %xmm4	# D.5579, D.5579
	addss	%xmm5, %xmm4	# D.5579, D.5579
	subss	%xmm13, %xmm12	# D.5579, D.5579
	subss	%xmm7, %xmm5	# D.5579, D.5579
	movaps	%xmm14, %xmm7	# yb$r, D.5579
	addss	%xmm9, %xmm3	# D.5579, D.5579
	mulss	%xmm4, %xmm7	# D.5579, D.5579
	movaps	%xmm12, %xmm11	# D.5579, D.5579
	addss	%xmm1, %xmm11	# D.5579, D.5579
	movaps	%xmm3, %xmm9	# D.5579, D.5579
	subss	%xmm12, %xmm1	# D.5579, D.5579
	addss	%xmm2, %xmm9	# D.5579, D.5579
	subss	%xmm3, %xmm2	# D.5579, D.5579
	movaps	%xmm6, %xmm3	# D.5579, D.5579
	addss	%xmm0, %xmm3	# D.5579, D.5579
	subss	%xmm6, %xmm0	# D.5579, D.5579
	movaps	%xmm11, %xmm6	# D.5579, D.5579
	addss	%xmm10, %xmm6	# scratch$0$r, D.5579
	movaps	%xmm0, %xmm12	# D.5579, D.5579
	addss	%xmm4, %xmm6	# D.5579, D.5579
	mulss	%xmm15, %xmm12	# yb$i, D.5579
	movss	%xmm6, -8(%r14)	# D.5579, MEM[base: Fout_429, offset: 0B]
	movaps	%xmm9, %xmm6	# D.5579, D.5579
	addss	%xmm8, %xmm6	# scratch$0$i, D.5579
	addss	%xmm3, %xmm6	# D.5579, D.5579
	movss	%xmm6, -4(%r14)	# D.5579, MEM[base: Fout_429, offset: 4B]
	movss	8(%rsp), %xmm6	# %sfp, ya$r
	movaps	%xmm6, %xmm13	# ya$r, D.5579
	mulss	%xmm11, %xmm13	# D.5579, D.5579
	mulss	%xmm9, %xmm6	# D.5579, D.5579
	addss	%xmm10, %xmm13	# scratch$0$r, D.5579
	addss	%xmm8, %xmm6	# scratch$0$i, D.5579
	addss	%xmm7, %xmm13	# D.5579, D.5579
	movaps	%xmm14, %xmm7	# yb$r, D.5579
	movss	16(%rsp), %xmm14	# %sfp, D.5579
	mulss	%xmm3, %xmm7	# D.5579, D.5579
	mulss	%xmm2, %xmm14	# D.5579, D.5579
	mulss	%xmm15, %xmm2	# yb$i, D.5579
	addss	%xmm7, %xmm6	# D.5579, D.5579
	movaps	%xmm14, %xmm7	# D.5579, D.5579
	movaps	%xmm5, %xmm14	# D.5579, D.5579
	addss	%xmm12, %xmm7	# D.5579, D.5579
	movss	16(%rsp), %xmm12	# %sfp, D.5579
	mulss	%xmm15, %xmm14	# yb$i, D.5579
	mulss	%xmm1, %xmm12	# D.5579, D.5579
	mulss	%xmm15, %xmm1	# yb$i, D.5579
	addss	%xmm14, %xmm12	# D.5579, D.5579
	movaps	%xmm13, %xmm14	# D.5579, D.5579
	subss	%xmm7, %xmm14	# D.5579, D.5579
	addss	%xmm13, %xmm7	# D.5579, D.5579
	movss	%xmm14, -8(%rsi)	# D.5579, MEM[base: Fout1_428, offset: 0B]
	movaps	%xmm6, %xmm14	# D.5579, D.5579
	subss	%xmm12, %xmm6	# D.5579, D.5579
	addss	%xmm12, %xmm14	# D.5579, D.5579
	movss	16(%rsp), %xmm12	# %sfp, ya$i
	mulss	%xmm12, %xmm0	# ya$i, D.5579
	movss	%xmm14, -4(%rsi)	# D.5579, MEM[base: Fout1_428, offset: 4B]
	mulss	%xmm12, %xmm5	# ya$i, D.5579
	movss	%xmm7, -8(%rcx)	# D.5579, MEM[base: Fout4_424, offset: 0B]
	movss	24(%rsp), %xmm7	# %sfp, yb$r
	movss	%xmm6, -4(%rcx)	# D.5579, MEM[base: Fout4_424, offset: 4B]
	movss	8(%rsp), %xmm6	# %sfp, ya$r
	mulss	%xmm7, %xmm11	# yb$r, D.5579
	subss	%xmm2, %xmm0	# D.5579, D.5579
	mulss	%xmm6, %xmm4	# ya$r, D.5579
	subss	%xmm5, %xmm1	# D.5579, D.5579
	mulss	%xmm7, %xmm9	# yb$r, D.5579
	mulss	%xmm6, %xmm3	# ya$r, D.5579
	addss	%xmm11, %xmm10	# D.5579, D.5579
	addss	%xmm9, %xmm8	# D.5579, D.5579
	addss	%xmm4, %xmm10	# D.5579, D.5579
	addss	%xmm3, %xmm8	# D.5579, D.5579
	movaps	%xmm10, %xmm2	# D.5579, D.5579
	subss	%xmm0, %xmm10	# D.5579, D.5579
	addss	%xmm0, %xmm2	# D.5579, D.5579
	movss	%xmm2, -8(%rdi)	# D.5579, MEM[base: Fout2_425, offset: 0B]
	movaps	%xmm8, %xmm2	# D.5579, D.5579
	subss	%xmm1, %xmm8	# D.5579, D.5579
	addss	%xmm1, %xmm2	# D.5579, D.5579
	movss	%xmm2, -4(%rdi)	# D.5579, MEM[base: Fout2_425, offset: 4B]
	movss	%xmm10, -8(%r8)	# D.5579, MEM[base: Fout3_427, offset: 0B]
	movss	%xmm8, -4(%r8)	# D.5579, MEM[base: Fout3_427, offset: 4B]
	cmpq	%r10, %rcx	# D.5577, Fout4
# SUCC: 11 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 12 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L71	#,
# BLOCK 12 freq:594 seq:10
# PRED: 11 [9.0%]  (FALLTHRU,CAN_FALLTHRU) 15 [9.0%]  (CAN_FALLTHRU) 24 [33.3%]  (CAN_FALLTHRU) 9 [9.0%]  (CAN_FALLTHRU) 38 [100.0%]  (CAN_FALLTHRU)
.L46:
	addq	$56, %rsp	#,
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
.L53:
	.cfi_restore_state
	movslq	36(%rsp), %r10	# %sfp, k
	leaq	264(%rbx), %rdi	#, tw3
	movl	4(%rbx), %r11d	# st_22(D)->inverse, D.5571
	movq	%rdi, %r9	# tw3, tw3
	movq	%rdi, %r8	# tw3, tw3
	leaq	0(,%r10,8), %rdx	#, D.5572
	leaq	(%r14,%rdx), %rsi	#, ivtmp.347
	leaq	(%rsi,%rdx), %rcx	#, ivtmp.350
	addq	%rcx, %rdx	# ivtmp.350, ivtmp.353
# SUCC: 16 [100.0%]  (CAN_FALLTHRU)
	jmp	.L70	#
# BLOCK 14 freq:1389 seq:12
# PRED: 16 [50.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L91:
	movaps	%xmm8, %xmm1	# D.5579, D.5579
	subss	%xmm0, %xmm1	# D.5579, D.5579
	addss	%xmm8, %xmm0	# D.5579, D.5579
	movss	%xmm1, (%rsi)	# D.5579, MEM[base: _74, offset: 0B]
	movaps	%xmm6, %xmm1	# D.5579, D.5579
	addss	%xmm7, %xmm1	# D.5579, D.5579
	subss	%xmm6, %xmm7	# D.5579, D.5579
	movss	%xmm1, 4(%rsi)	# D.5579, MEM[base: _74, offset: 4B]
	movss	%xmm0, (%rdx)	# D.5579, MEM[base: _79, offset: 0B]
# SUCC: 15 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	%xmm7, 4(%rdx)	# D.5579, MEM[base: _79, offset: 4B]
# BLOCK 15 freq:2778 seq:13
# PRED: 14 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 17 [100.0%]  (CAN_FALLTHRU)
.L69:
	addq	$8, %r14	#, Fout
	addq	$8, %rsi	#, ivtmp.347
	addq	$8, %rcx	#, ivtmp.350
	addq	$8, %rdx	#, ivtmp.353
	subq	$1, %r10	#, k
# SUCC: 16 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 12 [9.0%]  (CAN_FALLTHRU)
	je	.L46	#,
# BLOCK 16 freq:2778 seq:14
# PRED: 15 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 13 [100.0%]  (CAN_FALLTHRU)
.L70:
	movss	(%rsi), %xmm0	# MEM[base: _74, offset: 0B], D.5579
	addq	$8, %rdi	#, tw3
	addq	$16, %r8	#, tw3
	addq	$24, %r9	#, tw3
	movss	-8(%rdi), %xmm2	# MEM[base: tw3_154, offset: 0B], D.5579
	movss	4(%rsi), %xmm3	# MEM[base: _74, offset: 4B], D.5579
	movaps	%xmm0, %xmm6	# D.5579, D.5579
	movss	-4(%rdi), %xmm1	# MEM[base: tw3_154, offset: 4B], D.5579
	mulss	%xmm2, %xmm6	# D.5579, D.5579
	mulss	%xmm3, %xmm2	# D.5579, D.5579
	movaps	%xmm3, %xmm4	# D.5579, D.5579
	movss	(%rcx), %xmm5	# MEM[base: _76, offset: 0B], D.5579
	mulss	%xmm1, %xmm4	# D.5579, D.5579
	movss	-12(%r8), %xmm3	# MEM[base: tw3_167, offset: 4B], D.5579
	mulss	%xmm0, %xmm1	# D.5579, D.5579
	movaps	%xmm2, %xmm0	# D.5579, D.5579
	movaps	%xmm5, %xmm2	# D.5579, D.5579
	subss	%xmm4, %xmm6	# D.5579, D.5579
	movss	-16(%r8), %xmm4	# MEM[base: tw3_167, offset: 0B], D.5579
	addss	%xmm1, %xmm0	# D.5579, D.5579
	movss	4(%rcx), %xmm1	# MEM[base: _76, offset: 4B], D.5579
	mulss	%xmm4, %xmm2	# D.5579, D.5579
	movaps	%xmm1, %xmm7	# D.5579, D.5579
	mulss	%xmm3, %xmm7	# D.5579, D.5579
	mulss	%xmm4, %xmm1	# D.5579, D.5579
	movss	-20(%r9), %xmm4	# MEM[base: tw3_180, offset: 4B], D.5579
	mulss	%xmm5, %xmm3	# D.5579, D.5579
	subss	%xmm7, %xmm2	# D.5579, D.5579
	movaps	%xmm1, %xmm5	# D.5579, D.5579
	movss	-24(%r9), %xmm1	# MEM[base: tw3_180, offset: 0B], D.5579
	addss	%xmm3, %xmm5	# D.5579, D.5579
	movss	4(%rdx), %xmm3	# MEM[base: _79, offset: 4B], D.5579
	movaps	%xmm2, %xmm10	# D.5579, D.5579
	movss	(%rdx), %xmm2	# MEM[base: _79, offset: 0B], D.5579
	movaps	%xmm3, %xmm7	# D.5579, D.5579
	mulss	%xmm4, %xmm7	# D.5579, D.5579
	movaps	%xmm2, %xmm9	# D.5579, D.5579
	mulss	%xmm2, %xmm4	# D.5579, D.5579
	movss	(%r14), %xmm2	# MEM[base: Fout_151, offset: 0B], D.5579
	mulss	%xmm1, %xmm9	# D.5579, D.5579
	mulss	%xmm3, %xmm1	# D.5579, D.5579
	movaps	%xmm2, %xmm8	# D.5579, D.5579
	addss	%xmm10, %xmm2	# D.5579, D.5579
	subss	%xmm10, %xmm8	# D.5579, D.5579
	subss	%xmm7, %xmm9	# D.5579, D.5579
	addss	%xmm4, %xmm1	# D.5579, D.5579
	movss	%xmm2, (%r14)	# D.5579, MEM[base: Fout_151, offset: 0B]
	movaps	%xmm1, %xmm3	# D.5579, D.5579
	movss	4(%r14), %xmm1	# MEM[base: Fout_151, offset: 4B], D.5579
	movaps	%xmm3, %xmm4	# D.5579, D.5579
	movaps	%xmm1, %xmm7	# D.5579, D.5579
	addss	%xmm5, %xmm1	# D.5579, D.5579
	subss	%xmm5, %xmm7	# D.5579, D.5579
	movaps	%xmm9, %xmm5	# D.5579, D.5579
	addss	%xmm6, %xmm5	# D.5579, D.5579
	addss	%xmm0, %xmm4	# D.5579, D.5579
	movss	%xmm1, 4(%r14)	# D.5579, MEM[base: Fout_151, offset: 4B]
	subss	%xmm9, %xmm6	# D.5579, D.5579
	subss	%xmm5, %xmm2	# D.5579, D.5579
	subss	%xmm4, %xmm1	# D.5579, D.5579
	subss	%xmm3, %xmm0	# D.5579, D.5579
	movss	%xmm2, (%rcx)	# D.5579, MEM[base: _76, offset: 0B]
	movss	%xmm1, 4(%rcx)	# D.5579, MEM[base: _76, offset: 4B]
	addss	(%r14), %xmm5	# MEM[base: Fout_151, offset: 0B], D.5579
	addss	4(%r14), %xmm4	# MEM[base: Fout_151, offset: 4B], D.5579
	movss	%xmm5, (%r14)	# D.5579, MEM[base: Fout_151, offset: 0B]
	movss	%xmm4, 4(%r14)	# D.5579, MEM[base: Fout_151, offset: 4B]
	testl	%r11d, %r11d	# D.5571
# SUCC: 14 [50.0%]  (CAN_FALLTHRU) 17 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L91	#,
# BLOCK 17 freq:1389 seq:15
# PRED: 16 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	movaps	%xmm0, %xmm1	# D.5579, D.5579
	addss	%xmm8, %xmm1	# D.5579, D.5579
	subss	%xmm0, %xmm8	# D.5579, D.5579
	movss	%xmm1, (%rsi)	# D.5579, MEM[base: _74, offset: 0B]
	movaps	%xmm7, %xmm1	# D.5579, D.5579
	addss	%xmm6, %xmm7	# D.5579, D.5579
	subss	%xmm6, %xmm1	# D.5579, D.5579
	movss	%xmm1, 4(%rsi)	# D.5579, MEM[base: _74, offset: 4B]
	movss	%xmm8, (%rdx)	# D.5579, MEM[base: _79, offset: 0B]
	movss	%xmm7, 4(%rdx)	# D.5579, MEM[base: _79, offset: 4B]
# SUCC: 15 [100.0%]  (CAN_FALLTHRU)
	jmp	.L69	#
# BLOCK 18 freq:375 seq:16
# PRED: 6 [37.5%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L90:
	cmpl	$2, 32(%rsp)	#, %sfp
# SUCC: 19 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 35 [33.3%]  (CAN_FALLTHRU)
	jne	.L49	#,
# BLOCK 19 freq:250 seq:17
# PRED: 18 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movslq	36(%rsp), %rsi	# %sfp,
	leaq	32(%r14), %r10	#, D.5577
	leaq	264(%rbx), %rcx	#, tw1
	leaq	296(%rbx), %r11	#, D.5583
	movq	%rsi, %rax	#,
	salq	$3, %rsi	#, D.5572
	leaq	32(%rsi), %r8	#, D.5575
	movl	%eax, %r9d	# m, D.5573
	leaq	(%r14,%rsi), %rdx	#, Fout2
	testq	%r8, %r8	# D.5575
	setle	%bpl	#, tmp482
	cmpl	$5, %eax	#, m
	seta	%r12b	#, D.5574
	cmpq	%rcx, %r10	# tw1, D.5577
	setbe	%sil	#, D.5574
	cmpq	%r11, %r14	# D.5583, Fout
	setnb	%dil	#, D.5574
	orl	%edi, %esi	# D.5574, D.5574
	andl	%r12d, %esi	# D.5574, D.5574
	cmpq	%r10, %rdx	# D.5577, Fout2
	setnb	%dil	#, D.5574
	orl	%ebp, %edi	# tmp482, D.5574
	testb	%dil, %sil	# D.5574, D.5574
# SUCC: 36 [10.0%]  (CAN_FALLTHRU) 20 [90.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L57	#,
# BLOCK 20 freq:225 seq:18
# PRED: 19 [90.0%]  (FALLTHRU,CAN_FALLTHRU)
	leaq	(%r14,%r8), %rsi	#, D.5577
	cmpq	%rsi, %rcx	# D.5577, tw1
	setnb	%dil	#, D.5574
	cmpq	%r11, %rdx	# D.5583, Fout2
	setnb	%sil	#, D.5574
	orb	%sil, %dil	# D.5574, tmp725
# SUCC: 36 [11.1%]  (CAN_FALLTHRU) 21 [88.9%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L57	#,
# BLOCK 21 freq:200 seq:19
# PRED: 20 [88.9%]  (FALLTHRU,CAN_FALLTHRU)
	leal	-5(%rax), %r8d	#, D.5573
	leal	-1(%rax), %esi	#,
	shrl	$2, %r8d	#, D.5573
	addl	$1, %r8d	#, bnd.228
	leal	0(,%r8,4), %r11d	#, ratio_mult_vf.229
	cmpl	$3, %esi	#, D.5573
# SUCC: 22 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 26 [33.3%]  (CAN_FALLTHRU)
	jbe	.L58	#,
# BLOCK 22 freq:133 seq:20
# PRED: 21 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%r14, %rdi	# Fout, ivtmp.299
	xorl	%esi, %esi	# ivtmp.298
# SUCC: 23 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	xorl	%r10d, %r10d	# ivtmp.294
# BLOCK 23 freq:267 seq:21
# PRED: 22 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 23 [50.0%]  (DFS_BACK,CAN_FALLTHRU)
.L59:
	movups	(%rdx,%rsi), %xmm3	# MEM[base: Fout2_52, index: ivtmp.298_53, offset: 0B], tmp505
	addl	$1, %r10d	#, ivtmp.294
	addq	$32, %rdi	#, ivtmp.299
	movups	16(%rdx,%rsi), %xmm0	# MEM[base: Fout2_52, index: ivtmp.298_53, offset: 16B], tmp506
	movaps	%xmm3, %xmm2	# tmp505, D.5582
	movups	280(%rbx,%rsi), %xmm1	# MEM[base: st_22(D), index: ivtmp.298_53, offset: 280B], tmp508
	shufps	$136, %xmm0, %xmm2	#, tmp506, D.5582
	shufps	$221, %xmm0, %xmm3	#, tmp506, D.5582
	movups	264(%rbx,%rsi), %xmm0	# MEM[base: st_22(D), index: ivtmp.298_53, offset: 264B], tmp507
	movaps	%xmm0, %xmm4	# tmp507, D.5582
	shufps	$221, %xmm1, %xmm0	#, tmp508, D.5582
	shufps	$136, %xmm1, %xmm4	#, tmp508, D.5582
	movaps	%xmm0, %xmm1	# D.5582, D.5582
	movaps	%xmm4, %xmm0	# D.5582, vect__57.242
	mulps	%xmm2, %xmm0	# D.5582, vect__57.242
	movaps	%xmm1, %xmm5	# D.5582, vect__60.243
	mulps	%xmm3, %xmm5	# D.5582, vect__60.243
	mulps	%xmm1, %xmm2	# D.5582, vect__62.245
	mulps	%xmm4, %xmm3	# D.5582, vect__63.246
	subps	%xmm5, %xmm0	# vect__60.243, vect__61.244
	movups	-16(%rdi), %xmm5	# MEM[base: _54, offset: 16B], tmp514
	addps	%xmm2, %xmm3	# vect__62.245, vect__64.247
	movups	-32(%rdi), %xmm2	# MEM[base: _54, offset: 0B], tmp513
	movaps	%xmm2, %xmm4	# tmp513, D.5582
	shufps	$221, %xmm5, %xmm2	#, tmp514, D.5582
	movaps	%xmm3, %xmm1	# vect__64.247, vect__64.247
	shufps	$136, %xmm5, %xmm4	#, tmp514, D.5582
	movaps	%xmm4, %xmm3	# D.5582, vect__69.252
	movaps	%xmm2, %xmm5	# D.5582, vect__71.257
	subps	%xmm0, %xmm3	# vect__61.244, vect__69.252
	addps	%xmm4, %xmm0	# D.5582, vect__73.260
	subps	%xmm1, %xmm5	# vect__64.247, vect__71.257
	addps	%xmm2, %xmm1	# D.5582, vect__75.261
	movaps	%xmm3, %xmm6	# vect__69.252, D.5582
	movaps	%xmm0, %xmm2	# vect__73.260, D.5582
	unpcklps	%xmm5, %xmm6	# vect__71.257, D.5582
	unpckhps	%xmm5, %xmm3	# vect__71.257, D.5582
	movups	%xmm6, (%rdx,%rsi)	# D.5582, MEM[base: Fout2_52, index: ivtmp.298_53, offset: 0B]
	movups	%xmm3, 16(%rdx,%rsi)	# D.5582, MEM[base: Fout2_52, index: ivtmp.298_53, offset: 16B]
	unpcklps	%xmm1, %xmm2	# vect__75.261, D.5582
	unpckhps	%xmm1, %xmm0	# vect__75.261, D.5582
	addq	$32, %rsi	#, ivtmp.298
	movups	%xmm2, -32(%rdi)	# D.5582, MEM[base: _54, offset: 0B]
	movups	%xmm0, -16(%rdi)	# D.5582, MEM[base: _54, offset: 16B]
	cmpl	%r8d, %r10d	# bnd.228, ivtmp.294
# SUCC: 23 [50.0%]  (DFS_BACK,CAN_FALLTHRU) 24 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	jb	.L59	#,
# BLOCK 24 freq:133 seq:22
# PRED: 23 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	subl	%r11d, 36(%rsp)	# ratio_mult_vf.229, %sfp
	movl	%r11d, %esi	# ratio_mult_vf.229, D.5575
	salq	$3, %rsi	#, D.5575
	movl	36(%rsp), %eax	# %sfp, m
	addq	%rsi, %r14	# D.5575, Fout
	addq	%rsi, %rdx	# D.5575, Fout2
	addq	%rsi, %rcx	# D.5575, tw1
	cmpl	%r11d, %r9d	# ratio_mult_vf.229, D.5573
# SUCC: 25 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 12 [33.3%]  (CAN_FALLTHRU)
	je	.L46	#,
# BLOCK 25 freq:89 seq:23
# PRED: 24 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
# SUCC: 26 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	leal	-1(%rax), %esi	#,
# BLOCK 26 freq:156 seq:24
# PRED: 25 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 21 [33.3%]  (CAN_FALLTHRU)
.L58:
# SUCC: 27 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	leaq	8(%rcx,%rsi,8), %rsi	#, D.5577
# BLOCK 27 freq:624 seq:25
# PRED: 27 [75.0%]  (DFS_BACK,CAN_FALLTHRU) 26 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
.L61:
	movss	(%rcx), %xmm3	# MEM[base: tw1_770, offset: 0B], D.5579
	addq	$8, %rcx	#, tw1
	addq	$8, %rdx	#, Fout2
	addq	$8, %r14	#, Fout
	movss	-4(%rcx), %xmm0	# MEM[base: tw1_770, offset: 4B], D.5579
	movss	-8(%rdx), %xmm1	# MEM[base: Fout2_771, offset: 0B], D.5579
	movaps	%xmm3, %xmm2	# D.5579, D.5579
	movss	-4(%rdx), %xmm4	# MEM[base: Fout2_771, offset: 4B], D.5579
	movaps	%xmm0, %xmm5	# D.5579, D.5579
	mulss	%xmm1, %xmm2	# D.5579, D.5579
	mulss	%xmm4, %xmm5	# D.5579, D.5579
	mulss	%xmm4, %xmm3	# D.5579, D.5579
	mulss	%xmm0, %xmm1	# D.5579, D.5579
	subss	%xmm5, %xmm2	# D.5579, D.5579
	movaps	%xmm3, %xmm0	# D.5579, D.5579
	addss	%xmm1, %xmm0	# D.5579, D.5579
	movss	-8(%r14), %xmm1	# MEM[base: Fout_773, offset: 0B], MEM[base: Fout_773, offset: 0B]
	subss	%xmm2, %xmm1	# D.5579, D.5579
	movss	%xmm1, -8(%rdx)	# D.5579, MEM[base: Fout2_771, offset: 0B]
	movss	-4(%r14), %xmm1	# MEM[base: Fout_773, offset: 4B], MEM[base: Fout_773, offset: 4B]
	subss	%xmm0, %xmm1	# D.5579, D.5579
	movss	%xmm1, -4(%rdx)	# D.5579, MEM[base: Fout2_771, offset: 4B]
	addss	-8(%r14), %xmm2	# MEM[base: Fout_773, offset: 0B], D.5579
	addss	-4(%r14), %xmm0	# MEM[base: Fout_773, offset: 4B], D.5579
	movss	%xmm2, -8(%r14)	# D.5579, MEM[base: Fout_773, offset: 0B]
	movss	%xmm0, -4(%r14)	# D.5579, MEM[base: Fout_773, offset: 4B]
	cmpq	%rsi, %rcx	# D.5577, tw1
# SUCC: 27 [75.0%]  (DFS_BACK,CAN_FALLTHRU) 28 [25.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L61	#,
# BLOCK 28 freq:156 seq:26
# PRED: 27 [25.0%]  (FALLTHRU,CAN_FALLTHRU)
	addq	$56, %rsp	#,
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
# BLOCK 29 freq:350 seq:27
# PRED: 2 [28.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L89:
	.cfi_restore_state
	salq	$3, %rbp	#, D.5572
# SUCC: 30 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%r14, %rdx	# Fout, Fout
# BLOCK 30 freq:3889 seq:28
# PRED: 29 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 30 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L48:
	movq	(%r15), %rax	# MEM[base: f_10, offset: 0B], MEM[base: f_10, offset: 0B]
	addq	$8, %rdx	#, Fout
	addq	%rbp, %r15	# D.5572, f
	movq	%rax, -8(%rdx)	# MEM[base: f_10, offset: 0B], MEM[base: Fout_11, offset: 0B]
	cmpq	%rdx, %r12	# Fout, Fout_end
# SUCC: 30 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 31 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L48	#,
# BLOCK 31 freq:350 seq:29
# PRED: 30 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	cmpl	$3, 32(%rsp)	#, %sfp
# SUCC: 32 [20.0%]  (FALLTHRU,CAN_FALLTHRU) 6 [80.0%]  (CAN_FALLTHRU)
	jne	.L92	#,
# BLOCK 32 freq:250 seq:30
# PRED: 5 [20.0%]  (CAN_FALLTHRU) 31 [20.0%]  (FALLTHRU,CAN_FALLTHRU)
.L50:
	movslq	36(%rsp), %rdi	# %sfp, m
	movsd	.LC1(%rip), %xmm6	#, tmp666
	leaq	0(,%rdi,8), %rcx	#, D.5572
	movss	268(%rbx,%rdi,8), %xmm7	# MEM[(struct  *)_81 + 4B], epi3$i
	addq	$264, %rbx	#, tw2
	leaq	(%r14,%rcx), %rdx	#, ivtmp.324
	movq	%rbx, %rsi	# tw2, tw2
# SUCC: 33 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	addq	%rdx, %rcx	# ivtmp.324, ivtmp.327
# BLOCK 33 freq:2778 seq:31
# PRED: 32 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 33 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L66:
	movss	(%rdx), %xmm1	# MEM[base: _676, offset: 0B], D.5579
	addq	$8, %rbx	#, tw2
	addq	$16, %rsi	#, tw2
	addq	$8, %r14	#, Fout
	movss	-8(%rbx), %xmm3	# MEM[base: tw2_88, offset: 0B], D.5579
	pxor	%xmm15, %xmm15	# tmp777
	addq	$8, %rdx	#, ivtmp.324
	addq	$8, %rcx	#, ivtmp.327
	movss	-4(%rdx), %xmm4	# MEM[base: _676, offset: 4B], D.5579
	movaps	%xmm1, %xmm0	# D.5579, D.5579
	movss	-4(%rbx), %xmm2	# MEM[base: tw2_88, offset: 4B], D.5579
	mulss	%xmm3, %xmm0	# D.5579, D.5579
	mulss	%xmm4, %xmm3	# D.5579, D.5579
	movaps	%xmm4, %xmm5	# D.5579, D.5579
	movss	-4(%rcx), %xmm8	# MEM[base: _668, offset: 4B], D.5579
	mulss	%xmm2, %xmm5	# D.5579, D.5579
	movss	-16(%rsi), %xmm4	# MEM[base: tw2_101, offset: 0B], D.5579
	mulss	%xmm1, %xmm2	# D.5579, D.5579
	movaps	%xmm8, %xmm9	# D.5579, D.5579
	movaps	%xmm3, %xmm1	# D.5579, D.5579
	movss	-12(%rsi), %xmm3	# MEM[base: tw2_101, offset: 4B], D.5579
	subss	%xmm5, %xmm0	# D.5579, D.5579
	addss	%xmm2, %xmm1	# D.5579, D.5579
	movss	-8(%rcx), %xmm2	# MEM[base: _668, offset: 0B], D.5579
	mulss	%xmm3, %xmm9	# D.5579, D.5579
	mulss	%xmm2, %xmm3	# D.5579, D.5579
	movaps	%xmm2, %xmm5	# D.5579, D.5579
	mulss	%xmm4, %xmm5	# D.5579, D.5579
	mulss	%xmm8, %xmm4	# D.5579, D.5579
	pxor	%xmm8, %xmm8	# D.5580
	cvtss2sd	-8(%r14), %xmm8	# MEM[base: Fout_85, offset: 0B], D.5580
	subss	%xmm9, %xmm5	# D.5579, D.5579
	pxor	%xmm9, %xmm9	# D.5580
	addss	%xmm3, %xmm4	# D.5579, D.5579
	movaps	%xmm5, %xmm3	# D.5579, D.5579
	addss	%xmm0, %xmm3	# D.5579, D.5579
	movaps	%xmm4, %xmm2	# D.5579, D.5579
	addss	%xmm1, %xmm4	# D.5579, D.5579
	subss	%xmm2, %xmm1	# D.5579, D.5579
	cvtss2sd	%xmm3, %xmm9	# D.5579, D.5580
	mulsd	%xmm6, %xmm9	# tmp666, D.5580
	subss	%xmm5, %xmm0	# D.5579, D.5579
	mulss	%xmm7, %xmm1	# epi3$i, D.5579
	mulss	%xmm7, %xmm0	# epi3$i, D.5579
	subsd	%xmm9, %xmm8	# D.5580, D.5580
	pxor	%xmm9, %xmm9	# D.5580
	cvtss2sd	%xmm4, %xmm9	# D.5579, D.5580
	mulsd	%xmm6, %xmm9	# tmp666, D.5580
	cvtsd2ss	%xmm8, %xmm15	# D.5580, tmp777
	movss	%xmm15, -8(%rdx)	# tmp777, MEM[base: _676, offset: 0B]
	pxor	%xmm8, %xmm8	# D.5580
	pxor	%xmm15, %xmm15	# tmp778
	cvtss2sd	-4(%r14), %xmm8	# MEM[base: Fout_85, offset: 4B], D.5580
	subsd	%xmm9, %xmm8	# D.5580, D.5580
	cvtsd2ss	%xmm8, %xmm15	# D.5580, tmp778
	movss	%xmm15, -4(%rdx)	# tmp778, MEM[base: _676, offset: 4B]
	addss	-8(%r14), %xmm3	# MEM[base: Fout_85, offset: 0B], D.5579
	addss	-4(%r14), %xmm4	# MEM[base: Fout_85, offset: 4B], D.5579
	movss	%xmm3, -8(%r14)	# D.5579, MEM[base: Fout_85, offset: 0B]
	movss	%xmm4, -4(%r14)	# D.5579, MEM[base: Fout_85, offset: 4B]
	movss	-8(%rdx), %xmm2	# MEM[base: _676, offset: 0B], D.5579
	addss	%xmm1, %xmm2	# D.5579, D.5579
	movss	%xmm2, -8(%rcx)	# D.5579, MEM[base: _668, offset: 0B]
	movss	-4(%rdx), %xmm2	# MEM[base: _676, offset: 4B], MEM[base: _676, offset: 4B]
	subss	%xmm0, %xmm2	# D.5579, D.5579
	movss	%xmm2, -4(%rcx)	# D.5579, MEM[base: _668, offset: 4B]
	movss	-8(%rdx), %xmm2	# MEM[base: _676, offset: 0B], MEM[base: _676, offset: 0B]
	addss	-4(%rdx), %xmm0	# MEM[base: _676, offset: 4B], D.5579
	subss	%xmm1, %xmm2	# D.5579, D.5579
	movss	%xmm0, -4(%rdx)	# D.5579, MEM[base: _676, offset: 4B]
	movss	%xmm2, -8(%rdx)	# D.5579, MEM[base: _676, offset: 0B]
	subq	$1, %rdi	#, m
# SUCC: 33 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 34 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L66	#,
# BLOCK 34 freq:250 seq:32
# PRED: 33 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	addq	$56, %rsp	#,
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
# BLOCK 35 freq:250 seq:33
# PRED: 18 [33.3%]  (CAN_FALLTHRU) 8 [33.3%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L49:
	.cfi_restore_state
	movl	32(%rsp), %r8d	# %sfp,
	movq	%rbx, %rdx	# st,
	movq	%r14, %rdi	# Fout,
	movl	$1, %esi	#,
	movl	36(%rsp), %ecx	# %sfp,
	addq	$56, %rsp	#,
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
# BLOCK 36 freq:50 seq:34
# PRED: 20 [11.1%]  (CAN_FALLTHRU) 19 [10.0%]  (CAN_FALLTHRU)
.L57:
	.cfi_restore_state
	movl	36(%rsp), %eax	# %sfp, m
	leal	-1(%rax), %esi	#, D.5575
# SUCC: 37 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	leaq	8(%rcx,%rsi,8), %rsi	#, D.5577
# BLOCK 37 freq:556 seq:35
# PRED: 36 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 37 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L64:
	movss	(%rcx), %xmm3	# MEM[base: tw1_808, offset: 0B], D.5579
	addq	$8, %rcx	#, tw1
	addq	$8, %rdx	#, Fout2
	addq	$8, %r14	#, Fout
	movss	-4(%rcx), %xmm0	# MEM[base: tw1_808, offset: 4B], D.5579
	movss	-8(%rdx), %xmm1	# MEM[base: Fout2_809, offset: 0B], D.5579
	movaps	%xmm3, %xmm2	# D.5579, D.5579
	movss	-4(%rdx), %xmm4	# MEM[base: Fout2_809, offset: 4B], D.5579
	movaps	%xmm0, %xmm5	# D.5579, D.5579
	mulss	%xmm1, %xmm2	# D.5579, D.5579
	mulss	%xmm4, %xmm5	# D.5579, D.5579
	mulss	%xmm4, %xmm3	# D.5579, D.5579
	mulss	%xmm0, %xmm1	# D.5579, D.5579
	subss	%xmm5, %xmm2	# D.5579, D.5579
	movaps	%xmm3, %xmm0	# D.5579, D.5579
	addss	%xmm1, %xmm0	# D.5579, D.5579
	movss	-8(%r14), %xmm1	# MEM[base: Fout_811, offset: 0B], MEM[base: Fout_811, offset: 0B]
	subss	%xmm2, %xmm1	# D.5579, D.5579
	movss	%xmm1, -8(%rdx)	# D.5579, MEM[base: Fout2_809, offset: 0B]
	movss	-4(%r14), %xmm1	# MEM[base: Fout_811, offset: 4B], MEM[base: Fout_811, offset: 4B]
	subss	%xmm0, %xmm1	# D.5579, D.5579
	movss	%xmm1, -4(%rdx)	# D.5579, MEM[base: Fout2_809, offset: 4B]
	addss	-8(%r14), %xmm2	# MEM[base: Fout_811, offset: 0B], D.5579
	addss	-4(%r14), %xmm0	# MEM[base: Fout_811, offset: 4B], D.5579
	movss	%xmm2, -8(%r14)	# D.5579, MEM[base: Fout_811, offset: 0B]
	movss	%xmm0, -4(%r14)	# D.5579, MEM[base: Fout_811, offset: 4B]
	cmpq	%rsi, %rcx	# D.5577, tw1
# SUCC: 37 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 38 [9.0%]  (FALLTHRU)
	jne	.L64	#,
# BLOCK 38 freq:50 seq:36
# PRED: 37 [9.0%]  (FALLTHRU)
# SUCC: 12 [100.0%]  (CAN_FALLTHRU)
	jmp	.L46	#
	.cfi_endproc
.LFE58:
	.size	kf_work.constprop.1, .-kf_work.constprop.1
	.section	.text.unlikely
.LCOLDE3:
	.text
.LHOTE3:
	.section	.text.unlikely
.LCOLDB11:
	.text
.LHOTB11:
	.p2align 4,,15
	.globl	kiss_fft_alloc
	.type	kiss_fft_alloc, @function
kiss_fft_alloc:
.LFB52:
	.cfi_startproc
# BLOCK 2 freq:501 seq:0
# PRED: ENTRY [100.0%]  (FALLTHRU)
	leal	-1(%rdi), %eax	#, D.5615
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
	leaq	272(,%rax,8), %rdi	#, memneeded
	subq	$40, %rsp	#,
	.cfi_def_cfa_offset 96
	testq	%rcx, %rcx	# lenmem
# SUCC: 26 [6.7%]  (CAN_FALLTHRU) 3 [93.3%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L125	#,
# BLOCK 3 freq:468 seq:1
# PRED: 2 [93.3%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rdx, %rbp	# mem, mem
	testq	%rdx, %rdx	# mem
# SUCC: 4 [85.0%]  (FALLTHRU,CAN_FALLTHRU) 5 [15.0%]  (CAN_FALLTHRU)
	je	.L96	#,
# BLOCK 4 freq:397 seq:2
# PRED: 3 [85.0%]  (FALLTHRU,CAN_FALLTHRU)
	cmpq	(%rcx), %rdi	# *lenmem_13(D), memneeded
	movl	$0, %eax	#, tmp169
# SUCC: 5 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	cmova	%rax, %rbp	# mem,, tmp169, mem
# BLOCK 5 freq:468 seq:3
# PRED: 3 [15.0%]  (CAN_FALLTHRU) 4 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
.L96:
# SUCC: 6 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rdi, (%rcx)	# memneeded, *lenmem_13(D)
# BLOCK 6 freq:501 seq:4
# PRED: 5 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 26 [100.0%]  (CAN_FALLTHRU)
.L95:
	testq	%rbp, %rbp	# mem
# SUCC: 7 [89.9%]  (FALLTHRU,CAN_FALLTHRU) 23 [10.1%]  (CAN_FALLTHRU)
	je	.L121	#,
# BLOCK 7 freq:451 seq:5
# PRED: 6 [89.9%]  (FALLTHRU,CAN_FALLTHRU)
	movl	%ebx, 0(%rbp)	# nfft, MEM[(struct kiss_fft_state *)mem_2].nfft
	movl	%esi, 4(%rbp)	# inverse_fft, MEM[(struct kiss_fft_state *)mem_2].inverse
	testl	%ebx, %ebx	# nfft
# SUCC: 8 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 25 [9.0%]  (CAN_FALLTHRU)
	jle	.L126	#,
# BLOCK 8 freq:410 seq:6
# PRED: 7 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	pxor	%xmm3, %xmm3	# D.5617
	cvtsi2sd	%ebx, %xmm3	# nfft, D.5617
	xorl	%r14d, %r14d	# i
	movsd	.LC8(%rip), %xmm0	#, tmp145
	leaq	264(%rbp), %r15	#, ivtmp.408
	leaq	24(%rsp), %r13	#, tmp167
	leaq	16(%rsp), %r12	#, tmp165
	divsd	%xmm3, %xmm0	# D.5617, D.5617
	movsd	%xmm3, 8(%rsp)	# D.5617, %sfp
	mulsd	.LC9(%rip), %xmm0	#, D.5617
	movsd	%xmm0, (%rsp)	# D.5617, %sfp
	testl	%esi, %esi	# inverse_fft
# SUCC: 9 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 19 [50.0%]  (CAN_FALLTHRU)
	jne	.L104	#,
# BLOCK 9 freq:2278 seq:7
# PRED: 8 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 9 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L102:
	pxor	%xmm0, %xmm0	# D.5617
	movq	%r12, %rsi	# tmp165,
	movq	%r13, %rdi	# tmp167,
	addq	$8, %r15	#, ivtmp.408
	cvtsi2sd	%r14d, %xmm0	# i, D.5617
	addl	$1, %r14d	#, i
	mulsd	(%rsp), %xmm0	# %sfp, phase
	call	sincos	#
	movsd	24(%rsp), %xmm0	#, D.5613
	pxor	%xmm4, %xmm4	# tmp180
	pxor	%xmm5, %xmm5	# tmp181
	cvtsd2ss	16(%rsp), %xmm4	#, tmp180
	movss	%xmm4, -8(%r15)	# tmp180, MEM[base: _59, offset: 0B]
	cvtsd2ss	%xmm0, %xmm5	# D.5613, tmp181
	movss	%xmm5, -4(%r15)	# tmp181, MEM[base: _59, offset: 4B]
	cmpl	%ebx, %r14d	# nfft, i
# SUCC: 9 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 10 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L102	#,
# BLOCK 10 freq:451 seq:8
# PRED: 20 [100.0%]  (CAN_FALLTHRU) 9 [9.0%]  (FALLTHRU,CAN_FALLTHRU) 25 [100.0%]  (CAN_FALLTHRU)
.L103:
	movsd	.LC7(%rip), %xmm0	#, tmp142
	sqrtsd	8(%rsp), %xmm1	# %sfp, D.5617
	movsd	.LC6(%rip), %xmm2	#, tmp138
	leaq	8(%rbp), %rsi	#, facbuf
	andpd	%xmm1, %xmm0	# D.5617, tmp140
	comisd	%xmm0, %xmm2	# tmp140, tmp138
# SUCC: 11 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 24 [50.0%]  (CAN_FALLTHRU)
	ja	.L127	#,
# BLOCK 11 freq:452 seq:9
# PRED: 10 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 24 [100.0%]  (CAN_FALLTHRU)
.L99:
	movl	$4, %ecx	#, nfft
# SUCC: 12 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
# BLOCK 12 freq:5450 seq:10
# PRED: 11 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 18 [100.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L100:
	movl	%ebx, %eax	# nfft, tmp161
	cltd
	idivl	%ecx	# nfft
	testl	%edx, %edx	# D.5615
# SUCC: 15 [50.0%]  (CAN_FALLTHRU) 13 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L110	#,
# BLOCK 13 freq:5000 seq:11
# PRED: 12 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 14 [50.0%]  (CAN_FALLTHRU)
.L128:
	movl	%eax, %ebx	# tmp161, nfft
	movl	%ecx, (%rsi)	# nfft, *facbuf_48
	leaq	8(%rsi), %rax	#, facbuf
	movl	%ebx, 4(%rsi)	# nfft, MEM[(int *)facbuf_48 + 4B]
	cmpl	$1, %ebx	#, nfft
# SUCC: 14 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 23 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT)
	jle	.L121	#,
# BLOCK 14 freq:4550 seq:12
# PRED: 13 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rax, %rsi	# facbuf, facbuf
	movl	%ebx, %eax	# nfft, tmp161
	cltd
	idivl	%ecx	# nfft
	testl	%edx, %edx	# D.5615
# SUCC: 15 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 13 [50.0%]  (CAN_FALLTHRU)
	je	.L128	#,
# BLOCK 15 freq:5000 seq:13
# PRED: 12 [50.0%]  (CAN_FALLTHRU) 14 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
.L110:
	cmpl	$2, %ecx	#, nfft
# SUCC: 21 [33.3%]  (CAN_FALLTHRU) 16 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L106	#,
# BLOCK 16 freq:3334 seq:14
# PRED: 15 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	cmpl	$4, %ecx	#, nfft
# SUCC: 17 [50.0%]  (FALLTHRU,CAN_FALLTHRU) 22 [50.0%]  (CAN_FALLTHRU)
	jne	.L129	#,
# BLOCK 17 freq:1667 seq:15
# PRED: 16 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	movsd	.LC4(%rip), %xmm0	#, D.5617
# SUCC: 18 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movl	$2, %ecx	#, nfft
# BLOCK 18 freq:4999 seq:16
# PRED: 17 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 21 [100.0%]  (CAN_FALLTHRU) 22 [100.0%]  (CAN_FALLTHRU)
.L107:
	comisd	%xmm1, %xmm0	# D.5617, D.5617
	cmova	%ebx, %ecx	# nfft,, nfft, nfft
# SUCC: 12 [100.0%]  (DFS_BACK,CAN_FALLTHRU)
	jmp	.L100	#
# BLOCK 19 freq:2278 seq:17
# PRED: 8 [50.0%]  (CAN_FALLTHRU) 19 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L104:
	pxor	%xmm0, %xmm0	# D.5617
	movq	%r12, %rsi	# tmp165,
	movq	%r13, %rdi	# tmp167,
	addq	$8, %r15	#, ivtmp.415
	cvtsi2sd	%r14d, %xmm0	# i, D.5617
	addl	$1, %r14d	#, i
	mulsd	(%rsp), %xmm0	# %sfp, phase
	xorpd	.LC10(%rip), %xmm0	#, phase
	call	sincos	#
	movsd	24(%rsp), %xmm0	#, D.5613
	pxor	%xmm7, %xmm7	# tmp184
	pxor	%xmm2, %xmm2	# tmp185
	cvtsd2ss	16(%rsp), %xmm7	#, tmp184
	movss	%xmm7, -8(%r15)	# tmp184, MEM[base: _77, offset: 0B]
	cvtsd2ss	%xmm0, %xmm2	# D.5613, tmp185
	movss	%xmm2, -4(%r15)	# tmp185, MEM[base: _77, offset: 4B]
	cmpl	%ebx, %r14d	# nfft, i
# SUCC: 19 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 20 [9.0%]  (FALLTHRU)
	jne	.L104	#,
# BLOCK 20 freq:205 seq:18
# PRED: 19 [9.0%]  (FALLTHRU)
# SUCC: 10 [100.0%]  (CAN_FALLTHRU)
	jmp	.L103	#
# BLOCK 21 freq:1667 seq:19
# PRED: 15 [33.3%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L106:
	movsd	.LC5(%rip), %xmm0	#, D.5617
	movl	$3, %ecx	#, nfft
# SUCC: 18 [100.0%]  (CAN_FALLTHRU)
	jmp	.L107	#
# BLOCK 22 freq:1666 seq:20
# PRED: 16 [50.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L129:
	addl	$2, %ecx	#, nfft
	pxor	%xmm0, %xmm0	# D.5617
	cvtsi2sd	%ecx, %xmm0	# nfft, D.5617
# SUCC: 18 [100.0%]  (CAN_FALLTHRU)
	jmp	.L107	#
# BLOCK 23 freq:501 seq:21
# PRED: 13 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT) 6 [10.1%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L121:
	addq	$40, %rsp	#,
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
.L127:
	.cfi_restore_state
	cvttsd2siq	%xmm1, %rax	# D.5617, tmp143
	pxor	%xmm1, %xmm1	# D.5617
	cvtsi2sdq	%rax, %xmm1	# tmp143, D.5617
# SUCC: 11 [100.0%]  (CAN_FALLTHRU)
	jmp	.L99	#
# BLOCK 25 freq:41 seq:23
# PRED: 7 [9.0%]  (CAN_FALLTHRU)
.L126:
	pxor	%xmm5, %xmm5	# D.5617
	cvtsi2sd	%ebx, %xmm5	# nfft, D.5617
	movsd	%xmm5, 8(%rsp)	# D.5617, %sfp
# SUCC: 10 [100.0%]  (CAN_FALLTHRU)
	jmp	.L103	#
# BLOCK 26 freq:34 seq:24
# PRED: 2 [6.7%]  (CAN_FALLTHRU)
.L125:
	movl	%esi, (%rsp)	# inverse_fft, %sfp
	call	malloc	#
	movl	(%rsp), %esi	# %sfp, inverse_fft
	movq	%rax, %rbp	#, mem
# SUCC: 6 [100.0%]  (CAN_FALLTHRU)
	jmp	.L95	#
	.cfi_endproc
.LFE52:
	.size	kiss_fft_alloc, .-kiss_fft_alloc
	.section	.text.unlikely
.LCOLDE11:
	.text
.LHOTE11:
	.section	.text.unlikely
.LCOLDB12:
	.text
.LHOTB12:
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
	je	.L133	#,
# BLOCK 3 freq:8986 seq:1
# PRED: 2 [89.9%]  (FALLTHRU,CAN_FALLTHRU)
	leaq	8(%r8), %rcx	#, D.5644
# SUCC: EXIT [100.0%]  (ABNORMAL,SIBCALL)
	jmp	kf_work.constprop.1	#
# BLOCK 4 freq:1014 seq:2
# PRED: 2 [10.1%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L133:
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
	movslq	(%r8), %rdi	# st_4(D)->nfft, D.5646
	salq	$3, %rdi	#, D.5646
	call	malloc	#
	leaq	8(%rbx), %rcx	#, D.5644
	movq	%rbx, %r8	# st,
	movl	%r12d, %edx	# in_stride,
	movq	%rbp, %rsi	# fin,
	movq	%rax, %rdi	# tmp99,
	movq	%rax, %r13	#, tmp99
	call	kf_work.constprop.1	#
	movslq	(%rbx), %rdx	# st_4(D)->nfft, D.5646
	movq	%rbp, %rdi	# fin,
	movq	%r13, %rsi	# tmp99,
	salq	$3, %rdx	#, D.5646
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
.LCOLDE12:
	.text
.LHOTE12:
	.section	.text.unlikely
.LCOLDB13:
	.text
.LHOTB13:
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
	movq	%rdx, %r15	# fout, fout
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %r14	# fin, fin
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
	movq	%rdi, %rbx	# cfg, cfg
	subq	$40, %rsp	#,
	.cfi_def_cfa_offset 96
	cmpq	%rdx, %rsi	# fout, fin
# SUCC: 37 [10.1%]  (CAN_FALLTHRU) 3 [89.9%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L218	#,
# BLOCK 3 freq:1250 seq:1
# PRED: 2 [89.9%]  (FALLTHRU,CAN_FALLTHRU)
	movl	8(%rdi), %eax	# MEM[(int *)cfg_2(D) + 8B], p
	movl	12(%rdi), %edi	# MEM[(int *)cfg_2(D) + 12B], m
	movl	%eax, %edx	# p, D.6123
	movl	%eax, 8(%rsp)	# p, %sfp
	imull	%edi, %edx	# m, D.6123
	movl	%edi, 12(%rsp)	# m, %sfp
	movslq	%edx, %rdx	# D.6123, D.6124
	leaq	(%r15,%rdx,8), %r12	#, Fout_end
	cmpl	$1, %edi	#, m
# SUCC: 25 [28.0%]  (CAN_FALLTHRU) 4 [72.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L219	#,
# BLOCK 4 freq:900 seq:2
# PRED: 3 [72.0%]  (FALLTHRU,CAN_FALLTHRU)
	movslq	8(%rsp), %rax	# %sfp, D.6124
	leaq	16(%rbx), %rbp	#, factors
	movq	%r15, 16(%rsp)	# fout, %sfp
	movslq	12(%rsp), %r13	# %sfp, D.6124
	movq	%rax, (%rsp)	# D.6124, %sfp
	leaq	0(,%r13,8), %rax	#, D.6124
	movq	%rax, %r13	# D.6124, D.6124
	movq	%rbp, %rax	# factors, factors
	movq	%rsi, %rbp	# fin, fin
# SUCC: 5 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rax, %r14	# factors, factors
# BLOCK 5 freq:10000 seq:3
# PRED: 4 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 5 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L168:
	movq	(%rsp), %rdx	# %sfp,
	movq	%rbp, %rsi	# fin,
	movq	%r15, %rdi	# fout,
	movq	%rbx, %r9	# cfg,
	movq	%r14, %r8	# factors,
	movl	$1, %ecx	#,
	addq	%r13, %r15	# D.6124, fout
	addq	$8, %rbp	#, fin
	call	kf_work	#
	cmpq	%r15, %r12	# fout, Fout_end
# SUCC: 5 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 6 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L168	#,
# BLOCK 6 freq:900 seq:4
# PRED: 5 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	cmpl	$3, 8(%rsp)	#, %sfp
	movq	16(%rsp), %r15	# %sfp, fout
# SUCC: 28 [20.0%]  (CAN_FALLTHRU) 7 [80.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L163	#,
# BLOCK 7 freq:1000 seq:5
# PRED: 6 [80.0%]  (FALLTHRU,CAN_FALLTHRU) 27 [80.0%]  (CAN_FALLTHRU)
.L221:
# SUCC: 8 [62.5%]  (FALLTHRU,CAN_FALLTHRU) 14 [37.5%]  (CAN_FALLTHRU)
	jle	.L220	#,
# BLOCK 8 freq:625 seq:6
# PRED: 7 [62.5%]  (FALLTHRU,CAN_FALLTHRU)
	movl	8(%rsp), %eax	# %sfp, p
	cmpl	$4, %eax	#, p
# SUCC: 32 [40.0%]  (CAN_FALLTHRU) 9 [60.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L166	#,
# BLOCK 9 freq:375 seq:7
# PRED: 8 [60.0%]  (FALLTHRU,CAN_FALLTHRU)
	cmpl	$5, %eax	#, p
# SUCC: 10 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 31 [33.3%]  (CAN_FALLTHRU)
	jne	.L162	#,
# BLOCK 10 freq:250 seq:8
# PRED: 9 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movslq	12(%rsp), %rcx	# %sfp,
	addq	$264, %rbx	#, twiddles
	movq	%rcx, %rax	#,
	salq	$3, %rcx	#, D.6124
	leaq	(%rbx,%rcx), %rdx	#, D.6131
	movss	(%rdx), %xmm5	# MEM[(struct kiss_fft_cpx *)_581], ya$r
	leaq	(%r15,%rcx), %rsi	#, Fout1
	leaq	(%rsi,%rcx), %rdi	#, Fout2
	movss	%xmm5, (%rsp)	# ya$r, %sfp
	movss	4(%rdx), %xmm5	# MEM[(struct kiss_fft_cpx *)_581 + 4B], ya$i
	addq	%rcx, %rdx	# D.6124, D.6131
	leaq	(%rdi,%rcx), %r8	#, Fout3
	movss	4(%rdx), %xmm15	# MEM[(struct kiss_fft_cpx *)_585 + 4B], yb$i
	movss	%xmm5, 8(%rsp)	# ya$i, %sfp
	movss	(%rdx), %xmm5	# MEM[(struct kiss_fft_cpx *)_585], yb$r
	addq	%r8, %rcx	# Fout3, Fout4
	movss	%xmm5, 12(%rsp)	# yb$r, %sfp
	testl	%eax, %eax	# m
# SUCC: 11 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 13 [9.0%]  (CAN_FALLTHRU)
	jle	.L134	#,
# BLOCK 11 freq:228 seq:9
# PRED: 10 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	leal	-1(%rax), %edx	#, D.6126
	movq	%rbx, %r9	# twiddles, ivtmp.745
	leaq	8(%rcx,%rdx,8), %r10	#, D.6131
# SUCC: 12 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	xorl	%edx, %edx	# ivtmp.726
# BLOCK 12 freq:2528 seq:10
# PRED: 11 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 12 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L184:
	movss	(%rsi), %xmm0	# MEM[base: Fout1_852, offset: 0B], D.6133
	addq	$8, %rcx	#, Fout4
	addq	$8, %r15	#, fout
	addq	$8, %rsi	#, Fout1
	movss	(%rbx,%rdx), %xmm3	# MEM[base: twiddles_577, index: ivtmp.726_531, offset: 0B], D.6133
	addq	$8, %rdi	#, Fout2
	addq	$8, %r8	#, Fout3
	addq	$24, %r9	#, ivtmp.745
	movss	4(%rbx,%rdx), %xmm2	# MEM[base: twiddles_577, index: ivtmp.726_531, offset: 4B], D.6133
	movss	-4(%rsi), %xmm4	# MEM[base: Fout1_852, offset: 4B], D.6133
	movaps	%xmm3, %xmm1	# D.6133, D.6133
	mulss	%xmm0, %xmm1	# D.6133, D.6133
	movaps	%xmm2, %xmm5	# D.6133, D.6133
	movss	-4(%rdi), %xmm6	# MEM[base: Fout2_850, offset: 4B], D.6133
	mulss	%xmm2, %xmm0	# D.6133, D.6133
	movss	-24(%r9), %xmm9	# MEM[base: _1312, offset: 0B], D.6133
	mulss	%xmm4, %xmm3	# D.6133, D.6133
	movss	-8(%r15), %xmm10	# MEM[base: fout_854, offset: 0B], scratch$0$r
	mulss	%xmm4, %xmm5	# D.6133, D.6133
	movss	(%rbx,%rdx,2), %xmm4	# MEM[base: twiddles_577, index: ivtmp.726_531, step: 2, offset: 0B], D.6133
	movss	-4(%r15), %xmm8	# MEM[base: fout_854, offset: 4B], scratch$0$i
	movss	12(%rsp), %xmm14	# %sfp, yb$r
	addss	%xmm0, %xmm3	# D.6133, D.6133
	movss	4(%rbx,%rdx,2), %xmm0	# MEM[base: twiddles_577, index: ivtmp.726_531, step: 2, offset: 4B], D.6133
	subss	%xmm5, %xmm1	# D.6133, D.6133
	movaps	%xmm4, %xmm5	# D.6133, D.6133
	mulss	%xmm6, %xmm4	# D.6133, D.6133
	movaps	%xmm0, %xmm7	# D.6133, D.6133
	mulss	%xmm6, %xmm7	# D.6133, D.6133
	movaps	%xmm3, %xmm2	# D.6133, D.6133
	movss	-8(%rdi), %xmm3	# MEM[base: Fout2_850, offset: 0B], D.6133
	movss	-20(%r9), %xmm6	# MEM[base: _1312, offset: 4B], D.6133
	mulss	%xmm3, %xmm5	# D.6133, D.6133
	mulss	%xmm0, %xmm3	# D.6133, D.6133
	movaps	%xmm4, %xmm0	# D.6133, D.6133
	movss	-4(%r8), %xmm4	# MEM[base: Fout3_849, offset: 4B], D.6133
	movaps	%xmm6, %xmm11	# D.6133, D.6133
	mulss	%xmm4, %xmm11	# D.6133, D.6133
	subss	%xmm7, %xmm5	# D.6133, D.6133
	mulss	%xmm9, %xmm4	# D.6133, D.6133
	movaps	%xmm9, %xmm7	# D.6133, D.6133
	movss	(%rbx,%rdx,4), %xmm9	# MEM[base: twiddles_577, index: ivtmp.726_531, step: 4, offset: 0B], D.6133
	addss	%xmm3, %xmm0	# D.6133, D.6133
	movss	-8(%r8), %xmm3	# MEM[base: Fout3_849, offset: 0B], D.6133
	movaps	%xmm9, %xmm12	# D.6133, D.6133
	mulss	%xmm3, %xmm7	# D.6133, D.6133
	mulss	%xmm6, %xmm3	# D.6133, D.6133
	movaps	%xmm4, %xmm6	# D.6133, D.6133
	movss	-8(%rcx), %xmm4	# MEM[base: Fout4_847, offset: 0B], D.6133
	mulss	%xmm4, %xmm12	# D.6133, D.6133
	subss	%xmm11, %xmm7	# D.6133, D.6133
	movss	4(%rbx,%rdx,4), %xmm11	# MEM[base: twiddles_577, index: ivtmp.726_531, step: 4, offset: 4B], D.6133
	addq	$8, %rdx	#, ivtmp.726
	addss	%xmm3, %xmm6	# D.6133, D.6133
	movss	-4(%rcx), %xmm3	# MEM[base: Fout4_847, offset: 4B], D.6133
	movaps	%xmm11, %xmm13	# D.6133, D.6133
	mulss	%xmm3, %xmm13	# D.6133, D.6133
	mulss	%xmm3, %xmm9	# D.6133, D.6133
	movaps	%xmm11, %xmm3	# D.6133, D.6133
	mulss	%xmm4, %xmm3	# D.6133, D.6133
	movaps	%xmm7, %xmm4	# D.6133, D.6133
	addss	%xmm5, %xmm4	# D.6133, D.6133
	subss	%xmm13, %xmm12	# D.6133, D.6133
	subss	%xmm7, %xmm5	# D.6133, D.6133
	movaps	%xmm14, %xmm7	# yb$r, D.6133
	addss	%xmm9, %xmm3	# D.6133, D.6133
	mulss	%xmm4, %xmm7	# D.6133, D.6133
	movaps	%xmm12, %xmm11	# D.6133, D.6133
	addss	%xmm1, %xmm11	# D.6133, D.6133
	movaps	%xmm3, %xmm9	# D.6133, D.6133
	subss	%xmm12, %xmm1	# D.6133, D.6133
	addss	%xmm2, %xmm9	# D.6133, D.6133
	subss	%xmm3, %xmm2	# D.6133, D.6133
	movaps	%xmm6, %xmm3	# D.6133, D.6133
	addss	%xmm0, %xmm3	# D.6133, D.6133
	subss	%xmm6, %xmm0	# D.6133, D.6133
	movaps	%xmm11, %xmm6	# D.6133, D.6133
	addss	%xmm10, %xmm6	# scratch$0$r, D.6133
	movaps	%xmm0, %xmm12	# D.6133, D.6133
	addss	%xmm4, %xmm6	# D.6133, D.6133
	mulss	%xmm15, %xmm12	# yb$i, D.6133
	movss	%xmm6, -8(%r15)	# D.6133, MEM[base: fout_854, offset: 0B]
	movaps	%xmm9, %xmm6	# D.6133, D.6133
	addss	%xmm8, %xmm6	# scratch$0$i, D.6133
	addss	%xmm3, %xmm6	# D.6133, D.6133
	movss	%xmm6, -4(%r15)	# D.6133, MEM[base: fout_854, offset: 4B]
	movss	(%rsp), %xmm6	# %sfp, ya$r
	movaps	%xmm6, %xmm13	# ya$r, D.6133
	mulss	%xmm11, %xmm13	# D.6133, D.6133
	mulss	%xmm9, %xmm6	# D.6133, D.6133
	addss	%xmm10, %xmm13	# scratch$0$r, D.6133
	addss	%xmm8, %xmm6	# scratch$0$i, D.6133
	addss	%xmm7, %xmm13	# D.6133, D.6133
	movaps	%xmm14, %xmm7	# yb$r, D.6133
	movss	8(%rsp), %xmm14	# %sfp, D.6133
	mulss	%xmm3, %xmm7	# D.6133, D.6133
	mulss	%xmm2, %xmm14	# D.6133, D.6133
	mulss	%xmm15, %xmm2	# yb$i, D.6133
	addss	%xmm7, %xmm6	# D.6133, D.6133
	movaps	%xmm14, %xmm7	# D.6133, D.6133
	movaps	%xmm5, %xmm14	# D.6133, D.6133
	addss	%xmm12, %xmm7	# D.6133, D.6133
	movss	8(%rsp), %xmm12	# %sfp, D.6133
	mulss	%xmm15, %xmm14	# yb$i, D.6133
	mulss	%xmm1, %xmm12	# D.6133, D.6133
	mulss	%xmm15, %xmm1	# yb$i, D.6133
	addss	%xmm14, %xmm12	# D.6133, D.6133
	movaps	%xmm13, %xmm14	# D.6133, D.6133
	subss	%xmm7, %xmm14	# D.6133, D.6133
	addss	%xmm13, %xmm7	# D.6133, D.6133
	movss	%xmm14, -8(%rsi)	# D.6133, MEM[base: Fout1_852, offset: 0B]
	movaps	%xmm6, %xmm14	# D.6133, D.6133
	subss	%xmm12, %xmm6	# D.6133, D.6133
	addss	%xmm12, %xmm14	# D.6133, D.6133
	movss	8(%rsp), %xmm12	# %sfp, ya$i
	mulss	%xmm12, %xmm0	# ya$i, D.6133
	movss	%xmm14, -4(%rsi)	# D.6133, MEM[base: Fout1_852, offset: 4B]
	mulss	%xmm12, %xmm5	# ya$i, D.6133
	movss	%xmm7, -8(%rcx)	# D.6133, MEM[base: Fout4_847, offset: 0B]
	movss	12(%rsp), %xmm7	# %sfp, yb$r
	movss	%xmm6, -4(%rcx)	# D.6133, MEM[base: Fout4_847, offset: 4B]
	movss	(%rsp), %xmm6	# %sfp, ya$r
	mulss	%xmm7, %xmm11	# yb$r, D.6133
	subss	%xmm2, %xmm0	# D.6133, D.6133
	mulss	%xmm6, %xmm4	# ya$r, D.6133
	subss	%xmm5, %xmm1	# D.6133, D.6133
	mulss	%xmm7, %xmm9	# yb$r, D.6133
	mulss	%xmm6, %xmm3	# ya$r, D.6133
	addss	%xmm11, %xmm10	# D.6133, D.6133
	addss	%xmm9, %xmm8	# D.6133, D.6133
	addss	%xmm4, %xmm10	# D.6133, D.6133
	addss	%xmm3, %xmm8	# D.6133, D.6133
	movaps	%xmm10, %xmm2	# D.6133, D.6133
	subss	%xmm0, %xmm10	# D.6133, D.6133
	addss	%xmm0, %xmm2	# D.6133, D.6133
	movss	%xmm2, -8(%rdi)	# D.6133, MEM[base: Fout2_850, offset: 0B]
	movaps	%xmm8, %xmm2	# D.6133, D.6133
	subss	%xmm1, %xmm8	# D.6133, D.6133
	addss	%xmm1, %xmm2	# D.6133, D.6133
	movss	%xmm2, -4(%rdi)	# D.6133, MEM[base: Fout2_850, offset: 4B]
	movss	%xmm10, -8(%r8)	# D.6133, MEM[base: Fout3_849, offset: 0B]
	movss	%xmm8, -4(%r8)	# D.6133, MEM[base: Fout3_849, offset: 4B]
	cmpq	%r10, %rcx	# D.6131, Fout4
# SUCC: 12 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 13 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L184	#,
# BLOCK 13 freq:594 seq:11
# PRED: 12 [9.0%]  (FALLTHRU,CAN_FALLTHRU) 34 [9.0%]  (CAN_FALLTHRU) 20 [33.3%]  (CAN_FALLTHRU) 10 [9.0%]  (CAN_FALLTHRU) 56 [100.0%]  (CAN_FALLTHRU)
.L134:
	addq	$40, %rsp	#,
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
.L220:
	.cfi_restore_state
	cmpl	$2, 8(%rsp)	#, %sfp
# SUCC: 15 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 31 [33.3%]  (CAN_FALLTHRU)
	jne	.L162	#,
# BLOCK 15 freq:250 seq:13
# PRED: 14 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movslq	12(%rsp), %rsi	# %sfp,
	leaq	264(%rbx), %rcx	#, tw1
	leaq	32(%r15), %r12	#, D.6131
	leaq	296(%rbx), %r11	#, D.6136
	movq	%rsi, %rax	#,
	salq	$3, %rsi	#, D.6124
	leaq	(%r15,%rsi), %rdx	#, Fout2
	addq	$32, %rsi	#, D.6126
	movl	%eax, %r9d	# m, D.6129
	leaq	(%r15,%rsi), %rdi	#, D.6131
	cmpq	%rdi, %rcx	# D.6131, tw1
	setnb	%r13b	#, tmp1038
	cmpq	%rcx, %r12	# tw1, D.6131
	setbe	%dil	#, D.6125
	cmpq	%r11, %r15	# D.6136, fout
	setnb	%r8b	#, D.6125
	orl	%edi, %r8d	# D.6125, D.6125
	cmpl	$5, %eax	#, m
	seta	%r10b	#, D.6125
	andl	%r10d, %r8d	# D.6125, D.6125
	cmpq	%r11, %rdx	# D.6136, Fout2
	setnb	%dil	#, D.6125
	orl	%r13d, %edi	# tmp1038, D.6125
	testb	%dil, %r8b	# D.6125, D.6125
# SUCC: 54 [10.0%]  (CAN_FALLTHRU) 16 [90.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L170	#,
# BLOCK 16 freq:225 seq:14
# PRED: 15 [90.0%]  (FALLTHRU,CAN_FALLTHRU)
	testq	%rsi, %rsi	# D.6126
	setle	%dil	#, D.6125
	cmpq	%r12, %rdx	# D.6131, Fout2
	setnb	%sil	#, D.6125
	orb	%sil, %dil	# D.6125, tmp1344
# SUCC: 54 [11.1%]  (CAN_FALLTHRU) 17 [88.9%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L170	#,
# BLOCK 17 freq:200 seq:15
# PRED: 16 [88.9%]  (FALLTHRU,CAN_FALLTHRU)
	leal	-5(%rax), %r8d	#, D.6129
	leal	-1(%rax), %esi	#,
	shrl	$2, %r8d	#, D.6129
	addl	$1, %r8d	#, bnd.463
	leal	0(,%r8,4), %r11d	#, ratio_mult_vf.464
	cmpl	$3, %esi	#, D.6129
# SUCC: 18 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 22 [33.3%]  (CAN_FALLTHRU)
	jbe	.L171	#,
# BLOCK 18 freq:133 seq:16
# PRED: 17 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%r15, %rdi	# fout, ivtmp.665
	xorl	%esi, %esi	# ivtmp.664
# SUCC: 19 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	xorl	%r10d, %r10d	# ivtmp.660
# BLOCK 19 freq:267 seq:17
# PRED: 18 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 19 [50.0%]  (DFS_BACK,CAN_FALLTHRU)
.L172:
	movups	(%rdx,%rsi), %xmm3	# MEM[base: Fout2_403, index: ivtmp.664_271, offset: 0B], tmp1060
	addl	$1, %r10d	#, ivtmp.660
	addq	$32, %rdi	#, ivtmp.665
	movups	16(%rdx,%rsi), %xmm0	# MEM[base: Fout2_403, index: ivtmp.664_271, offset: 16B], tmp1061
	movaps	%xmm3, %xmm2	# tmp1060, D.6135
	movups	280(%rbx,%rsi), %xmm1	# MEM[base: cfg_2(D), index: ivtmp.664_271, offset: 280B], tmp1063
	shufps	$136, %xmm0, %xmm2	#, tmp1061, D.6135
	shufps	$221, %xmm0, %xmm3	#, tmp1061, D.6135
	movups	264(%rbx,%rsi), %xmm0	# MEM[base: cfg_2(D), index: ivtmp.664_271, offset: 264B], tmp1062
	movaps	%xmm0, %xmm4	# tmp1062, D.6135
	shufps	$221, %xmm1, %xmm0	#, tmp1063, D.6135
	shufps	$136, %xmm1, %xmm4	#, tmp1063, D.6135
	movaps	%xmm0, %xmm1	# D.6135, D.6135
	movaps	%xmm4, %xmm0	# D.6135, vect__408.477
	mulps	%xmm2, %xmm0	# D.6135, vect__408.477
	movaps	%xmm1, %xmm5	# D.6135, vect__411.478
	mulps	%xmm3, %xmm5	# D.6135, vect__411.478
	mulps	%xmm4, %xmm3	# D.6135, vect__414.481
	mulps	%xmm1, %xmm2	# D.6135, vect__413.480
	subps	%xmm5, %xmm0	# vect__411.478, vect__412.479
	movups	-16(%rdi), %xmm5	# MEM[base: _272, offset: 16B], tmp1069
	movaps	%xmm3, %xmm1	# vect__414.481, vect__415.482
	addps	%xmm2, %xmm1	# vect__413.480, vect__415.482
	movups	-32(%rdi), %xmm2	# MEM[base: _272, offset: 0B], tmp1068
	movaps	%xmm2, %xmm4	# tmp1068, D.6135
	shufps	$221, %xmm5, %xmm2	#, tmp1069, D.6135
	shufps	$136, %xmm5, %xmm4	#, tmp1069, D.6135
	movaps	%xmm4, %xmm3	# D.6135, vect__420.487
	movaps	%xmm2, %xmm5	# D.6135, vect__422.492
	subps	%xmm0, %xmm3	# vect__412.479, vect__420.487
	addps	%xmm4, %xmm0	# D.6135, vect__424.495
	subps	%xmm1, %xmm5	# vect__415.482, vect__422.492
	addps	%xmm2, %xmm1	# D.6135, vect__426.496
	movaps	%xmm3, %xmm6	# vect__420.487, D.6135
	movaps	%xmm0, %xmm2	# vect__424.495, D.6135
	unpcklps	%xmm5, %xmm6	# vect__422.492, D.6135
	unpckhps	%xmm5, %xmm3	# vect__422.492, D.6135
	movups	%xmm6, (%rdx,%rsi)	# D.6135, MEM[base: Fout2_403, index: ivtmp.664_271, offset: 0B]
	movups	%xmm3, 16(%rdx,%rsi)	# D.6135, MEM[base: Fout2_403, index: ivtmp.664_271, offset: 16B]
	unpcklps	%xmm1, %xmm2	# vect__426.496, D.6135
	unpckhps	%xmm1, %xmm0	# vect__426.496, D.6135
	addq	$32, %rsi	#, ivtmp.664
	movups	%xmm2, -32(%rdi)	# D.6135, MEM[base: _272, offset: 0B]
	movups	%xmm0, -16(%rdi)	# D.6135, MEM[base: _272, offset: 16B]
	cmpl	%r8d, %r10d	# bnd.463, ivtmp.660
# SUCC: 19 [50.0%]  (DFS_BACK,CAN_FALLTHRU) 20 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	jb	.L172	#,
# BLOCK 20 freq:133 seq:18
# PRED: 19 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	subl	%r11d, 12(%rsp)	# ratio_mult_vf.464, %sfp
	movl	%r11d, %esi	# ratio_mult_vf.464, D.6126
	salq	$3, %rsi	#, D.6126
	movl	12(%rsp), %eax	# %sfp, m
	addq	%rsi, %r15	# D.6126, fout
	addq	%rsi, %rdx	# D.6126, Fout2
	addq	%rsi, %rcx	# D.6126, tw1
	cmpl	%r9d, %r11d	# D.6129, ratio_mult_vf.464
# SUCC: 21 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 13 [33.3%]  (CAN_FALLTHRU)
	je	.L134	#,
# BLOCK 21 freq:89 seq:19
# PRED: 20 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
# SUCC: 22 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	leal	-1(%rax), %esi	#,
# BLOCK 22 freq:156 seq:20
# PRED: 21 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 17 [33.3%]  (CAN_FALLTHRU)
.L171:
# SUCC: 23 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	leaq	8(%rcx,%rsi,8), %rsi	#, D.6131
# BLOCK 23 freq:624 seq:21
# PRED: 23 [75.0%]  (DFS_BACK,CAN_FALLTHRU) 22 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
.L174:
	movss	(%rcx), %xmm3	# MEM[base: tw1_1438, offset: 0B], D.6133
	addq	$8, %rcx	#, tw1
	addq	$8, %rdx	#, Fout2
	addq	$8, %r15	#, fout
	movss	-4(%rcx), %xmm0	# MEM[base: tw1_1438, offset: 4B], D.6133
	movss	-8(%rdx), %xmm1	# MEM[base: Fout2_1439, offset: 0B], D.6133
	movaps	%xmm3, %xmm2	# D.6133, D.6133
	movss	-4(%rdx), %xmm4	# MEM[base: Fout2_1439, offset: 4B], D.6133
	movaps	%xmm0, %xmm5	# D.6133, D.6133
	mulss	%xmm1, %xmm2	# D.6133, D.6133
	mulss	%xmm4, %xmm5	# D.6133, D.6133
	mulss	%xmm4, %xmm3	# D.6133, D.6133
	mulss	%xmm0, %xmm1	# D.6133, D.6133
	subss	%xmm5, %xmm2	# D.6133, D.6133
	movaps	%xmm3, %xmm0	# D.6133, D.6133
	addss	%xmm1, %xmm0	# D.6133, D.6133
	movss	-8(%r15), %xmm1	# MEM[base: fout_1441, offset: 0B], MEM[base: fout_1441, offset: 0B]
	subss	%xmm2, %xmm1	# D.6133, D.6133
	movss	%xmm1, -8(%rdx)	# D.6133, MEM[base: Fout2_1439, offset: 0B]
	movss	-4(%r15), %xmm1	# MEM[base: fout_1441, offset: 4B], MEM[base: fout_1441, offset: 4B]
	subss	%xmm0, %xmm1	# D.6133, D.6133
	movss	%xmm1, -4(%rdx)	# D.6133, MEM[base: Fout2_1439, offset: 4B]
	addss	-8(%r15), %xmm2	# MEM[base: fout_1441, offset: 0B], D.6133
	addss	-4(%r15), %xmm0	# MEM[base: fout_1441, offset: 4B], D.6133
	movss	%xmm2, -8(%r15)	# D.6133, MEM[base: fout_1441, offset: 0B]
	movss	%xmm0, -4(%r15)	# D.6133, MEM[base: fout_1441, offset: 4B]
	cmpq	%rsi, %rcx	# D.6131, tw1
# SUCC: 23 [75.0%]  (DFS_BACK,CAN_FALLTHRU) 24 [25.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L174	#,
# BLOCK 24 freq:156 seq:22
# PRED: 23 [25.0%]  (FALLTHRU,CAN_FALLTHRU)
	addq	$40, %rsp	#,
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
# BLOCK 25 freq:350 seq:23
# PRED: 3 [28.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L219:
	.cfi_restore_state
# SUCC: 26 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%r15, %rdx	# fout, fout
# BLOCK 26 freq:3889 seq:24
# PRED: 25 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 26 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L161:
	movq	(%r14), %rax	# MEM[base: fin_376, offset: 0B], MEM[base: fin_376, offset: 0B]
	addq	$8, %rdx	#, fout
	addq	$8, %r14	#, fin
	movq	%rax, -8(%rdx)	# MEM[base: fin_376, offset: 0B], MEM[base: fout_377, offset: 0B]
	cmpq	%rdx, %r12	# fout, Fout_end
# SUCC: 26 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 27 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L161	#,
# BLOCK 27 freq:350 seq:25
# PRED: 26 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	cmpl	$3, 8(%rsp)	#, %sfp
# SUCC: 28 [20.0%]  (FALLTHRU,CAN_FALLTHRU) 7 [80.0%]  (CAN_FALLTHRU)
	jne	.L221	#,
# BLOCK 28 freq:250 seq:26
# PRED: 6 [20.0%]  (CAN_FALLTHRU) 27 [20.0%]  (FALLTHRU,CAN_FALLTHRU)
.L163:
	movslq	12(%rsp), %rbp	# %sfp, m
	movsd	.LC1(%rip), %xmm6	#, tmp1220
	leaq	0(,%rbp,8), %rcx	#, D.6124
	movss	268(%rbx,%rbp,8), %xmm7	# MEM[(struct  *)_433 + 4B], epi3$i
	addq	$264, %rbx	#, tw2
	leaq	(%r15,%rcx), %rdx	#, ivtmp.690
	movq	%rbx, %rsi	# tw2, tw2
# SUCC: 29 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	addq	%rdx, %rcx	# ivtmp.690, ivtmp.693
# BLOCK 29 freq:2778 seq:27
# PRED: 28 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 29 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L179:
	movss	(%rdx), %xmm1	# MEM[base: _1344, offset: 0B], D.6133
	addq	$8, %rbx	#, tw2
	addq	$16, %rsi	#, tw2
	addq	$8, %r15	#, fout
	movss	-8(%rbx), %xmm3	# MEM[base: tw2_440, offset: 0B], D.6133
	pxor	%xmm15, %xmm15	# tmp1512
	addq	$8, %rdx	#, ivtmp.690
	addq	$8, %rcx	#, ivtmp.693
	movss	-4(%rdx), %xmm4	# MEM[base: _1344, offset: 4B], D.6133
	movaps	%xmm1, %xmm0	# D.6133, D.6133
	movss	-4(%rbx), %xmm2	# MEM[base: tw2_440, offset: 4B], D.6133
	mulss	%xmm3, %xmm0	# D.6133, D.6133
	mulss	%xmm4, %xmm3	# D.6133, D.6133
	movaps	%xmm4, %xmm5	# D.6133, D.6133
	movss	-4(%rcx), %xmm8	# MEM[base: _1336, offset: 4B], D.6133
	mulss	%xmm2, %xmm5	# D.6133, D.6133
	movss	-16(%rsi), %xmm4	# MEM[base: tw2_453, offset: 0B], D.6133
	mulss	%xmm1, %xmm2	# D.6133, D.6133
	movaps	%xmm8, %xmm9	# D.6133, D.6133
	movaps	%xmm3, %xmm1	# D.6133, D.6133
	movss	-12(%rsi), %xmm3	# MEM[base: tw2_453, offset: 4B], D.6133
	subss	%xmm5, %xmm0	# D.6133, D.6133
	addss	%xmm2, %xmm1	# D.6133, D.6133
	movss	-8(%rcx), %xmm2	# MEM[base: _1336, offset: 0B], D.6133
	mulss	%xmm3, %xmm9	# D.6133, D.6133
	mulss	%xmm2, %xmm3	# D.6133, D.6133
	movaps	%xmm2, %xmm5	# D.6133, D.6133
	mulss	%xmm4, %xmm5	# D.6133, D.6133
	mulss	%xmm8, %xmm4	# D.6133, D.6133
	pxor	%xmm8, %xmm8	# D.6134
	cvtss2sd	-8(%r15), %xmm8	# MEM[base: fout_437, offset: 0B], D.6134
	subss	%xmm9, %xmm5	# D.6133, D.6133
	pxor	%xmm9, %xmm9	# D.6134
	addss	%xmm3, %xmm4	# D.6133, D.6133
	movaps	%xmm5, %xmm3	# D.6133, D.6133
	addss	%xmm0, %xmm3	# D.6133, D.6133
	movaps	%xmm4, %xmm2	# D.6133, D.6133
	addss	%xmm1, %xmm4	# D.6133, D.6133
	subss	%xmm2, %xmm1	# D.6133, D.6133
	cvtss2sd	%xmm3, %xmm9	# D.6133, D.6134
	mulsd	%xmm6, %xmm9	# tmp1220, D.6134
	subss	%xmm5, %xmm0	# D.6133, D.6133
	mulss	%xmm7, %xmm1	# epi3$i, D.6133
	mulss	%xmm7, %xmm0	# epi3$i, D.6133
	subsd	%xmm9, %xmm8	# D.6134, D.6134
	pxor	%xmm9, %xmm9	# D.6134
	cvtss2sd	%xmm4, %xmm9	# D.6133, D.6134
	mulsd	%xmm6, %xmm9	# tmp1220, D.6134
	cvtsd2ss	%xmm8, %xmm15	# D.6134, tmp1512
	movss	%xmm15, -8(%rdx)	# tmp1512, MEM[base: _1344, offset: 0B]
	pxor	%xmm8, %xmm8	# D.6134
	pxor	%xmm15, %xmm15	# tmp1513
	cvtss2sd	-4(%r15), %xmm8	# MEM[base: fout_437, offset: 4B], D.6134
	subsd	%xmm9, %xmm8	# D.6134, D.6134
	cvtsd2ss	%xmm8, %xmm15	# D.6134, tmp1513
	movss	%xmm15, -4(%rdx)	# tmp1513, MEM[base: _1344, offset: 4B]
	addss	-8(%r15), %xmm3	# MEM[base: fout_437, offset: 0B], D.6133
	addss	-4(%r15), %xmm4	# MEM[base: fout_437, offset: 4B], D.6133
	movss	%xmm3, -8(%r15)	# D.6133, MEM[base: fout_437, offset: 0B]
	movss	%xmm4, -4(%r15)	# D.6133, MEM[base: fout_437, offset: 4B]
	movss	-8(%rdx), %xmm2	# MEM[base: _1344, offset: 0B], D.6133
	addss	%xmm1, %xmm2	# D.6133, D.6133
	movss	%xmm2, -8(%rcx)	# D.6133, MEM[base: _1336, offset: 0B]
	movss	-4(%rdx), %xmm2	# MEM[base: _1344, offset: 4B], MEM[base: _1344, offset: 4B]
	subss	%xmm0, %xmm2	# D.6133, D.6133
	movss	%xmm2, -4(%rcx)	# D.6133, MEM[base: _1336, offset: 4B]
	movss	-8(%rdx), %xmm2	# MEM[base: _1344, offset: 0B], MEM[base: _1344, offset: 0B]
	addss	-4(%rdx), %xmm0	# MEM[base: _1344, offset: 4B], D.6133
	subss	%xmm1, %xmm2	# D.6133, D.6133
	movss	%xmm0, -4(%rdx)	# D.6133, MEM[base: _1344, offset: 4B]
	movss	%xmm2, -8(%rdx)	# D.6133, MEM[base: _1344, offset: 0B]
	subq	$1, %rbp	#, m
# SUCC: 29 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 30 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L179	#,
# BLOCK 30 freq:250 seq:28
# PRED: 29 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	addq	$40, %rsp	#,
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
# BLOCK 31 freq:250 seq:29
# PRED: 14 [33.3%]  (CAN_FALLTHRU) 9 [33.3%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L162:
	.cfi_restore_state
	movl	8(%rsp), %r8d	# %sfp,
	movq	%rbx, %rdx	# cfg,
	movq	%r15, %rdi	# fout,
	movl	$1, %esi	#,
	movl	12(%rsp), %ecx	# %sfp,
	addq	$40, %rsp	#,
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
# BLOCK 32 freq:250 seq:30
# PRED: 8 [40.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L166:
	.cfi_restore_state
	movslq	12(%rsp), %rbp	# %sfp, k
	leaq	264(%rbx), %rdi	#, tw3
	movl	4(%rbx), %r10d	# cfg_2(D)->inverse, D.6123
	movq	%rdi, %r9	# tw3, tw3
	movq	%rdi, %r8	# tw3, tw3
	leaq	0(,%rbp,8), %rdx	#, D.6124
	leaq	(%r15,%rdx), %rsi	#, ivtmp.713
	leaq	(%rsi,%rdx), %rcx	#, ivtmp.716
	addq	%rcx, %rdx	# ivtmp.716, ivtmp.719
# SUCC: 35 [100.0%]  (CAN_FALLTHRU)
	jmp	.L183	#
# BLOCK 33 freq:1389 seq:31
# PRED: 35 [50.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L222:
	movaps	%xmm8, %xmm1	# D.6133, D.6133
	subss	%xmm0, %xmm1	# D.6133, D.6133
	addss	%xmm8, %xmm0	# D.6133, D.6133
	movss	%xmm1, (%rsi)	# D.6133, MEM[base: _1448, offset: 0B]
	movaps	%xmm6, %xmm1	# D.6133, D.6133
	addss	%xmm7, %xmm1	# D.6133, D.6133
	subss	%xmm6, %xmm7	# D.6133, D.6133
	movss	%xmm1, 4(%rsi)	# D.6133, MEM[base: _1448, offset: 4B]
	movss	%xmm0, (%rdx)	# D.6133, MEM[base: _1326, offset: 0B]
# SUCC: 34 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	%xmm7, 4(%rdx)	# D.6133, MEM[base: _1326, offset: 4B]
# BLOCK 34 freq:2778 seq:32
# PRED: 33 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 36 [100.0%]  (CAN_FALLTHRU)
.L182:
	addq	$8, %r15	#, fout
	addq	$8, %rsi	#, ivtmp.713
	addq	$8, %rcx	#, ivtmp.716
	addq	$8, %rdx	#, ivtmp.719
	subq	$1, %rbp	#, k
# SUCC: 35 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 13 [9.0%]  (CAN_FALLTHRU)
	je	.L134	#,
# BLOCK 35 freq:2778 seq:33
# PRED: 34 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 32 [100.0%]  (CAN_FALLTHRU)
.L183:
	movss	(%rsi), %xmm0	# MEM[base: _1448, offset: 0B], D.6133
	addq	$8, %rdi	#, tw3
	addq	$16, %r8	#, tw3
	addq	$24, %r9	#, tw3
	movss	-8(%rdi), %xmm2	# MEM[base: tw3_507, offset: 0B], D.6133
	movss	4(%rsi), %xmm3	# MEM[base: _1448, offset: 4B], D.6133
	movaps	%xmm0, %xmm6	# D.6133, D.6133
	movss	-4(%rdi), %xmm1	# MEM[base: tw3_507, offset: 4B], D.6133
	mulss	%xmm2, %xmm6	# D.6133, D.6133
	mulss	%xmm3, %xmm2	# D.6133, D.6133
	movaps	%xmm3, %xmm4	# D.6133, D.6133
	movss	(%rcx), %xmm5	# MEM[base: _1328, offset: 0B], D.6133
	mulss	%xmm1, %xmm4	# D.6133, D.6133
	movss	-12(%r8), %xmm3	# MEM[base: tw3_520, offset: 4B], D.6133
	mulss	%xmm0, %xmm1	# D.6133, D.6133
	movaps	%xmm2, %xmm0	# D.6133, D.6133
	movaps	%xmm5, %xmm2	# D.6133, D.6133
	subss	%xmm4, %xmm6	# D.6133, D.6133
	movss	-16(%r8), %xmm4	# MEM[base: tw3_520, offset: 0B], D.6133
	addss	%xmm1, %xmm0	# D.6133, D.6133
	movss	4(%rcx), %xmm1	# MEM[base: _1328, offset: 4B], D.6133
	mulss	%xmm4, %xmm2	# D.6133, D.6133
	movaps	%xmm1, %xmm7	# D.6133, D.6133
	mulss	%xmm3, %xmm7	# D.6133, D.6133
	mulss	%xmm4, %xmm1	# D.6133, D.6133
	movss	-20(%r9), %xmm4	# MEM[base: tw3_533, offset: 4B], D.6133
	mulss	%xmm5, %xmm3	# D.6133, D.6133
	subss	%xmm7, %xmm2	# D.6133, D.6133
	movaps	%xmm1, %xmm5	# D.6133, D.6133
	movss	-24(%r9), %xmm1	# MEM[base: tw3_533, offset: 0B], D.6133
	addss	%xmm3, %xmm5	# D.6133, D.6133
	movss	4(%rdx), %xmm3	# MEM[base: _1326, offset: 4B], D.6133
	movaps	%xmm2, %xmm10	# D.6133, D.6133
	movss	(%rdx), %xmm2	# MEM[base: _1326, offset: 0B], D.6133
	movaps	%xmm3, %xmm7	# D.6133, D.6133
	mulss	%xmm4, %xmm7	# D.6133, D.6133
	movaps	%xmm2, %xmm9	# D.6133, D.6133
	mulss	%xmm2, %xmm4	# D.6133, D.6133
	movss	(%r15), %xmm2	# MEM[base: fout_504, offset: 0B], D.6133
	mulss	%xmm1, %xmm9	# D.6133, D.6133
	mulss	%xmm3, %xmm1	# D.6133, D.6133
	movaps	%xmm2, %xmm8	# D.6133, D.6133
	addss	%xmm10, %xmm2	# D.6133, D.6133
	subss	%xmm10, %xmm8	# D.6133, D.6133
	subss	%xmm7, %xmm9	# D.6133, D.6133
	addss	%xmm4, %xmm1	# D.6133, D.6133
	movss	%xmm2, (%r15)	# D.6133, MEM[base: fout_504, offset: 0B]
	movaps	%xmm1, %xmm3	# D.6133, D.6133
	movss	4(%r15), %xmm1	# MEM[base: fout_504, offset: 4B], D.6133
	movaps	%xmm3, %xmm4	# D.6133, D.6133
	movaps	%xmm1, %xmm7	# D.6133, D.6133
	addss	%xmm5, %xmm1	# D.6133, D.6133
	subss	%xmm5, %xmm7	# D.6133, D.6133
	movaps	%xmm9, %xmm5	# D.6133, D.6133
	addss	%xmm6, %xmm5	# D.6133, D.6133
	addss	%xmm0, %xmm4	# D.6133, D.6133
	movss	%xmm1, 4(%r15)	# D.6133, MEM[base: fout_504, offset: 4B]
	subss	%xmm9, %xmm6	# D.6133, D.6133
	subss	%xmm5, %xmm2	# D.6133, D.6133
	subss	%xmm4, %xmm1	# D.6133, D.6133
	subss	%xmm3, %xmm0	# D.6133, D.6133
	movss	%xmm2, (%rcx)	# D.6133, MEM[base: _1328, offset: 0B]
	movss	%xmm1, 4(%rcx)	# D.6133, MEM[base: _1328, offset: 4B]
	addss	(%r15), %xmm5	# MEM[base: fout_504, offset: 0B], D.6133
	addss	4(%r15), %xmm4	# MEM[base: fout_504, offset: 4B], D.6133
	movss	%xmm5, (%r15)	# D.6133, MEM[base: fout_504, offset: 0B]
	movss	%xmm4, 4(%r15)	# D.6133, MEM[base: fout_504, offset: 4B]
	testl	%r10d, %r10d	# D.6123
# SUCC: 33 [50.0%]  (CAN_FALLTHRU) 36 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L222	#,
# BLOCK 36 freq:1389 seq:34
# PRED: 35 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	movaps	%xmm0, %xmm1	# D.6133, D.6133
	addss	%xmm8, %xmm1	# D.6133, D.6133
	subss	%xmm0, %xmm8	# D.6133, D.6133
	movss	%xmm1, (%rsi)	# D.6133, MEM[base: _1448, offset: 0B]
	movaps	%xmm7, %xmm1	# D.6133, D.6133
	addss	%xmm6, %xmm7	# D.6133, D.6133
	subss	%xmm6, %xmm1	# D.6133, D.6133
	movss	%xmm1, 4(%rsi)	# D.6133, MEM[base: _1448, offset: 4B]
	movss	%xmm8, (%rdx)	# D.6133, MEM[base: _1326, offset: 0B]
	movss	%xmm7, 4(%rdx)	# D.6133, MEM[base: _1326, offset: 4B]
# SUCC: 34 [100.0%]  (CAN_FALLTHRU)
	jmp	.L182	#
# BLOCK 37 freq:141 seq:35
# PRED: 2 [10.1%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L218:
	movslq	(%rdi), %rdi	# cfg_2(D)->nfft, D.6124
	salq	$3, %rdi	#, D.6124
	call	malloc	#
	movl	8(%rbx), %edi	# MEM[(int *)cfg_2(D) + 8B], p
	movl	12(%rbx), %esi	# MEM[(int *)cfg_2(D) + 12B], m
	movq	%rax, %rcx	#, Fout
	movq	%rax, 16(%rsp)	# Fout, %sfp
	movl	%edi, 8(%rsp)	# p, %sfp
	imull	%esi, %edi	# m, D.6123
	movl	%esi, 12(%rsp)	# m, %sfp
	movslq	%edi, %rax	# D.6123,
	movq	%rcx, %rdi	# Fout, Fout
	leaq	(%rcx,%rax,8), %r12	#, Fout_end
	cmpl	$1, %esi	#, m
# SUCC: 68 [28.0%]  (CAN_FALLTHRU) 38 [72.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L223	#,
# BLOCK 38 freq:102 seq:36
# PRED: 37 [72.0%]  (FALLTHRU,CAN_FALLTHRU)
	movslq	8(%rsp), %rax	# %sfp, D.6124
	movq	%r14, %r13	# fin, fin
	movq	%r14, 24(%rsp)	# fin, %sfp
	movq	%rdi, %r14	# Fout, Fout
	movslq	12(%rsp), %rbp	# %sfp, D.6124
	movq	%rax, (%rsp)	# D.6124, %sfp
	leaq	0(,%rbp,8), %rax	#, D.6124
	leaq	16(%rbx), %rbp	#, factors
	movq	%rbp, %r15	# factors, factors
	movq	%r13, %rbp	# fin, fin
# SUCC: 39 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%rax, %r13	# D.6124, D.6124
# BLOCK 39 freq:1128 seq:37
# PRED: 38 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 39 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L143:
	movq	(%rsp), %rdx	# %sfp,
	movq	%rbp, %rsi	# fin,
	movq	%r14, %rdi	# Fout,
	movq	%rbx, %r9	# cfg,
	movq	%r15, %r8	# factors,
	movl	$1, %ecx	#,
	addq	%r13, %r14	# D.6124, Fout
	addq	$8, %rbp	#, fin
	call	kf_work	#
	cmpq	%r14, %r12	# Fout, Fout_end
# SUCC: 39 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 40 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	jne	.L143	#,
# BLOCK 40 freq:102 seq:38
# PRED: 39 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
# SUCC: 41 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	24(%rsp), %r14	# %sfp, fin
# BLOCK 41 freq:142 seq:39
# PRED: 40 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 68 [100.0%]  (CAN_FALLTHRU)
.L144:
	cmpl	$3, 8(%rsp)	#, %sfp
# SUCC: 69 [20.0%]  (CAN_FALLTHRU) 42 [80.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L138	#,
# BLOCK 42 freq:114 seq:40
# PRED: 41 [80.0%]  (FALLTHRU,CAN_FALLTHRU)
# SUCC: 43 [62.5%]  (FALLTHRU,CAN_FALLTHRU) 57 [37.5%]  (CAN_FALLTHRU)
	jle	.L224	#,
# BLOCK 43 freq:71 seq:41
# PRED: 42 [62.5%]  (FALLTHRU,CAN_FALLTHRU)
	movl	8(%rsp), %eax	# %sfp, p
	cmpl	$4, %eax	#, p
# SUCC: 49 [40.0%]  (CAN_FALLTHRU) 44 [60.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L141	#,
# BLOCK 44 freq:43 seq:42
# PRED: 43 [60.0%]  (FALLTHRU,CAN_FALLTHRU)
	cmpl	$5, %eax	#, p
# SUCC: 45 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 72 [33.3%]  (CAN_FALLTHRU)
	jne	.L137	#,
# BLOCK 45 freq:28 seq:43
# PRED: 44 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movl	12(%rsp), %r11d	# %sfp, m
	leaq	264(%rbx), %rcx	#, twiddles
	movq	16(%rsp), %r9	# %sfp, Fout
	movslq	%r11d, %rdx	# m,
	salq	$3, %rdx	#, D.6124
	leaq	(%rcx,%rdx), %rax	#, D.6131
	movss	(%rax), %xmm5	# MEM[(struct kiss_fft_cpx *)_226], ya$r
	leaq	(%r9,%rdx), %rsi	#, Fout1
	leaq	(%rsi,%rdx), %rdi	#, Fout2
	movss	%xmm5, (%rsp)	# ya$r, %sfp
	movss	4(%rax), %xmm5	# MEM[(struct kiss_fft_cpx *)_226 + 4B], ya$i
	addq	%rdx, %rax	# D.6124, D.6131
	leaq	(%rdi,%rdx), %r8	#, Fout3
	movss	4(%rax), %xmm15	# MEM[(struct kiss_fft_cpx *)_230 + 4B], yb$i
	movss	%xmm5, 8(%rsp)	# ya$i, %sfp
	movss	(%rax), %xmm5	# MEM[(struct kiss_fft_cpx *)_230], yb$r
	addq	%r8, %rdx	# Fout3, Fout4
	movl	%r11d, %eax	# m, m
	movss	%xmm5, 12(%rsp)	# yb$r, %sfp
	testl	%r11d, %r11d	# m
# SUCC: 46 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 48 [9.0%]  (CAN_FALLTHRU)
	jle	.L151	#,
# BLOCK 46 freq:25 seq:44
# PRED: 45 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	subl	$1, %eax	#, D.6126
	movq	%rcx, %r11	# twiddles, ivtmp.614
	leaq	8(%rdx,%rax,8), %rbp	#, D.6131
# SUCC: 47 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	xorl	%eax, %eax	# ivtmp.595
# BLOCK 47 freq:285 seq:45
# PRED: 46 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 47 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L159:
	movss	(%rsi), %xmm0	# MEM[base: Fout1_856, offset: 0B], D.6133
	addq	$8, %rdx	#, Fout4
	addq	$8, %r9	#, Fout
	addq	$8, %rsi	#, Fout1
	movss	(%rcx,%rax), %xmm3	# MEM[base: twiddles_222, index: ivtmp.595_176, offset: 0B], D.6133
	addq	$8, %rdi	#, Fout2
	addq	$8, %r8	#, Fout3
	addq	$24, %r11	#, ivtmp.614
	movss	-4(%rsi), %xmm4	# MEM[base: Fout1_856, offset: 4B], D.6133
	movss	4(%rcx,%rax), %xmm2	# MEM[base: twiddles_222, index: ivtmp.595_176, offset: 4B], D.6133
	movaps	%xmm3, %xmm1	# D.6133, D.6133
	mulss	%xmm0, %xmm1	# D.6133, D.6133
	movss	-4(%rdi), %xmm6	# MEM[base: Fout2_853, offset: 4B], D.6133
	mulss	%xmm2, %xmm0	# D.6133, D.6133
	movaps	%xmm2, %xmm5	# D.6133, D.6133
	movss	-24(%r11), %xmm9	# MEM[base: _430, offset: 0B], D.6133
	mulss	%xmm4, %xmm3	# D.6133, D.6133
	movss	-8(%r9), %xmm10	# MEM[base: Fout_857, offset: 0B], scratch$0$r
	mulss	%xmm4, %xmm5	# D.6133, D.6133
	movss	(%rcx,%rax,2), %xmm4	# MEM[base: twiddles_222, index: ivtmp.595_176, step: 2, offset: 0B], D.6133
	movss	-4(%r9), %xmm8	# MEM[base: Fout_857, offset: 4B], scratch$0$i
	movss	12(%rsp), %xmm14	# %sfp, yb$r
	addss	%xmm0, %xmm3	# D.6133, D.6133
	movss	4(%rcx,%rax,2), %xmm0	# MEM[base: twiddles_222, index: ivtmp.595_176, step: 2, offset: 4B], D.6133
	subss	%xmm5, %xmm1	# D.6133, D.6133
	movaps	%xmm4, %xmm5	# D.6133, D.6133
	mulss	%xmm6, %xmm4	# D.6133, D.6133
	movaps	%xmm0, %xmm7	# D.6133, D.6133
	mulss	%xmm6, %xmm7	# D.6133, D.6133
	movaps	%xmm3, %xmm2	# D.6133, D.6133
	movss	-8(%rdi), %xmm3	# MEM[base: Fout2_853, offset: 0B], D.6133
	movss	-20(%r11), %xmm6	# MEM[base: _430, offset: 4B], D.6133
	mulss	%xmm3, %xmm5	# D.6133, D.6133
	mulss	%xmm0, %xmm3	# D.6133, D.6133
	movaps	%xmm4, %xmm0	# D.6133, D.6133
	movss	-4(%r8), %xmm4	# MEM[base: Fout3_848, offset: 4B], D.6133
	movaps	%xmm6, %xmm11	# D.6133, D.6133
	mulss	%xmm4, %xmm11	# D.6133, D.6133
	subss	%xmm7, %xmm5	# D.6133, D.6133
	mulss	%xmm9, %xmm4	# D.6133, D.6133
	movaps	%xmm9, %xmm7	# D.6133, D.6133
	movss	(%rcx,%rax,4), %xmm9	# MEM[base: twiddles_222, index: ivtmp.595_176, step: 4, offset: 0B], D.6133
	addss	%xmm3, %xmm0	# D.6133, D.6133
	movss	-8(%r8), %xmm3	# MEM[base: Fout3_848, offset: 0B], D.6133
	movaps	%xmm9, %xmm12	# D.6133, D.6133
	mulss	%xmm3, %xmm7	# D.6133, D.6133
	mulss	%xmm6, %xmm3	# D.6133, D.6133
	movaps	%xmm4, %xmm6	# D.6133, D.6133
	movss	-8(%rdx), %xmm4	# MEM[base: Fout4_846, offset: 0B], D.6133
	mulss	%xmm4, %xmm12	# D.6133, D.6133
	subss	%xmm11, %xmm7	# D.6133, D.6133
	movss	4(%rcx,%rax,4), %xmm11	# MEM[base: twiddles_222, index: ivtmp.595_176, step: 4, offset: 4B], D.6133
	addq	$8, %rax	#, ivtmp.595
	addss	%xmm3, %xmm6	# D.6133, D.6133
	movss	-4(%rdx), %xmm3	# MEM[base: Fout4_846, offset: 4B], D.6133
	movaps	%xmm11, %xmm13	# D.6133, D.6133
	mulss	%xmm3, %xmm13	# D.6133, D.6133
	mulss	%xmm3, %xmm9	# D.6133, D.6133
	movaps	%xmm11, %xmm3	# D.6133, D.6133
	mulss	%xmm4, %xmm3	# D.6133, D.6133
	movaps	%xmm7, %xmm4	# D.6133, D.6133
	addss	%xmm5, %xmm4	# D.6133, D.6133
	subss	%xmm13, %xmm12	# D.6133, D.6133
	subss	%xmm7, %xmm5	# D.6133, D.6133
	movaps	%xmm14, %xmm7	# yb$r, D.6133
	addss	%xmm9, %xmm3	# D.6133, D.6133
	mulss	%xmm4, %xmm7	# D.6133, D.6133
	movaps	%xmm12, %xmm11	# D.6133, D.6133
	addss	%xmm1, %xmm11	# D.6133, D.6133
	movaps	%xmm3, %xmm9	# D.6133, D.6133
	subss	%xmm12, %xmm1	# D.6133, D.6133
	addss	%xmm2, %xmm9	# D.6133, D.6133
	subss	%xmm3, %xmm2	# D.6133, D.6133
	movaps	%xmm6, %xmm3	# D.6133, D.6133
	addss	%xmm0, %xmm3	# D.6133, D.6133
	subss	%xmm6, %xmm0	# D.6133, D.6133
	movaps	%xmm11, %xmm6	# D.6133, D.6133
	addss	%xmm10, %xmm6	# scratch$0$r, D.6133
	movaps	%xmm0, %xmm12	# D.6133, D.6133
	addss	%xmm4, %xmm6	# D.6133, D.6133
	mulss	%xmm15, %xmm12	# yb$i, D.6133
	movss	%xmm6, -8(%r9)	# D.6133, MEM[base: Fout_857, offset: 0B]
	movaps	%xmm9, %xmm6	# D.6133, D.6133
	addss	%xmm8, %xmm6	# scratch$0$i, D.6133
	addss	%xmm3, %xmm6	# D.6133, D.6133
	movss	%xmm6, -4(%r9)	# D.6133, MEM[base: Fout_857, offset: 4B]
	movss	(%rsp), %xmm6	# %sfp, ya$r
	movaps	%xmm6, %xmm13	# ya$r, D.6133
	mulss	%xmm11, %xmm13	# D.6133, D.6133
	mulss	%xmm9, %xmm6	# D.6133, D.6133
	addss	%xmm10, %xmm13	# scratch$0$r, D.6133
	addss	%xmm8, %xmm6	# scratch$0$i, D.6133
	addss	%xmm7, %xmm13	# D.6133, D.6133
	movaps	%xmm14, %xmm7	# yb$r, D.6133
	movss	8(%rsp), %xmm14	# %sfp, D.6133
	mulss	%xmm3, %xmm7	# D.6133, D.6133
	mulss	%xmm2, %xmm14	# D.6133, D.6133
	mulss	%xmm15, %xmm2	# yb$i, D.6133
	addss	%xmm7, %xmm6	# D.6133, D.6133
	movaps	%xmm14, %xmm7	# D.6133, D.6133
	movaps	%xmm5, %xmm14	# D.6133, D.6133
	addss	%xmm12, %xmm7	# D.6133, D.6133
	movss	8(%rsp), %xmm12	# %sfp, D.6133
	mulss	%xmm15, %xmm14	# yb$i, D.6133
	mulss	%xmm1, %xmm12	# D.6133, D.6133
	mulss	%xmm15, %xmm1	# yb$i, D.6133
	addss	%xmm14, %xmm12	# D.6133, D.6133
	movaps	%xmm13, %xmm14	# D.6133, D.6133
	subss	%xmm7, %xmm14	# D.6133, D.6133
	addss	%xmm13, %xmm7	# D.6133, D.6133
	movss	%xmm14, -8(%rsi)	# D.6133, MEM[base: Fout1_856, offset: 0B]
	movaps	%xmm6, %xmm14	# D.6133, D.6133
	subss	%xmm12, %xmm6	# D.6133, D.6133
	addss	%xmm12, %xmm14	# D.6133, D.6133
	movss	8(%rsp), %xmm12	# %sfp, ya$i
	mulss	%xmm12, %xmm0	# ya$i, D.6133
	movss	%xmm14, -4(%rsi)	# D.6133, MEM[base: Fout1_856, offset: 4B]
	mulss	%xmm12, %xmm5	# ya$i, D.6133
	movss	%xmm7, -8(%rdx)	# D.6133, MEM[base: Fout4_846, offset: 0B]
	movss	12(%rsp), %xmm7	# %sfp, yb$r
	movss	%xmm6, -4(%rdx)	# D.6133, MEM[base: Fout4_846, offset: 4B]
	movss	(%rsp), %xmm6	# %sfp, ya$r
	mulss	%xmm7, %xmm11	# yb$r, D.6133
	subss	%xmm2, %xmm0	# D.6133, D.6133
	mulss	%xmm6, %xmm4	# ya$r, D.6133
	subss	%xmm5, %xmm1	# D.6133, D.6133
	mulss	%xmm7, %xmm9	# yb$r, D.6133
	mulss	%xmm6, %xmm3	# ya$r, D.6133
	addss	%xmm11, %xmm10	# D.6133, D.6133
	addss	%xmm9, %xmm8	# D.6133, D.6133
	addss	%xmm10, %xmm4	# D.6133, D.6133
	addss	%xmm8, %xmm3	# D.6133, D.6133
	movaps	%xmm4, %xmm2	# D.6133, D.6133
	subss	%xmm0, %xmm4	# D.6133, D.6133
	addss	%xmm0, %xmm2	# D.6133, D.6133
	movss	%xmm2, -8(%rdi)	# D.6133, MEM[base: Fout2_853, offset: 0B]
	movaps	%xmm3, %xmm2	# D.6133, D.6133
	subss	%xmm1, %xmm3	# D.6133, D.6133
	addss	%xmm1, %xmm2	# D.6133, D.6133
	movss	%xmm2, -4(%rdi)	# D.6133, MEM[base: Fout2_853, offset: 4B]
	movss	%xmm4, -8(%r8)	# D.6133, MEM[base: Fout3_848, offset: 0B]
	movss	%xmm3, -4(%r8)	# D.6133, MEM[base: Fout3_848, offset: 4B]
	cmpq	%rbp, %rdx	# D.6131, Fout4
# SUCC: 47 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 48 [9.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L159	#,
# BLOCK 48 freq:141 seq:46
# PRED: 71 [100.0%]  (CAN_FALLTHRU) 67 [100.0%]  (CAN_FALLTHRU) 45 [9.0%]  (CAN_FALLTHRU) 63 [33.3%]  (CAN_FALLTHRU) 51 [9.0%]  (CAN_FALLTHRU) 47 [9.0%]  (FALLTHRU,CAN_FALLTHRU) 72 [100.0%]  (CAN_FALLTHRU) 76 [100.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L151:
	movslq	(%rbx), %rdx	# cfg_2(D)->nfft, D.6124
	movq	%r14, %rdi	# fin,
	movq	16(%rsp), %rbx	# %sfp, Fout
	salq	$3, %rdx	#, D.6124
	movq	%rbx, %rsi	# Fout,
	call	memcpy	#
	addq	$40, %rsp	#,
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
# BLOCK 49 freq:28 seq:47
# PRED: 43 [40.0%]  (CAN_FALLTHRU)
.L141:
	.cfi_restore_state
	movslq	12(%rsp), %r15	# %sfp, k
	leaq	264(%rbx), %rdi	#, tw3
	movq	16(%rsp), %rax	# %sfp, Fout
	movq	%rdi, %r9	# tw3, tw3
	movq	%rdi, %r8	# tw3, tw3
	movl	4(%rbx), %r11d	# cfg_2(D)->inverse, D.6123
	leaq	0(,%r15,8), %rdx	#, D.6124
	leaq	(%rax,%rdx), %rsi	#, ivtmp.582
	leaq	(%rsi,%rdx), %rcx	#, ivtmp.585
	addq	%rcx, %rdx	# ivtmp.585, ivtmp.588
# SUCC: 52 [100.0%]  (CAN_FALLTHRU)
	jmp	.L158	#
# BLOCK 50 freq:157 seq:48
# PRED: 52 [50.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L225:
	movaps	%xmm8, %xmm1	# D.6133, D.6133
	subss	%xmm0, %xmm1	# D.6133, D.6133
	addss	%xmm8, %xmm0	# D.6133, D.6133
	movss	%xmm1, (%rsi)	# D.6133, MEM[base: _410, offset: 0B]
	movaps	%xmm6, %xmm1	# D.6133, D.6133
	addss	%xmm7, %xmm1	# D.6133, D.6133
	subss	%xmm6, %xmm7	# D.6133, D.6133
	movss	%xmm1, 4(%rsi)	# D.6133, MEM[base: _410, offset: 4B]
	movss	%xmm0, (%rdx)	# D.6133, MEM[base: _414, offset: 0B]
# SUCC: 51 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movss	%xmm7, 4(%rdx)	# D.6133, MEM[base: _414, offset: 4B]
# BLOCK 51 freq:313 seq:49
# PRED: 50 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 53 [100.0%]  (CAN_FALLTHRU)
.L157:
	addq	$8, %rax	#, Fout
	addq	$8, %rsi	#, ivtmp.582
	addq	$8, %rcx	#, ivtmp.585
	addq	$8, %rdx	#, ivtmp.588
	subq	$1, %r15	#, k
# SUCC: 52 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 48 [9.0%]  (CAN_FALLTHRU)
	je	.L151	#,
# BLOCK 52 freq:313 seq:50
# PRED: 51 [91.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 49 [100.0%]  (CAN_FALLTHRU)
.L158:
	movss	(%rsi), %xmm0	# MEM[base: _410, offset: 0B], D.6133
	addq	$8, %rdi	#, tw3
	addq	$16, %r8	#, tw3
	addq	$24, %r9	#, tw3
	movss	4(%rsi), %xmm3	# MEM[base: _410, offset: 4B], D.6133
	movss	-8(%rdi), %xmm2	# MEM[base: tw3_152, offset: 0B], D.6133
	movaps	%xmm0, %xmm6	# D.6133, D.6133
	movss	-4(%rdi), %xmm1	# MEM[base: tw3_152, offset: 4B], D.6133
	movaps	%xmm3, %xmm4	# D.6133, D.6133
	mulss	%xmm2, %xmm6	# D.6133, D.6133
	movss	(%rcx), %xmm5	# MEM[base: _412, offset: 0B], D.6133
	mulss	%xmm3, %xmm2	# D.6133, D.6133
	movss	-12(%r8), %xmm3	# MEM[base: tw3_165, offset: 4B], D.6133
	mulss	%xmm1, %xmm4	# D.6133, D.6133
	mulss	%xmm0, %xmm1	# D.6133, D.6133
	movaps	%xmm2, %xmm0	# D.6133, D.6133
	movaps	%xmm5, %xmm2	# D.6133, D.6133
	subss	%xmm4, %xmm6	# D.6133, D.6133
	movss	-16(%r8), %xmm4	# MEM[base: tw3_165, offset: 0B], D.6133
	addss	%xmm1, %xmm0	# D.6133, D.6133
	movss	4(%rcx), %xmm1	# MEM[base: _412, offset: 4B], D.6133
	mulss	%xmm4, %xmm2	# D.6133, D.6133
	movaps	%xmm1, %xmm7	# D.6133, D.6133
	mulss	%xmm3, %xmm7	# D.6133, D.6133
	mulss	%xmm4, %xmm1	# D.6133, D.6133
	movss	-20(%r9), %xmm4	# MEM[base: tw3_178, offset: 4B], D.6133
	mulss	%xmm5, %xmm3	# D.6133, D.6133
	subss	%xmm7, %xmm2	# D.6133, D.6133
	movaps	%xmm1, %xmm5	# D.6133, D.6133
	movss	-24(%r9), %xmm1	# MEM[base: tw3_178, offset: 0B], D.6133
	addss	%xmm3, %xmm5	# D.6133, D.6133
	movss	4(%rdx), %xmm3	# MEM[base: _414, offset: 4B], D.6133
	movaps	%xmm2, %xmm10	# D.6133, D.6133
	movss	(%rdx), %xmm2	# MEM[base: _414, offset: 0B], D.6133
	movaps	%xmm3, %xmm7	# D.6133, D.6133
	mulss	%xmm4, %xmm7	# D.6133, D.6133
	movaps	%xmm2, %xmm9	# D.6133, D.6133
	mulss	%xmm2, %xmm4	# D.6133, D.6133
	movss	(%rax), %xmm2	# MEM[base: Fout_149, offset: 0B], D.6133
	mulss	%xmm1, %xmm9	# D.6133, D.6133
	mulss	%xmm3, %xmm1	# D.6133, D.6133
	movaps	%xmm2, %xmm8	# D.6133, D.6133
	addss	%xmm10, %xmm2	# D.6133, D.6133
	subss	%xmm10, %xmm8	# D.6133, D.6133
	subss	%xmm7, %xmm9	# D.6133, D.6133
	addss	%xmm4, %xmm1	# D.6133, D.6133
	movss	%xmm2, (%rax)	# D.6133, MEM[base: Fout_149, offset: 0B]
	movaps	%xmm1, %xmm3	# D.6133, D.6133
	movss	4(%rax), %xmm1	# MEM[base: Fout_149, offset: 4B], D.6133
	movaps	%xmm3, %xmm4	# D.6133, D.6133
	movaps	%xmm1, %xmm7	# D.6133, D.6133
	addss	%xmm5, %xmm1	# D.6133, D.6133
	subss	%xmm5, %xmm7	# D.6133, D.6133
	movaps	%xmm9, %xmm5	# D.6133, D.6133
	addss	%xmm6, %xmm5	# D.6133, D.6133
	addss	%xmm0, %xmm4	# D.6133, D.6133
	movss	%xmm1, 4(%rax)	# D.6133, MEM[base: Fout_149, offset: 4B]
	subss	%xmm9, %xmm6	# D.6133, D.6133
	subss	%xmm5, %xmm2	# D.6133, D.6133
	subss	%xmm4, %xmm1	# D.6133, D.6133
	subss	%xmm3, %xmm0	# D.6133, D.6133
	movss	%xmm2, (%rcx)	# D.6133, MEM[base: _412, offset: 0B]
	movss	%xmm1, 4(%rcx)	# D.6133, MEM[base: _412, offset: 4B]
	addss	(%rax), %xmm5	# MEM[base: Fout_149, offset: 0B], D.6133
	addss	4(%rax), %xmm4	# MEM[base: Fout_149, offset: 4B], D.6133
	movss	%xmm5, (%rax)	# D.6133, MEM[base: Fout_149, offset: 0B]
	movss	%xmm4, 4(%rax)	# D.6133, MEM[base: Fout_149, offset: 4B]
	testl	%r11d, %r11d	# D.6123
# SUCC: 50 [50.0%]  (CAN_FALLTHRU) 53 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	jne	.L225	#,
# BLOCK 53 freq:157 seq:51
# PRED: 52 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	movaps	%xmm0, %xmm1	# D.6133, D.6133
	addss	%xmm8, %xmm1	# D.6133, D.6133
	subss	%xmm0, %xmm8	# D.6133, D.6133
	movss	%xmm1, (%rsi)	# D.6133, MEM[base: _410, offset: 0B]
	movaps	%xmm7, %xmm1	# D.6133, D.6133
	addss	%xmm6, %xmm7	# D.6133, D.6133
	subss	%xmm6, %xmm1	# D.6133, D.6133
	movss	%xmm1, 4(%rsi)	# D.6133, MEM[base: _410, offset: 4B]
	movss	%xmm8, (%rdx)	# D.6133, MEM[base: _414, offset: 0B]
	movss	%xmm7, 4(%rdx)	# D.6133, MEM[base: _414, offset: 4B]
# SUCC: 51 [100.0%]  (CAN_FALLTHRU)
	jmp	.L157	#
# BLOCK 54 freq:50 seq:52
# PRED: 16 [11.1%]  (CAN_FALLTHRU) 15 [10.0%]  (CAN_FALLTHRU)
.L170:
	movl	12(%rsp), %eax	# %sfp, m
	leal	-1(%rax), %esi	#, D.6126
# SUCC: 55 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	leaq	8(%rcx,%rsi,8), %rsi	#, D.6131
# BLOCK 55 freq:556 seq:53
# PRED: 54 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 55 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L177:
	movss	(%rcx), %xmm3	# MEM[base: tw1_1476, offset: 0B], D.6133
	addq	$8, %rcx	#, tw1
	addq	$8, %rdx	#, Fout2
	addq	$8, %r15	#, fout
	movss	-4(%rcx), %xmm0	# MEM[base: tw1_1476, offset: 4B], D.6133
	movss	-8(%rdx), %xmm1	# MEM[base: Fout2_1477, offset: 0B], D.6133
	movaps	%xmm3, %xmm2	# D.6133, D.6133
	movss	-4(%rdx), %xmm4	# MEM[base: Fout2_1477, offset: 4B], D.6133
	movaps	%xmm0, %xmm5	# D.6133, D.6133
	mulss	%xmm1, %xmm2	# D.6133, D.6133
	mulss	%xmm4, %xmm5	# D.6133, D.6133
	mulss	%xmm4, %xmm3	# D.6133, D.6133
	mulss	%xmm0, %xmm1	# D.6133, D.6133
	subss	%xmm5, %xmm2	# D.6133, D.6133
	movaps	%xmm3, %xmm0	# D.6133, D.6133
	addss	%xmm1, %xmm0	# D.6133, D.6133
	movss	-8(%r15), %xmm1	# MEM[base: fout_1479, offset: 0B], MEM[base: fout_1479, offset: 0B]
	subss	%xmm2, %xmm1	# D.6133, D.6133
	movss	%xmm1, -8(%rdx)	# D.6133, MEM[base: Fout2_1477, offset: 0B]
	movss	-4(%r15), %xmm1	# MEM[base: fout_1479, offset: 4B], MEM[base: fout_1479, offset: 4B]
	subss	%xmm0, %xmm1	# D.6133, D.6133
	movss	%xmm1, -4(%rdx)	# D.6133, MEM[base: Fout2_1477, offset: 4B]
	addss	-8(%r15), %xmm2	# MEM[base: fout_1479, offset: 0B], D.6133
	addss	-4(%r15), %xmm0	# MEM[base: fout_1479, offset: 4B], D.6133
	movss	%xmm2, -8(%r15)	# D.6133, MEM[base: fout_1479, offset: 0B]
	movss	%xmm0, -4(%r15)	# D.6133, MEM[base: fout_1479, offset: 4B]
	cmpq	%rsi, %rcx	# D.6131, tw1
# SUCC: 55 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 56 [9.0%]  (FALLTHRU)
	jne	.L177	#,
# BLOCK 56 freq:50 seq:54
# PRED: 55 [9.0%]  (FALLTHRU)
# SUCC: 13 [100.0%]  (CAN_FALLTHRU)
	jmp	.L134	#
# BLOCK 57 freq:43 seq:55
# PRED: 42 [37.5%]  (CAN_FALLTHRU)
.L224:
	cmpl	$2, 8(%rsp)	#, %sfp
# SUCC: 58 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 72 [33.3%]  (CAN_FALLTHRU)
	jne	.L137	#,
# BLOCK 58 freq:28 seq:56
# PRED: 57 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movl	12(%rsp), %edi	# %sfp, m
	leaq	264(%rbx), %rdx	#, tw1
	movq	16(%rsp), %r10	# %sfp, Fout
	movslq	%edi, %rcx	# m,
	movl	%edi, %r8d	# m, D.6129
	salq	$3, %rcx	#, D.6124
	movq	%r10, %rax	# Fout, Fout
	movq	%r10, %rsi	# Fout, Fout
	addq	%rcx, %rax	# D.6124, Fout2
	addq	$32, %rsi	#, D.6131
	cmpq	%rsi, %rax	# D.6131, Fout2
	setnb	%sil	#, D.6125
	addq	$32, %rcx	#, D.6126
	testq	%rcx, %rcx	# D.6126
	setle	%cl	#, D.6125
	orb	%cl, %sil	# D.6125, tmp1343
# SUCC: 74 [10.0%]  (CAN_FALLTHRU) 59 [90.0%]  (FALLTHRU,CAN_FALLTHRU)
	je	.L145	#,
# BLOCK 59 freq:25 seq:57
# PRED: 58 [90.0%]  (FALLTHRU,CAN_FALLTHRU)
	cmpl	$4, %edi	#, m
# SUCC: 74 [11.1%]  (CAN_FALLTHRU) 60 [88.9%]  (FALLTHRU,CAN_FALLTHRU)
	jbe	.L145	#,
# BLOCK 60 freq:22 seq:58
# PRED: 59 [88.9%]  (FALLTHRU,CAN_FALLTHRU)
	leal	-1(%r8), %esi	#,
	subl	$5, %edi	#, D.6129
	shrl	$2, %edi	#, D.6129
	addl	$1, %edi	#, bnd.425
	leal	0(,%rdi,4), %r11d	#, ratio_mult_vf.426
	cmpl	$3, %esi	#, D.6129
# SUCC: 61 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 73 [33.3%]  (CAN_FALLTHRU)
	jbe	.L185	#,
# BLOCK 61 freq:15 seq:59
# PRED: 60 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
	movq	%r10, %rsi	# Fout, ivtmp.534
	xorl	%ecx, %ecx	# ivtmp.533
# SUCC: 62 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	xorl	%r9d, %r9d	# ivtmp.529
# BLOCK 62 freq:30 seq:60
# PRED: 61 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 62 [50.0%]  (DFS_BACK,CAN_FALLTHRU)
.L147:
	movups	(%rax,%rcx), %xmm4	# MEM[base: Fout2_48, index: ivtmp.533_404, offset: 0B], tmp862
	addl	$1, %r9d	#, ivtmp.529
	addq	$32, %rsi	#, ivtmp.534
	movups	16(%rax,%rcx), %xmm0	# MEM[base: Fout2_48, index: ivtmp.533_404, offset: 16B], tmp863
	movups	264(%rbx,%rcx), %xmm1	# MEM[base: cfg_2(D), index: ivtmp.533_404, offset: 264B], tmp864
	movaps	%xmm4, %xmm3	# tmp862, D.6135
	shufps	$136, %xmm0, %xmm3	#, tmp863, D.6135
	shufps	$221, %xmm0, %xmm4	#, tmp863, D.6135
	movups	280(%rbx,%rcx), %xmm0	# MEM[base: cfg_2(D), index: ivtmp.533_404, offset: 280B], tmp865
	movaps	%xmm1, %xmm2	# tmp864, D.6135
	shufps	$136, %xmm0, %xmm2	#, tmp865, D.6135
	shufps	$221, %xmm0, %xmm1	#, tmp865, D.6135
	movaps	%xmm2, %xmm0	# D.6135, vect__53.439
	movaps	%xmm1, %xmm5	# D.6135, vect__56.440
	mulps	%xmm4, %xmm5	# D.6135, vect__56.440
	mulps	%xmm3, %xmm0	# D.6135, vect__53.439
	mulps	%xmm2, %xmm4	# D.6135, vect__59.443
	mulps	%xmm1, %xmm3	# D.6135, vect__58.442
	movups	-32(%rsi), %xmm1	# MEM[base: _28, offset: 0B], tmp870
	subps	%xmm5, %xmm0	# vect__56.440, vect__57.441
	movups	-16(%rsi), %xmm5	# MEM[base: _28, offset: 16B], tmp871
	addps	%xmm3, %xmm4	# vect__58.442, vect__60.444
	movaps	%xmm4, %xmm2	# vect__60.444, vect__60.444
	movaps	%xmm1, %xmm4	# tmp870, D.6135
	shufps	$221, %xmm5, %xmm1	#, tmp871, D.6135
	shufps	$136, %xmm5, %xmm4	#, tmp871, D.6135
	movaps	%xmm4, %xmm3	# D.6135, vect__65.449
	movaps	%xmm1, %xmm5	# D.6135, vect__67.454
	subps	%xmm0, %xmm3	# vect__57.441, vect__65.449
	addps	%xmm4, %xmm0	# D.6135, vect__69.457
	subps	%xmm2, %xmm5	# vect__60.444, vect__67.454
	addps	%xmm2, %xmm1	# vect__60.444, vect__71.458
	movaps	%xmm3, %xmm6	# vect__65.449, D.6135
	movaps	%xmm0, %xmm2	# vect__69.457, D.6135
	unpcklps	%xmm5, %xmm6	# vect__67.454, D.6135
	unpckhps	%xmm5, %xmm3	# vect__67.454, D.6135
	movups	%xmm6, (%rax,%rcx)	# D.6135, MEM[base: Fout2_48, index: ivtmp.533_404, offset: 0B]
	movups	%xmm3, 16(%rax,%rcx)	# D.6135, MEM[base: Fout2_48, index: ivtmp.533_404, offset: 16B]
	unpcklps	%xmm1, %xmm2	# vect__71.458, D.6135
	unpckhps	%xmm1, %xmm0	# vect__71.458, D.6135
	addq	$32, %rcx	#, ivtmp.533
	movups	%xmm2, -32(%rsi)	# D.6135, MEM[base: _28, offset: 0B]
	movups	%xmm0, -16(%rsi)	# D.6135, MEM[base: _28, offset: 16B]
	cmpl	%edi, %r9d	# bnd.425, ivtmp.529
# SUCC: 62 [50.0%]  (DFS_BACK,CAN_FALLTHRU) 63 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	jb	.L147	#,
# BLOCK 63 freq:15 seq:61
# PRED: 62 [50.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	16(%rsp), %rdi	# %sfp, Fout
	movl	%r11d, %esi	# ratio_mult_vf.426, D.6126
	subl	%r11d, 12(%rsp)	# ratio_mult_vf.426, %sfp
	salq	$3, %rsi	#, D.6126
	addq	%rsi, %rax	# D.6126, Fout2
	addq	%rsi, %rdx	# D.6126, tw1
	leaq	(%rdi,%rsi), %rcx	#, Fout
	movl	12(%rsp), %edi	# %sfp, m
	cmpl	%r11d, %r8d	# ratio_mult_vf.426, D.6129
# SUCC: 64 [66.7%]  (FALLTHRU,CAN_FALLTHRU) 48 [33.3%]  (CAN_FALLTHRU)
	je	.L151	#,
# BLOCK 64 freq:10 seq:62
# PRED: 63 [66.7%]  (FALLTHRU,CAN_FALLTHRU)
# SUCC: 65 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	leal	-1(%rdi), %esi	#,
# BLOCK 65 freq:17 seq:63
# PRED: 64 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 73 [100.0%]  (CAN_FALLTHRU)
.L146:
# SUCC: 66 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	leaq	8(%rdx,%rsi,8), %rsi	#, D.6131
# BLOCK 66 freq:68 seq:64
# PRED: 66 [75.0%]  (DFS_BACK,CAN_FALLTHRU) 65 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
.L149:
	movss	(%rdx), %xmm3	# MEM[base: tw1_1646, offset: 0B], D.6133
	addq	$8, %rdx	#, tw1
	addq	$8, %rax	#, Fout2
	addq	$8, %rcx	#, Fout
	movss	-4(%rdx), %xmm0	# MEM[base: tw1_1646, offset: 4B], D.6133
	movss	-8(%rax), %xmm1	# MEM[base: Fout2_1647, offset: 0B], D.6133
	movaps	%xmm3, %xmm2	# D.6133, D.6133
	movss	-4(%rax), %xmm4	# MEM[base: Fout2_1647, offset: 4B], D.6133
	movaps	%xmm0, %xmm5	# D.6133, D.6133
	mulss	%xmm1, %xmm2	# D.6133, D.6133
	mulss	%xmm4, %xmm5	# D.6133, D.6133
	mulss	%xmm4, %xmm3	# D.6133, D.6133
	mulss	%xmm0, %xmm1	# D.6133, D.6133
	subss	%xmm5, %xmm2	# D.6133, D.6133
	movaps	%xmm3, %xmm0	# D.6133, D.6133
	addss	%xmm1, %xmm0	# D.6133, D.6133
	movss	-8(%rcx), %xmm1	# MEM[base: Fout_1649, offset: 0B], MEM[base: Fout_1649, offset: 0B]
	subss	%xmm2, %xmm1	# D.6133, D.6133
	movss	%xmm1, -8(%rax)	# D.6133, MEM[base: Fout2_1647, offset: 0B]
	movss	-4(%rcx), %xmm1	# MEM[base: Fout_1649, offset: 4B], MEM[base: Fout_1649, offset: 4B]
	subss	%xmm0, %xmm1	# D.6133, D.6133
	movss	%xmm1, -4(%rax)	# D.6133, MEM[base: Fout2_1647, offset: 4B]
	addss	-8(%rcx), %xmm2	# MEM[base: Fout_1649, offset: 0B], D.6133
	addss	-4(%rcx), %xmm0	# MEM[base: Fout_1649, offset: 4B], D.6133
	movss	%xmm2, -8(%rcx)	# D.6133, MEM[base: Fout_1649, offset: 0B]
	movss	%xmm0, -4(%rcx)	# D.6133, MEM[base: Fout_1649, offset: 4B]
	cmpq	%rsi, %rdx	# D.6131, tw1
# SUCC: 66 [75.0%]  (DFS_BACK,CAN_FALLTHRU) 67 [25.0%]  (FALLTHRU)
	jne	.L149	#,
# BLOCK 67 freq:17 seq:65
# PRED: 66 [25.0%]  (FALLTHRU)
# SUCC: 48 [100.0%]  (CAN_FALLTHRU)
	jmp	.L151	#
# BLOCK 68 freq:39 seq:66
# PRED: 37 [28.0%]  (CAN_FALLTHRU)
.L223:
	movq	%rcx, %rax	# Fout, Fout
	movq	%r14, %rsi	# fin,
	addq	$8, %rax	#, D.6131
	subq	%rax, %r12	# D.6131, D.6132
	shrq	$3, %r12	#, D.6132
	leaq	8(,%r12,8), %rdx	#, D.6126
	call	memcpy	#
# SUCC: 41 [100.0%]  (CAN_FALLTHRU)
	jmp	.L144	#
# BLOCK 69 freq:28 seq:67
# PRED: 41 [20.0%]  (CAN_FALLTHRU)
.L138:
	movslq	12(%rsp), %r15	# %sfp, m
	leaq	264(%rbx), %rsi	#, tw2
	movq	16(%rsp), %rdx	# %sfp, Fout
	movq	%rsi, %rdi	# tw2, tw2
	movsd	.LC1(%rip), %xmm6	#, tmp1220
	leaq	0(,%r15,8), %rcx	#, D.6124
	movss	268(%rbx,%r15,8), %xmm7	# MEM[(struct  *)_78 + 4B], epi3$i
	movq	%rdx, %rax	# Fout, Fout
	addq	%rcx, %rax	# D.6124, ivtmp.559
# SUCC: 70 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	addq	%rax, %rcx	# ivtmp.559, ivtmp.562
# BLOCK 70 freq:313 seq:68
# PRED: 69 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 70 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L154:
	movss	(%rax), %xmm1	# MEM[base: _1544, offset: 0B], D.6133
	addq	$8, %rsi	#, tw2
	addq	$16, %rdi	#, tw2
	addq	$8, %rdx	#, Fout
	movss	4(%rax), %xmm4	# MEM[base: _1544, offset: 4B], D.6133
	pxor	%xmm15, %xmm15	# tmp1397
	addq	$8, %rax	#, ivtmp.559
	addq	$8, %rcx	#, ivtmp.562
	movss	-8(%rsi), %xmm3	# MEM[base: tw2_85, offset: 0B], D.6133
	movaps	%xmm1, %xmm0	# D.6133, D.6133
	movss	-4(%rsi), %xmm2	# MEM[base: tw2_85, offset: 4B], D.6133
	movaps	%xmm4, %xmm5	# D.6133, D.6133
	mulss	%xmm3, %xmm0	# D.6133, D.6133
	movss	-4(%rcx), %xmm8	# MEM[base: _1533, offset: 4B], D.6133
	mulss	%xmm2, %xmm5	# D.6133, D.6133
	mulss	%xmm4, %xmm3	# D.6133, D.6133
	movss	-16(%rdi), %xmm4	# MEM[base: tw2_98, offset: 0B], D.6133
	movaps	%xmm8, %xmm9	# D.6133, D.6133
	mulss	%xmm1, %xmm2	# D.6133, D.6133
	subss	%xmm5, %xmm0	# D.6133, D.6133
	addss	%xmm2, %xmm3	# D.6133, D.6133
	movss	-8(%rcx), %xmm2	# MEM[base: _1533, offset: 0B], D.6133
	movaps	%xmm2, %xmm5	# D.6133, D.6133
	mulss	%xmm4, %xmm5	# D.6133, D.6133
	movaps	%xmm3, %xmm1	# D.6133, D.6133
	movss	-12(%rdi), %xmm3	# MEM[base: tw2_98, offset: 4B], D.6133
	mulss	%xmm8, %xmm4	# D.6133, D.6133
	pxor	%xmm8, %xmm8	# D.6134
	cvtss2sd	-8(%rdx), %xmm8	# MEM[base: Fout_82, offset: 0B], D.6134
	mulss	%xmm3, %xmm9	# D.6133, D.6133
	mulss	%xmm2, %xmm3	# D.6133, D.6133
	subss	%xmm9, %xmm5	# D.6133, D.6133
	pxor	%xmm9, %xmm9	# D.6134
	addss	%xmm3, %xmm4	# D.6133, D.6133
	movaps	%xmm5, %xmm3	# D.6133, D.6133
	addss	%xmm0, %xmm3	# D.6133, D.6133
	movaps	%xmm4, %xmm2	# D.6133, D.6133
	addss	%xmm1, %xmm4	# D.6133, D.6133
	subss	%xmm2, %xmm1	# D.6133, D.6133
	cvtss2sd	%xmm3, %xmm9	# D.6133, D.6134
	mulsd	%xmm6, %xmm9	# tmp1220, D.6134
	subss	%xmm5, %xmm0	# D.6133, D.6133
	mulss	%xmm7, %xmm1	# epi3$i, D.6133
	mulss	%xmm7, %xmm0	# epi3$i, D.6133
	subsd	%xmm9, %xmm8	# D.6134, D.6134
	pxor	%xmm9, %xmm9	# D.6134
	cvtss2sd	%xmm4, %xmm9	# D.6133, D.6134
	mulsd	%xmm6, %xmm9	# tmp1220, D.6134
	cvtsd2ss	%xmm8, %xmm15	# D.6134, tmp1397
	movss	%xmm15, -8(%rax)	# tmp1397, MEM[base: _1544, offset: 0B]
	pxor	%xmm8, %xmm8	# D.6134
	pxor	%xmm15, %xmm15	# tmp1398
	cvtss2sd	-4(%rdx), %xmm8	# MEM[base: Fout_82, offset: 4B], D.6134
	subsd	%xmm9, %xmm8	# D.6134, D.6134
	cvtsd2ss	%xmm8, %xmm15	# D.6134, tmp1398
	movss	%xmm15, -4(%rax)	# tmp1398, MEM[base: _1544, offset: 4B]
	addss	-8(%rdx), %xmm3	# MEM[base: Fout_82, offset: 0B], D.6133
	addss	-4(%rdx), %xmm4	# MEM[base: Fout_82, offset: 4B], D.6133
	movss	%xmm3, -8(%rdx)	# D.6133, MEM[base: Fout_82, offset: 0B]
	movss	%xmm4, -4(%rdx)	# D.6133, MEM[base: Fout_82, offset: 4B]
	movss	-8(%rax), %xmm2	# MEM[base: _1544, offset: 0B], D.6133
	addss	%xmm1, %xmm2	# D.6133, D.6133
	movss	%xmm2, -8(%rcx)	# D.6133, MEM[base: _1533, offset: 0B]
	movss	-4(%rax), %xmm2	# MEM[base: _1544, offset: 4B], MEM[base: _1544, offset: 4B]
	subss	%xmm0, %xmm2	# D.6133, D.6133
	movss	%xmm2, -4(%rcx)	# D.6133, MEM[base: _1533, offset: 4B]
	movss	-8(%rax), %xmm2	# MEM[base: _1544, offset: 0B], MEM[base: _1544, offset: 0B]
	addss	-4(%rax), %xmm0	# MEM[base: _1544, offset: 4B], D.6133
	subss	%xmm1, %xmm2	# D.6133, D.6133
	movss	%xmm0, -4(%rax)	# D.6133, MEM[base: _1544, offset: 4B]
	movss	%xmm2, -8(%rax)	# D.6133, MEM[base: _1544, offset: 0B]
	subq	$1, %r15	#, m
# SUCC: 70 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 71 [9.0%]  (FALLTHRU)
	jne	.L154	#,
# BLOCK 71 freq:28 seq:69
# PRED: 70 [9.0%]  (FALLTHRU)
# SUCC: 48 [100.0%]  (CAN_FALLTHRU)
	jmp	.L151	#
# BLOCK 72 freq:28 seq:70
# PRED: 57 [33.3%]  (CAN_FALLTHRU) 44 [33.3%]  (CAN_FALLTHRU)
.L137:
	movl	8(%rsp), %r8d	# %sfp,
	movq	%rbx, %rdx	# cfg,
	movl	$1, %esi	#,
	movl	12(%rsp), %ecx	# %sfp,
	movq	16(%rsp), %rdi	# %sfp,
	call	kf_bfly_generic	#
# SUCC: 48 [100.0%]  (CAN_FALLTHRU)
	jmp	.L151	#
# BLOCK 73 freq:7 seq:71
# PRED: 60 [33.3%]  (CAN_FALLTHRU)
.L185:
	movq	16(%rsp), %rcx	# %sfp, Fout
# SUCC: 65 [100.0%]  (CAN_FALLTHRU)
	jmp	.L146	#
# BLOCK 74 freq:6 seq:72
# PRED: 59 [11.1%]  (CAN_FALLTHRU) 58 [10.0%]  (CAN_FALLTHRU)
.L145:
	movl	12(%rsp), %edi	# %sfp, m
	leal	-1(%rdi), %ecx	#, D.6126
	leaq	8(%rdx,%rcx,8), %rsi	#, D.6131
# SUCC: 75 [100.0%]  (FALLTHRU,CAN_FALLTHRU)
	movq	16(%rsp), %rcx	# %sfp, Fout
# BLOCK 75 freq:63 seq:73
# PRED: 74 [100.0%]  (FALLTHRU,CAN_FALLTHRU) 75 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
.L152:
	movss	(%rdx), %xmm3	# MEM[base: tw1_1696, offset: 0B], D.6133
	addq	$8, %rdx	#, tw1
	addq	$8, %rax	#, Fout2
	addq	$8, %rcx	#, Fout
	movss	-4(%rdx), %xmm0	# MEM[base: tw1_1696, offset: 4B], D.6133
	movss	-8(%rax), %xmm1	# MEM[base: Fout2_1697, offset: 0B], D.6133
	movaps	%xmm3, %xmm2	# D.6133, D.6133
	movss	-4(%rax), %xmm4	# MEM[base: Fout2_1697, offset: 4B], D.6133
	movaps	%xmm0, %xmm5	# D.6133, D.6133
	mulss	%xmm1, %xmm2	# D.6133, D.6133
	mulss	%xmm4, %xmm5	# D.6133, D.6133
	mulss	%xmm4, %xmm3	# D.6133, D.6133
	mulss	%xmm0, %xmm1	# D.6133, D.6133
	subss	%xmm5, %xmm2	# D.6133, D.6133
	movaps	%xmm3, %xmm0	# D.6133, D.6133
	addss	%xmm1, %xmm0	# D.6133, D.6133
	movss	-8(%rcx), %xmm1	# MEM[base: Fout_1699, offset: 0B], MEM[base: Fout_1699, offset: 0B]
	subss	%xmm2, %xmm1	# D.6133, D.6133
	movss	%xmm1, -8(%rax)	# D.6133, MEM[base: Fout2_1697, offset: 0B]
	movss	-4(%rcx), %xmm1	# MEM[base: Fout_1699, offset: 4B], MEM[base: Fout_1699, offset: 4B]
	subss	%xmm0, %xmm1	# D.6133, D.6133
	movss	%xmm1, -4(%rax)	# D.6133, MEM[base: Fout2_1697, offset: 4B]
	addss	-8(%rcx), %xmm2	# MEM[base: Fout_1699, offset: 0B], D.6133
	addss	-4(%rcx), %xmm0	# MEM[base: Fout_1699, offset: 4B], D.6133
	movss	%xmm2, -8(%rcx)	# D.6133, MEM[base: Fout_1699, offset: 0B]
	movss	%xmm0, -4(%rcx)	# D.6133, MEM[base: Fout_1699, offset: 4B]
	cmpq	%rsi, %rdx	# D.6131, tw1
# SUCC: 75 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 76 [9.0%]  (FALLTHRU)
	jne	.L152	#,
# BLOCK 76 freq:6 seq:74
# PRED: 75 [9.0%]  (FALLTHRU)
# SUCC: 48 [100.0%]  (CAN_FALLTHRU)
	jmp	.L151	#
	.cfi_endproc
.LFE54:
	.size	kiss_fft, .-kiss_fft
	.section	.text.unlikely
.LCOLDE13:
	.text
.LHOTE13:
	.section	.text.unlikely
.LCOLDB14:
	.text
.LHOTB14:
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
.LCOLDE14:
	.text
.LHOTE14:
	.section	.text.unlikely
.LCOLDB15:
	.text
.LHOTB15:
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
.L235:
	movl	%edi, %ecx	# n, n
	testb	$1, %dil	#, n
# SUCC: 4 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 7 [9.0%]  (CAN_FALLTHRU)
	jne	.L228	#,
# BLOCK 4 freq:9100 seq:2
# PRED: 3 [91.0%]  (FALLTHRU,CAN_FALLTHRU) 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L229:
	movl	%ecx, %edx	# n, tmp100
	shrl	$31, %edx	#, tmp100
	addl	%edx, %ecx	# tmp100, tmp101
	sarl	%ecx	# n
	testb	$1, %cl	#, n
# SUCC: 4 [91.0%]  (DFS_BACK,CAN_FALLTHRU) 5 [9.0%]  (FALLTHRU)
	je	.L229	#,
# BLOCK 5 freq:819 seq:3
# PRED: 4 [9.0%]  (FALLTHRU)
# SUCC: 7 [100.0%]  (CAN_FALLTHRU,LOOP_EXIT)
	jmp	.L228	#
# BLOCK 6 freq:9100 seq:4
# PRED: 7 [91.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L243:
	movl	%ecx, %eax	# n, tmp153
	sarl	$31, %ecx	#, tmp115
	imull	%r8d	# tmp150
	subl	%ecx, %edx	# tmp115, n
# SUCC: 7 [100.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU)
	movl	%edx, %ecx	# n, n
# BLOCK 7 freq:10000 seq:5
# PRED: 3 [9.0%]  (CAN_FALLTHRU) 6 [100.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 5 [100.0%]  (CAN_FALLTHRU,LOOP_EXIT)
.L228:
	movl	%ecx, %eax	# n, tmp152
	imull	%r8d	# tmp150
	movl	%ecx, %eax	# n, tmp107
	sarl	$31, %eax	#, tmp107
	subl	%eax, %edx	# tmp107, tmp104
	leal	(%rdx,%rdx,2), %eax	#, tmp110
	cmpl	%eax, %ecx	# tmp110, n
# SUCC: 6 [91.0%]  (CAN_FALLTHRU) 8 [9.0%]  (FALLTHRU)
	je	.L243	#,
# BLOCK 8 freq:900 seq:6
# PRED: 7 [9.0%]  (FALLTHRU)
# SUCC: 10 [100.0%]  (CAN_FALLTHRU,LOOP_EXIT)
	jmp	.L230	#
# BLOCK 9 freq:9100 seq:7
# PRED: 10 [91.0%]  (CAN_FALLTHRU)
	.p2align 4,,10
	.p2align 3
.L244:
	movl	%ecx, %eax	# n, tmp156
	sarl	$31, %ecx	#, tmp137
	imull	%esi	# tmp151
	sarl	%edx	# tmp136
	subl	%ecx, %edx	# tmp137, n
# SUCC: 10 [100.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU)
	movl	%edx, %ecx	# n, n
# BLOCK 10 freq:10000 seq:8
# PRED: 9 [100.0%]  (FALLTHRU,DFS_BACK,CAN_FALLTHRU) 8 [100.0%]  (CAN_FALLTHRU,LOOP_EXIT)
.L230:
	movl	%ecx, %eax	# n, tmp155
	imull	%esi	# tmp151
	movl	%ecx, %eax	# n, tmp128
	sarl	$31, %eax	#, tmp128
	sarl	%edx	# tmp127
	subl	%eax, %edx	# tmp128, tmp124
	leal	(%rdx,%rdx,4), %eax	#, tmp131
	cmpl	%eax, %ecx	# tmp131, n
# SUCC: 9 [91.0%]  (CAN_FALLTHRU) 11 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	je	.L244	#,
# BLOCK 11 freq:900 seq:9
# PRED: 10 [9.0%]  (FALLTHRU,CAN_FALLTHRU,LOOP_EXIT)
	cmpl	$1, %ecx	#, n
# SUCC: 13 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT) 12 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	jle	.L234	#,
# BLOCK 12 freq:819 seq:10
# PRED: 11 [91.0%]  (FALLTHRU,CAN_FALLTHRU)
	addl	$1, %edi	#, n
# SUCC: 3 [100.0%]  (DFS_BACK,CAN_FALLTHRU)
	jmp	.L235	#
# BLOCK 13 freq:81 seq:11
# PRED: 11 [9.0%]  (CAN_FALLTHRU,LOOP_EXIT)
.L234:
	movl	%edi, %eax	# n,
# SUCC: EXIT [100.0%] 
	ret
	.cfi_endproc
.LFE56:
	.size	kiss_fft_next_fast_size, .-kiss_fft_next_fast_size
	.section	.text.unlikely
.LCOLDE15:
	.text
.LHOTE15:
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1071644672
	.align 8
.LC4:
	.long	0
	.long	1073741824
	.align 8
.LC5:
	.long	0
	.long	1074266112
	.align 8
.LC6:
	.long	0
	.long	1127219200
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC7:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC8:
	.long	0
	.long	1072693248
	.align 8
.LC9:
	.long	1413754136
	.long	-1072094725
	.section	.rodata.cst16
	.align 16
.LC10:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.ident	"GCC: (GNU) 4.9.2 20150304 (prerelease)"
	.section	.note.GNU-stack,"",@progbits
