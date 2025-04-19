DATA SEGMENT
    			MSG1 DB 10, 13, "ENTER  THE STRING : $"
    			MSG2 DB 10, 13, “REVERSED STRING : $"
   		 	STR1 DB 1 DUP(0)
	DATA ENDS
	CODE SEGMENT
	ASSUME CS: CODE, DS: DATA
	START:
    			MOV AX, DATA
    			MOV DS, AX
    			LEA DX, MSG1
    			MOV AH, 09H
    			INT 21H
    			LEA SI, STR1
    			LEA DI, STR1
    			MOV AH, 01H
	NEXT:
    			INT 21H
    			CMP AL, 0DH
    			JE TERMINATE
    			MOV [DI], AL
    			INC DI
    			JMP NEXT
	TERMINATE:
    			MOV AL, "'"
    			MOV [DI], AL
    			INC DI
    			MOV AL, "."
		      MOV [DI], AL
	    	  INC DI
	   	    MOV AL, "$"
          MOV [DI], AL
          DEC DI
 		      DEC DI
    		  DEC DI
DOTHIS:
    		MOV AL, [SI]
    		XCHG AL, [DI]
    		XCHG AL, [SI]
    		INC SI
    		DEC DI
    		CMP SI, DI
    		JL DOTHIS
    		LEA DX, MSG2
    		MOV AH, 09H
    		INT 21H
    		LEA DX, STR1
    		MOV AH, 09H
    		INT 21H
    		MOV AH, 4CH
    		INT 21H
CODE ENDS
END START
