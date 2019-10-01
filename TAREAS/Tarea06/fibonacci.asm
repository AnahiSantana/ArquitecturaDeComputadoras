
.text
	ori $a0, $zero, 0x1001	#Dirección para un Stack
	sll $a0,$a0,16
	
	addi $v0, $zero, 0	#RESULTADO 
	addi $s0, $zero, 5	#s0 = n 
	
	jal fibonacci
	
	j end
	
fibonacci:			#Función recursiva 
	sw $ra, 0($a0)		#PUSH al stack 
	sw $s0, 4($a0)
	slti $t1, $s0, 2	# n < 2 ?
	
	bne $t1, 1, else	# if(n < 2)
	addi $t1, $zero, 0	
	
	add $v0, $v0, $s0	#v0 += s0
	
	jr $ra			
else:				#else 

	addi $a0, $a0, 8	#Mover el apuntador al stack
	addi $s0, $s0, -1	#S0 -= 1
	
	jal fibonacci		# Llamar a finonacci(n-1)
	
	addi $a0, $a0, -8	#Retroceder en el stack
	lw $ra, 0($a0)		#Hacer PULL
	lw $s0, 4($a0)
	addi $a0, $a0, 8	#Preparar el stack
	addi $s0, $s0, -2	# S0 -= 2
	
	jal fibonacci		# Llamar a finonacci(n-2)
	
	addi $a0, $a0, -8	#Retorceder en el Stack
	lw $ra, 0($a0)		#hacer PULL
	lw $s0, 4($a0)
	
	jr $ra
		
end:
