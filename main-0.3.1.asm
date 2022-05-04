# v-0.3.1

# Leyenda--------------------------------------------------------------------------------
# s1 (Sumando 1)
# s3 (Sumando 2)
# s4 (Suma total)
# s2 (Elección de operación)
# x1 ((ra) Resultado tipo operación)
# t1 Primera Opción (Suma)
# t2 Segunda Opción (resta)
# t3 Tercera Opción (Multiplicación)
# t4 Cuarta Opción (División)
#----------------------------------------------------------------------------------------

.globl ___start

.data

mensaje1:
	.string "Bienvenido, introduce el primer número: "
	.byte 0

mensaje2:
	.string "Que operación quieres realizar (Suma = (1) / Resta = (2) / Multiplicación = (3) / División = (4)): "
	.byte 0
	
mensaje3:
	.string "Introduce el segundo número: "
	.byte 0

mensaje4:
	.string "El resultado es: "
	.byte 0

.text 

___start:

	# Print---------------------------------------------------------------------------------
	la a0,mensaje1		#Añadir contenido etiqueta al registro
	li a7,4			#Print por pantalla  (a7 registro sistema(?), 4)
	ecall			#Llamada al sistema
	# Input---------------------------------------------------------------------------------
	li a7,5			#Pedido por pantalla de integer (5)
	ecall			#Llamada al sistema
	mv s1,a0 		#Mover valor introducido de a0 en registro s1
	#---------------------------------------------------------------------------------------
	
	# Print---------------------------------------------------------------------------------
	la a0,mensaje2		#Añadir contenido etiqueta al registro
	li a7,4			#Print por pantalla (4)
	ecall			#Llamada al sistema
	# Input---------------------------------------------------------------------------------
	li a7,5			#Pedido por pantalla de integer (5)
	ecall			#Llamada al sistema
	mv s2,a0		#Mover valor introducido de a0 en registro s2
	#---------------------------------------------------------------------------------------
	
	# Print---------------------------------------------------------------------------------
	la a0,mensaje3		#Añadir contenido etiqueta al registro
	li a7,4			#Print por pantalla  (a7 registro sistema(?), 4)
	ecall			#Llamada al sistema
	# Input---------------------------------------------------------------------------------
	li a7,5			#Pedido por pantalla de integer (5)
	ecall			#Llamada al sistema
	mv s3,a0		#Mover valor introducido de a0 en registro s2
	#---------------------------------------------------------------------------------------
	
	#Condiciones----------------------------------------------------------------------------
	
	li t1,1				#Añadir valores de comparativa
	li t2,2				#Añadir valores de comparativa
	li t3,3				#Añadir valores de comparativa
	li t4,4				#Añadir valores de comparativa

	beq t1, s2, Suma		#Condición y salto
	beq t2, s2, Resta		#Condición y salto
	beq t3, s2, Multiplicacion	#Condición y salto
	beq t4, s2, Division		#Condición y salto
	
	#---------------------------------------------------------------------------------------

Suma:
	li x1,1			#Almacenar estado (debug)
	
	add s4,s3,s1
	j Intermission
	
Resta:
	li x1,2			#Almacenar estado (debug)
	
	sub s4,s1,s3
	j Intermission
	
Multiplicacion:

	li x1,3			#Almacenar estado (debug)
	
	mul s4,s3,s1
	j Intermission
	
Division:

	li x1,3			#Almacenar estado (debug)
	
	div s4,s1,s3
	j Intermission
	
Intermission:

	# Print---------------------------------------------------------------------------------
	la a0,mensaje4		#Añadir contenido etiqueta al registro
	li a7,4			#Print por pantalla  (a7 registro sistema(?), 4)
	ecall			#Llamada al sistema
	
	mv a0,s4
	li a7,93	
	ecall
	
	j Apagar
	
Apagar:

	li a7,10		#Cerrar programa
	ecall			#Llamada al sistema
