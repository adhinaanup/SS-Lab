; Assembly program to search a 16-bit number in a list
; If found, set flag and store index (memory offset)

.MODEL SMALL
.STACK 100H

.DATA
    ; Assume:
    ; [3000] – 16-bit number to search
    ; [3002] – count of 16-bit values to compare against
    ; [3003] onward – 16-bit values (data list)

.CODE
MAIN PROC
    MOV SI, 3000H        ; Source pointer
    MOV DI, 4000H        ; Destination pointer for result

    MOV [DI], 0000H      ; Initialize result flag to 0

    MOV AX, [SI]         ; Load value to search
    INC SI
    INC SI               ; Move to count byte

    MOV CL, [SI]         ; Load count of comparisons into CL
    INC SI               ; Move to beginning of list

NEXT:
    CMP AX, [SI]         ; Compare search value with list item
    JNZ NOT_FOUND        ; If not equal, jump

    MOV [DI], 0001H      ; Set flag to 1 (found)
    INC DI
    MOV [DI], SI         ; Store address of found item
    JMP END_SEARCH

NOT_FOUND:
    INC SI               ; Move to next word
    INC SI
    DEC CL               ; Decrease comparison count
    CMP CL, 00H
    JNC NEXT             ; Continue loop if not zero

END_SEARCH:
    HLT                  ; End program

MAIN ENDP
END MAIN
