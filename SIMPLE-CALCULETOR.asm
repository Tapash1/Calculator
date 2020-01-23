


org 100h
.MODEL SMALL
.STACK 100H
.DATA
M0 DB "         ***SIMPLE CALCULETOR***$"
M1 DB "FOR ADDITION TYPE:'1'$"
M2 DB "FOR SUBTRACTION TYPE: '2'$"
M3 DB "FOR MULTIPLICATION TYPE: '3'$"
M4 DB "FOR DIVISION TYPE: '4'$"
M5 DB "ENTER 2 NUMBERS FOR ADDITION: $"
M6 DB "ENTER 2 NUMBERS FOR SUBTRACTION: $"
M7 DB "ENTER 2 NUMBERS FOR MULTIMLICATION: $"
M8 DB "ENTER 2 NUMBERS FOR DIVISION: $"
M9 DB "CHOOSE AN OPTION: $"
M10 DB "DECIMAL RESULT IS: $"
M11 DB "            ***THANK YOU***"
M12 DB "PLEASE ENTER AN VALID OPTION: $"
M14 DB "HEXADECIMAL RESULT: $"
M15 DB "            REMAINDER: $"
M16 DB "FOR ANOTHER CALCULATION TYPE: '1'$"
M17 DB "TO EXIT TYPE: '2'$"
M18 DB "INVALID INPUT..$"
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DX,AX
    LEA DX,M0
    MOV AH,09
    INT 21H
    
    START: 
    
    CALL NL
    CALL NL
    
    LEA DX,M1
    MOV AH,09
    INT 21H
    
    CALL NL
    
    LEA DX,M2
    MOV AH,09
    INT 21H
    
    CALL NL
    
    LEA DX,M3
    MOV AH,09
    INT 21H
    
    CALL NL
    
    LEA DX,M4
    MOV AH,09
    INT 21H
    
    CALL NL
    CALL NL
    
    LEA DX,M9
    MOV AH,09
    INT 21H
    
    CALC:
    
    MOV AH,01
    INT 21H
    MOV BL,AL
    
    CALL NL
    CALL NL
    
    CMP BL,'1'
    JE ADDITION
    
    CMP BL,'2'
    JE SUBTRACTION
    
    CMP BL,'3'
    JE MULTIPLICATION
    
    CMP BL,'4'
    JE DEVISION
    
    LEA DX,M12
    MOV AH,09
    INT 21H
    
    JMP CALC
    
    ADDITION:
    
    LEA DX,M5
    MOV AH,09
    INT 21H
    
    MOV AH,01
    INT 21H
    MOV BL,AL
    
    MOV AH,02
    MOV DL,'+'
    INT 21H
    
    MOV AH,01
    INT 21H
    MOV CL,AL
    
    ADD BL,CL
    MOV BH,BL
    SUB BL,48
    CMP BL,'9'
    
    JG I
    
    CALL NL
    CALL NL
    
    CALL DR
    
    MOV AH,02
    MOV DL,BL
    INT 21H
    
    CALL NL
    
    CALL HR
    
    CALL NL
    CALL NL
    
    LEA DX,M16
    MOV AH,09
    INT 21H
    CALL NL
    LEA DX,M17
    MOV AH,09
    INT 21H
     
    CALL NL
    
    LEA DX,M9
    MOV AH,09
    INT 21H
    
    MOV AH,01
    INT 21H
    
    MOV BL,AL
    CMP BL,'1'
    JE START
    
    CALL NL
    CALL NL
    CALL TNX
    JMP EXIT
    
    
    SUBTRACTION:
    
    LEA DX,M6
    MOV AH,09
    INT 21H
    
    MOV AH,01
    INT 21H
    MOV BL,AL
    
    MOV AH,02
    MOV DL,'-'
    INT 21H
    
    MOV AH,01
    INT 21H
    MOV CL,AL
    
    CMP BL,CL
    JL J
    
    SUB BL,CL
    CMP BL,'9'
    JG J
    ADD BL,48
    
    CALL NL
    CALL NL
    CALL DR
    
    MOV AH,02
    MOV DL,BL
    INT 21H
    
    CALL NL
    CALL HR
    
    CALL NL
    CALL NL
    
    LEA DX,M16
    MOV AH,09
    INT 21H
    
    CALL NL
    
    LEA DX,M17
    MOV AH,09
    INT 21H
    CALL NL
    
    LEA DX,M9
    MOV AH,09
    INT 21H
    
    MOV AH,01
    INT 21H
    
    MOV BL,AL
    CMP BL,'1'
    JE START
    
    CALL NL
    CALL NL
    CALL TNX
    JMP EXIT
    
    
    MULTIPLICATION:
    
    LEA DX,M7
    MOV AH,09
    INT 21H
    
    MOV AX,0
    MOV BX,0
    MOV CX,0
    MOV DX,0
    
    MOV AH,01
    INT 21H
    SUB AL,48
    MOV CL,AL
    MOV CH,0
    
    MOV AH,02
    MOV DL,'*'
    INT 21H
    
    MOV AH,01
    INT 21H
    SUB AL,48
    MOV BL,AL
    MOV BH,0
    
    MOV AX,CX
    
    MUL BX
    MOV CX,AX
    ADD CL,48
    CMP CL,'9'
    JG K
    CALL NL
    CALL NL
    
    CALL DR
    
    MOV AH,02
    MOV DL,CL
    INT 21H
    MOV BL,CL
    
    CALL NL
    CALL HR
    
    CALL NL
    CALL NL
    
    LEA DX,M16
    MOV AH,09
    INT 21H
    
    CALL NL
    
    LEA DX,M17
    MOV AH,09
    INT 21H
    CALL NL
    
    LEA DX,M9
    MOV AH,09
    INT 21H
    
    MOV AH,01
    INT 21H
    
    MOV BL,AL
    CMP BL,'1'
    JE START
    
    CALL NL
    CALL NL
    CALL TNX
    JMP EXIT
    
    
    DEVISION:
    
    LEA DX,M8
    MOV AH,09
    INT 21H
    
    MOV AX,0
    MOV BX,0
    MOV CX,0
    MOV DX,0
    
    MOV AH,01
    INT 21H
    SUB AL,48
    MOV CL,AL
    
    MOV AH,02
    MOV DL,'/'
    INT 21H
    
    MOV AH,01
    INT 21H
    SUB AL,48
    CMP AL,0
    
    JE L
    MOV BL,AL
    
    CMP CL,BL
    JL L
    
    MOV AX,CX
    
    DIV BL
    MOV CX,AX
    ADD CL,48
    
    CALL NL
    CALL NL
    CALL DR
    
    MOV AH,02
    MOV DL,CL
    INT 21H
    MOV BL,CL
    
    LEA DX,M15
    MOV AH,09
    INT 21H 
    
    MOV CL,CH
    
    ADD CL,48
    MOV BH,CL
    MOV AH,02
    MOV DL,CL
    INT 21H
    
    CALL NL
    CALL HR
    
    LEA DX,M15
    MOV AH,09
    INT 21H
    
    MOV AH,02
    MOV DL,'3'
    INT 21H
    
    
    MOV DL,BH
    INT 21H
    MOV DL,'h'
    INT 21H
    
    CALL NL
    CALL NL
    
    LEA DX,M16
    MOV AH,09
    INT 21H
    
    CALL NL
    
    LEA DX,M17
    MOV AH,09
    INT 21H
    CALL NL
    
    LEA DX,M9
    MOV AH,09
    INT 21H
    
    MOV AH,01
    INT 21H
    
    MOV BL,AL
    CMP BL,'1'
    JE START
    
    CALL NL
    CALL NL
    CALL TNX
    JMP EXIT
    
    
    
    
    
    
    
    NL:
    
    MOV AH,02
    MOV DL,13
    INT 21H
    MOV DL,10
    INT 21H
    RET
    
    TNX:
    
    LEA DX,M11
    MOV AH,09
    INT 21H
    RET
    
    I:
    
    CALL NL
    CALL NL
    
    LEA DX,M18
    MOV AH,09
    INT 21H
    
    CALL NL
    
    JMP ADDITION
    
    
    J:
    
    CALL NL
    CALL NL
    
    LEA DX,M18
    MOV AH,09
    INT 21H
    CALL NL
    
    JMP SUBTRACTION
    
    K:
    
    CALL NL
    CALL NL
    
    LEA DX,M18
    MOV AH,09
    INT 21H
    
    CALL NL
    JMP MULTIPLICATION
    
    L:
    
    CALL NL
    CALL NL
    
    LEA DX,M18
    MOV AH,09
    INT 21H
    
    CALL NL
    JMP DEVISION
    
    
    DR:
    
    LEA DX,M10
    MOV AH,09
    INT 21H
    
    RET
    
    HR:
    
    LEA DX,M14
    MOV AH,09
    INT 21H
    
    MOV AH,02
    MOV DL,'3'
    INT 21H
    MOV DL,BL
    INT 21H
    MOV DL,'h'
    INT 21H
    
    RET
    
    EXIT:
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
    END MAIN
         
    
    
    
    








