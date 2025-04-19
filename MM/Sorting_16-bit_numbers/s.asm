; Assembly program to perform bubble sort on an array of 16-bit integers
; Count of elements is stored at 4000H
; Data starts at 4002H
; Sorted in ascending order

.MODEL SMALL
.STACK 100H

.DATA
    ; 4000H -> Count (N)
    ; 4002H onward -> N 16-bit integers

.CODE
MAIN PROC
    MOV SI, 4000H        ; SI points to the count
    MOV BX, [SI]         ; BX = Count
    DEC BX               ; Outer loop runs (N - 1) times

OUTER_LOOP:
    MOV SI, 4000H        ; Reset SI to beginning
    MOV CX, [SI]         ; CX = Count
    DEC CX               ; Inner loop runs (N - 1) times

    INC SI               ; Point SI to first element (4002H)

INNER_LOOP:
    MOV AX, [SI]         ; AX = current element
    INC SI
    INC SI
    CMP AX, [SI]         ; Compare with next element
    JC NO_SWAP           ; If AX < [SI], no swap needed

    XCHG AX, [SI]        ; Swap AX with next
    DEC SI
    DEC SI
    XCHG AX, [SI]        ; Swap AX with previous

NO_SWAP:
    INC SI
    INC SI
    DEC CX
    JNZ INNER_LOOP       ; Repeat inner loop

    DEC BX
    JNZ OUTER_LOOP       ; Repeat outer loop

    HLT                  ; Stop program

MAIN ENDP
END MAIN
