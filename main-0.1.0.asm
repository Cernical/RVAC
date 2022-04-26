# Leyenda--------------------------------------------------------------------------------
# s1 (Sumando 1)
# s3 (Sumando 2)
# s2 (Elección de operación)
# x1 ((ra) Resultado tipo operación)
#----------------------------------------------------------------------------------------

.globl ___start

.data

mensaje1:
	.string "Bienvenido, introduce el primer número: "
	.byte 0

mensaje2:
	.string "Que operación quieres realizar (Suma = (1)/Resta = (2)): "
	.byte 0
	
.text 

___start:

	la a0,mensaje1		#Añadir contenido etiqueta al registro
	li a7,4			#Print por pantalla  (a7 registro sistema(?), 4)
	ecall			#Llamada al sistema
	
	li a7,5			#Pedido por pantalla de integer (5)
	ecall			#Llamada al sistema
	mv s1,a0 		#Mover valor introducido de a0 en registro s1
	
	la a0,mensaje2		#Añadir contenido etiqueta al registro
	li a7,4			#Print por pantalla (4)
	ecall			#Llamada al sistema
	
	li a7,5			#Pedido por pantalla de integer (5)
	ecall			#Llamada al sistema
	mv s2,a0
	
	#Condiciones----------------------------------------------------------------------------
	
	li t1,1			#Añadir valores de comparativa
	li t2,2			#Añadir valores de comparativa

	beq t1, s2, Suma	#Condición y salto
	beq t2, s2, Resta	#Condición y salto
	
	#---------------------------------------------------------------------------------------
	
	#j Apagar		#salto

Suma:
	li x1,1			#Almacenar estado
	
	li a7,10		#Cerrar programa
	ecall			#Llamada al sistema
	
Resta:
	li x1,2			#Almacenar estado
	
	li a7,10		#Cerrar programa
	ecall			#Llamada al sistema

Apagar:

	li a7,10		#Cerrar programa
	ecall			#Llamada al sistema
