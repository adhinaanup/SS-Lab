; Program to add two 16-bit numbers from memory
; and store carry flag and result to another memory location

.MODEL SMALL
.STACK 100H

.DATA
    ; Assume values are preloaded at memory addresses 3000h and 3002h

.CODE
MAIN PROC
    MOV SI, 3000H        ; Source index points to first number
    MOV DI, 4002H        ; Destination index for storing result

    MOV AX, [SI]         ; Load first 16-bit number into AX
    INC SI               ; Move to next word
    INC SI
    MOV BX, [SI]         ; Load second 16-bit number into BX
    ADD AX, BX           ; Add BX to AX

    JNC NO_CARRY         ; Jump if no carry
    MOV [DI], 0001H      ; Store 1 if carry occurred
    JMP STORE_RESULT

NO_CARRY:
    MOV [DI], 0000H      ; Store 0 if no carry

STORE_RESULT:
    INC DI               ; Move to next word
    INC DI
    MOV [DI], AX         ; Store result in memory
    HLT                  ; Stop execution

MAIN ENDP
END MAIN
