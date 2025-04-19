; Assembly program to divide two 16-bit numbers from memory
; Result: Quotient in AX, Remainder in DX
; Stores both in memory

.MODEL SMALL
.STACK 100H

.DATA
    ; Assumes: 3000H holds dividend, 3002H holds divisor

.CODE
MAIN PROC
    MOV SI, 3000H        ; SI points to source memory
    MOV DI, 4000H        ; DI points to result memory

    MOV AX, [SI]         ; Load dividend into AX
    INC SI
    INC SI               ; Move SI to divisor
    MOV BX, [SI]         ; Load divisor into BX

    XOR DX, DX           ; Clear DX before DIV (high part of dividend)
    DIV BX               ; Unsigned division: AX = AX / BX, remainder -> DX

    MOV [DI], AX         ; Store quotient
    INC DI
    INC DI
    MOV [DI], DX         ; Store remainder

    HLT                  ; Stop execution

MAIN ENDP
END MAIN
