.data
.org 0x200

vecA: .byte 0, 1, 2, 3, 4, 5, 6, 7
vecB: .byte 1, 1, 1, 1, 1, 1 ,1, 1
vecS: .space 8

.text
.org 0x0

MAIN:   daddi r1,r0,8           ; i=8
WHILE:  beqz  r1,FIN            ; while (i>0) {
        daddi r1,r1,-1          ;   i=i-1
        lb    r2,vecA(r1)       ;   r2=vectorA[i]
        lb    r3,vecB(r1)       ;   r3=vectorB [i]
        dadd  r4,r2,r3          ;   vectorSum[i]=vectorA[i]+
                                ;            vectorB[i]
        sb    r4,vecS(r1)       ;   .........
        j     WHILE             ; }
FIN:    halt
