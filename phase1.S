.global _start
_start:
	li x10, 42 # load a value
	addi x11, x10, 3
	add x11, x10, x11
	addi x12, x0, 7
