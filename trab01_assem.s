# 63. Criar um algoritmo que imprima a soma de n primeiros termos da serie de fibonacci 
# OBS: (2 < n < 40 e, caso nao seja, deve ser novamente solicitado).

.data
	msg1: .asciiz "\n Digite a posicao do termo na sequencia: "
	msg2: .asciiz "\n A posicao esta fora do intervalo, digite outro numero: "
	msg3: .asciiz "\n Termos do intervalo: "
.text

main:
	li $t1, 1# Variavel A
	li $t2, 1 # Variavel B
	li $t4, 2 # Acumulador
	
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	add $t0, $v0, 0
	
	ble $t0, 2, erro
	bge $t0, 40, erro
	sub $t0, $t0, 2
	j loop


loop:
	add $t3, $t1, $t2
	add $t4, $t4, $t3
	
	add $t1, $t2, 0
	add $t2, $t3, 0
	
	sub $t0, $t0, 1
	
	bgtz $t0, loop
	j fimse


erro:
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 5
	syscall
	add $t0, $v0, 0

	ble $t0, 2, erro
	bge $t0, 40, erro
	sub $t0, $t0, 2
	j loop
	
fimse:
	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 1
	add $a0, $t4, 0
	syscall