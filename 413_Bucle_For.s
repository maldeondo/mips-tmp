.data
.org 0x200

vecA: .byte 0, 1, 2, 3, 4, 5, 6, 7
vecB: .byte 1, 1, 1, 1, 1, 1, 1, 1
vecS: .space 8

.text
.org 0x0

MAIN:   daddi   r1,r0,0         ; i=0
FOR:    slti    r2,r1,8         ; for (i=0; i<8; i++) {
        beqz    r2,FIN          ;   ..................
        lb      r2,vecA(r1)     ;   r2=vectorA[i]
        lb      r3,vecB(r1)     ;   r3=vectorB [i]
        dadd    r4,r2,r3        ;   vectorSum[i]=vectorA[i]+
                                ;            vectorB[i]
        sb      r4,vecS(r1)     ;   .........
        daddi   r1,r1,1         ; }
        j       FOR
FIN:    halt

