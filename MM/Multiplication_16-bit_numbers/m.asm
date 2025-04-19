; Assembly program to multiply two 16-bit numbers from memory
; and store the 32-bit result (AX:DX) in memory

.MODEL SMALL
.STACK 100H

.DATA
    ; Assume first number at 3000H and second at 3002H

.CODE
MAIN PROC
    MOV SI, 3000H        ; Load base address of operands
    MOV DI, 4000H        ; Load base address to store result

    MOV AX, [SI]         ; Load first operand into AX
    INC SI
    INC SI               ; Move to second operand
    MOV BX, [SI]         ; Load second operand into BX

    MUL BX               ; Unsigned multiplication: DX:AX = AX * BX

    MOV [DI], AX         ; Store lower word (AX) of result
    INC DI
    INC DI
    MOV [DI], DX         ; Store higher word (DX) of result

    HLT                  ; Stop execution

MAIN ENDP
END MAIN
