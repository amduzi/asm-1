; --------------------------------------- 16 bit stack ---------------------------------------
SEGMENT STACK16 USE16
sseg16 dw 1024 dup (?)
stack16_end:


;-------------------------------------------------------------------------------------------
; 16 bit stack segment for sipi
;-------------------------------------------------------------------------------------------
SEGMENT STACK16S USE16
ORG 0
sseg16s dw 2048 dup (?)
stack16s_end:
		

;-------------------------------------------------------------------------------------------
; 16 bit stack segments for threads
;-------------------------------------------------------------------------------------------
SEGMENT STACK16T1 USE16
ORG 0
sseg16t1 dw 2048 dup (?)
stack16t1_end:
SEGMENT STACK16T2 USE16
ORG 0
sseg16t2 dw 2048 dup (?)
stack16t2_end:
SEGMENT STACK16T3 USE16
ORG 0
sseg16t3 dw 2048 dup (?)
stack16t3_end:
