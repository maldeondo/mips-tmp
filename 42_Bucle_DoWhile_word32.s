; APARTADO 4.1.1
;   Suma de dos vectores de tamaño WORD32, dejando el resultado en un tercero.

; Dirección de comienzo de las variables
	.data
	.org 0x200
	
vectorA:	.word32  0, 1, 2, 3, 4, 5, 6, 7
vectorB:	.word32  1, 1, 1, 1, 1, 1, 1, 1
vectorSum:      .space 32
; El simulador WinMIPS no permite dar a las constantes un nombre (etiqueta), 
; lo que obliga a utilizar la constante (8) en el código

;  Dirección de comienzo del código
	.text
        .org 0x0

MAIN: 	 daddi	r1,r0,32		; i = 8
DOWHILE: daddi	r1,r1,-4		; i = i - 1
	 lw	r2,vectorA(r1)		; r2 = vectorA[i]
  	 lw	r3,vectorB(r1)		; r3 = vectorB [i]
	 dadd	r4,r2,r3		; r4 = vectorA[i] + vectorB[i]
	 sw	r4,vectorSum(r1)	; vectorSum [i] = r4
	 bnez	r1,DOWHILE		; do while (i > 0)
	 halt
