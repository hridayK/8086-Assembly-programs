DATA SEGMENT
    MESSAGE DB "Hello World$"
ENDS

CODE SEGMENT
    ASSUME DS:DATA CS:CODE

START:
    MOV AX,DATA ;moving address of data segment to ax register
    MOV DS,AX ; initializing data segment register to accumulator
    LEA DX,MESSAGE ;loading effective msg of MESSAGE vraible to Data Register
    MOV AH, 09H ;Print function
    INT 21H ;Interrupt causing the the print fucntion to execute
    MOV AH,4CH ;exit function from the program
    INT 21H ;enables the exit function to exit from the program
ENDS ;ends code segment
END START ;ends start