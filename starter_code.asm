.orig x3000
;this stack lab computes the polish notation of a set of calls
;push_val(4) pushes the value 4 onto the stack [4]

ADD R1, R1, #4
LD R2, PUSH_SUB
LD R6, STACK
JSRR R2


;push_val(3) pushes the value 3 onto the stack [4,3]

AND R1, R1, #0
ADD R1, R1, #3
LD R2, PUSH_SUB
JSRR R2

;push_val(2) pushes the value 2 onto the stack [4,3,2]

AND R1, R1, #0
ADD R1, R1, #2
LD R2, PUSH_SUB
JSRR R2

;add_val() pop 3,2 and push the result of 3+2 onto the stack [4,5]

LD R2, ADD_SUB
JSRR R2



;add_val() pop 4,5 and push the result of 4+5 onto the stack[9]

LD R2, ADD_SUB
JSRR R2

LDR R4, R6, #0

HALT

;===============
; MAIN VARIABLES
;===============
PUSH_SUB        .FILL x3400
ADD_SUB         .FILL x3800
STACK           .FILL x4200

;move the top value of the stack into r4
.end





.orig x3400 ;;push_val(int val)implement your push function that will push a value onto the stack

;===================
; NAME: PUSH_SUB
; INPUT: R1
; PROCEDURE: PUSHES NUMBER ONTO STACK
; OUTPUT: R6, STACK
;======================

; 1) SAVE REGISTERS

ST R7, R7_BACKUP_3400

; 2) ALGORITHM

ADD R6, R6, #-1
STR R1, R6, #0

; 3) RELOAD REGISTERS

LD R7, R7_BACKUP_3400

; 4) RETURN


RET

;===========
;SUB VARIBLES
;===========

R7_BACKUP_3400       .BLKW #1

.end

.orig x3800 ;; add_val() pops two values from the top of the stack and pushes the result of adding the poppped value into the stack

;===================
; NAME: ADD_SUB
; INPUT: R6 (STACK)
; PROCEDURE: POPS THE FIRST TWO, ADDS THEN THEM PUSHES THE STACK
; OUTPUT: R6, STACK
;==================

; 1) SAVE REGISTERS

ST R7, R7_BACKUP_3800

; 2) ALGORITHM

LDR R4, R6, #0
ADD R6, R6, #1
LDR R5, R6, #0
ADD R6, R6, #1

ADD R2, R4, R5
ADD R6, R6, #-1
STR R2, R6, #0

; 3) RELOAD REGISTERS

LD R7, R7_BACKUP_3800

; 4) RETURN

RET

;================
; SUB VARIABLES
;===============

R7_BACKUP_3800      .BLKW #1

.end



.orig x4200 ;;data you might need
; PLACE HOLDER FOR MY STACK
; AKA STACK LOCATED HERE
.end


