	.text
	.file	"sort.c"
	.globl	mergesort
	.p2align	4, 0x90
	.type	mergesort,@function
mergesort:
	.cfi_startproc
	pushq	%rbp
.Lcfi0:
	.cfi_def_cfa_offset 16
.Lcfi1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi2:
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	xorl	%eax, %eax
	movl	%eax, %r8d
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	movq	-24(%rbp), %rcx
	movq	-32(%rbp), %rdx
	movq	%rdx, -40(%rbp)
	movq	%r8, %rdx
	movq	-40(%rbp), %r8
	callq	sortsub 
	addq	$48, %rsp
	popq	%rbp
	retq
.Lfunc_end0:
	.size	mergesort, .Lfunc_end0-mergesort
	.cfi_endproc

	.p2align	4, 0x90
	.type	sortsub,@function
sortsub: #here starts the sortsub function
	.cfi_startproc #start of a function 
	pushq	%rbp # pushing a 64-bit base pointer into a stack
.Lcfi3:
	.cfi_def_cfa_offset 16 #change of a stack pointer by 16 bytes from the current stack pointer
.Lcfi4:
	.cfi_offset %rbp, -16 #change previous value of the register:rbp by -16 bytes
	movq	%rsp, %rbp #move the value of 64bit register 'rsp' to rbp
.Lcfi5:
	.cfi_def_cfa_register %rbp #modifies a rule for computing cfa, from now on the register:rbp will be used instead of the old one. The offset remains the same 
	subq	$64, %rsp #subtracting 64 from the value of rsp
	movq	%rdi, -8(%rbp) #move the value of 64bit register rdi into the 0th argument(in c code: arr) 
	movq	%rsi, -16(%rbp) #move the value of 64bit register rsi into the 1st argument(in c code: size)
	movq	%rdx, -24(%rbp) #move the value of 64bit register rdx into the 2nd argument(in c code: left)
	movq	%rcx, -32(%rbp) #move the value of 64bit register rcx into the 3rd argument(in c code: right)
	movq	%r8, -40(%rbp) #move the value of 64bit register r8 into the 4th argument(in c code: comp)
	movq	-32(%rbp), %rcx #move the value of argument:right to the value of 64bit register rcx
	subq	-24(%rbp), %rcx #subtract the value of argument:left from the value of 64bit register rcx, ie., right - left
	cmpq	$1, %rcx #compare to see if the value of 64bit register rcx:right - left, is greater than 1
	jle	.LBB1_2 #jumps to (.LBB1_2:line 92) if the value of 64bit register rcs:right - left is less than or equal to 1
	movl	$2, %eax #moving the value '2' into the result register:eax
	movl	%eax, %ecx #moving the value of result register:eax, 2, into register ecx, ecx value is 2
	movq	-24(%rbp), %rdx  #move the value of argument:left into register:rdx
	movq	-32(%rbp), %rsi #move the value of argument:right into register:rsi
	subq	-24(%rbp), %rsi #subtract the value of argument:left from the value of register:rsi(known as argument:right). rsi is now (right-left)
	movq	%rsi, %rax #move the value of 64bit register rsi into register:rax
	movq	%rdx, -56(%rbp) #move the value of 64bit register:rdx(arguement:left) into the local variable 1
	cqto #convert quad to oct
	idivq	%rcx # divide (right-left) by 2
	movq	-56(%rbp), %rcx #move the value of the local variable 1 into the 64bit register:rcx
	addq	%rax, %rcx  #add the value of 64bit register:rax(argument:left) to #rcx (right - left)/2, and result in rcx
	movq	%rcx, -48(%rbp) #move the value of 64bit register:rcx into the local variable 0(mid)
	movq	-8(%rbp), %rdi #move the value of the 0th argument(arr) to the 64bit register rdi 
	movq	-16(%rbp), %rsi #move the value of the 1st argument(size) to the 64bit register rsi
	movq	-24(%rbp), %rax #move the value of the 2nd argument(left) to the 64bit register rax
	movq	-48(%rbp), %rcx #move the value of the 0th local variable() to the 64bit register rcx
	movq	-40(%rbp), %r8 #move the value of the 4th argument(comp) to the 64bit register r8
	movq	%rax, %rdx #move the value of register:rax(argument:left) into the value of register:rdx(argument:size
	callq	sortsub #recursive call of sortsub
	movq	-8(%rbp), %rdi #move the value of the 0th argument(arr) to the 64bit register rdi
	movq	-16(%rbp), %rsi #move the value of the 1st argument(size) to the 64bit register rsi
	movq	-48(%rbp), %rdx #move the value of the 0 local variable(mid) to the 64bit register rdx
	movq	-32(%rbp), %rcx #move the value of the 3rd argument(right) to the 64bit register rcx
	movq	-40(%rbp), %r8 #move the value of the 4th argument(comp) to the 64bit register r8
	callq	sortsub #recurisve call of sortsub
	movq	-8(%rbp), %rdi  #move the value of the 0th argument(arr) to the 64bit register rdi
	movq	-16(%rbp), %rsi #move the value of the 1st argument(size) to the 64bit register rsi
	movq	-24(%rbp), %rdx #move the value of the 2nd argument(left) to the 64bit register rdx
	movq	-48(%rbp), %rcx #move the value of the 0th local variable(mid) to the 64bit register rcx
	movq	-32(%rbp), %r8 #move the value of the 3rd argument(right) to the 64bit register r8
	movq	-40(%rbp), %r9 #move the value of the 4th argument(comp) to the 64bit register r9
	callq	merge #call the merge function
.LBB1_2:
	addq	$64, %rsp #add the value 64 to the value of 64bit register:rsp
	popq	%rbp #pops out the 0th value of the stack of the register:rbp
	retq #returns 
.Lfunc_end1: #end function
	.size	sortsub, .Lfunc_end1-sortsub
	.cfi_endproc

	.p2align	4, 0x90
	.type	merge,@function
merge:
	.cfi_startproc
	pushq	%rbp
.Lcfi6:
	.cfi_def_cfa_offset 16
.Lcfi7:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi8:
	.cfi_def_cfa_register %rbp
	subq	$96, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	%r8, -40(%rbp)
	movq	%r9, -48(%rbp)
	movq	-40(%rbp), %rcx
	subq	-24(%rbp), %rcx
	movq	%rcx, -56(%rbp)
	movq	-56(%rbp), %rcx
	imulq	-16(%rbp), %rcx
	movq	%rcx, %rdi
	callq	malloc
	movq	%rax, -64(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	$0, -88(%rbp)
.LBB2_1:
	movb	$1, %al
	movq	-72(%rbp), %rcx
	cmpq	-32(%rbp), %rcx
	movb	%al, -89(%rbp)
	jl	.LBB2_3
	movq	-80(%rbp), %rax
	cmpq	-40(%rbp), %rax
	setl	%cl
	movb	%cl, -89(%rbp)
.LBB2_3:
	movb	-89(%rbp), %al
	testb	$1, %al
	jne	.LBB2_4
	jmp	.LBB2_10
.LBB2_4:
	movq	-80(%rbp), %rax
	cmpq	-40(%rbp), %rax
	jge	.LBB2_7
	movq	-72(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jge	.LBB2_8
	movq	-48(%rbp), %rax
	movq	-8(%rbp), %rcx
	movq	-16(%rbp), %rdx
	imulq	-72(%rbp), %rdx
	addq	%rdx, %rcx
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rsi
	imulq	-80(%rbp), %rsi
	addq	%rsi, %rdx
	movq	%rcx, %rdi
	movq	%rdx, %rsi
	callq	*%rax
	cmpq	$0, %rax
	jg	.LBB2_8
.LBB2_7:
	movq	-64(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	-88(%rbp), %rdx
	movq	%rdx, %rsi
	addq	$1, %rsi
	movq	%rsi, -88(%rbp)
	imulq	%rdx, %rcx
	addq	%rcx, %rax
	movq	-8(%rbp), %rcx
	movq	-16(%rbp), %rdx
	movq	-72(%rbp), %rsi
	movq	%rsi, %rdi
	addq	$1, %rdi
	movq	%rdi, -72(%rbp)
	imulq	%rsi, %rdx
	addq	%rdx, %rcx
	movq	-16(%rbp), %rdx
	movq	%rax, %rdi
	movq	%rcx, %rsi
	callq	memcpy
	jmp	.LBB2_9
.LBB2_8:
	movq	-64(%rbp), %rax
	movq	-16(%rbp), %rcx
	movq	-88(%rbp), %rdx
	movq	%rdx, %rsi
	addq	$1, %rsi
	movq	%rsi, -88(%rbp)
	imulq	%rdx, %rcx
	addq	%rcx, %rax
	movq	-8(%rbp), %rcx
	movq	-16(%rbp), %rdx
	movq	-80(%rbp), %rsi
	movq	%rsi, %rdi
	addq	$1, %rdi
	movq	%rdi, -80(%rbp)
	imulq	%rsi, %rdx
	addq	%rdx, %rcx
	movq	-16(%rbp), %rdx
	movq	%rax, %rdi
	movq	%rcx, %rsi
	callq	memcpy
.LBB2_9:
	jmp	.LBB2_1
.LBB2_10:
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rcx
	imulq	-24(%rbp), %rcx
	addq	%rcx, %rax
	movq	-64(%rbp), %rsi
	movq	-56(%rbp), %rcx
	imulq	-16(%rbp), %rcx
	movq	%rax, %rdi
	movq	%rcx, %rdx
	callq	memcpy
	movq	-64(%rbp), %rdi
	callq	free
	addq	$96, %rsp
	popq	%rbp
	retq
.Lfunc_end2:
	.size	merge, .Lfunc_end2-merge
	.cfi_endproc


	.ident	"clang version 5.0.1 (tags/RELEASE_501/final)"
	.section	".note.GNU-stack","",@progbits


https://en.wikibooks.org/wiki/X86_Assembly/GAS_Syntax
https://www3.nd.edu/~dthain/courses/cse40243/fall2015/intel-intro.html
https://stackoverflow.com/questions/10343155/x86-assembly-handling-the-idiv-instruction 
https://stackoverflow.com/questions/7534420/gas-explanation-of-cfi-def-cfa-offset
http://sourceware.org/binutils/docs/as/CFI-directives.html