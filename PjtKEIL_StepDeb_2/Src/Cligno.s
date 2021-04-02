	PRESERVE8
	THUMB   
	

	

; ====================== zone de r�servation de donn�es,  ======================================
;Section RAM (read only) :
	area    mesdata,data,readonly


;Section RAM (read write):
	area    maram,data,readwrite
		
	; Cr�ation de la variable (dans la ram)
FlagCligno dcd 0
	;extern FlagCligno
	
; ===============================================================================================
	


	
;Section ROM code (read only) :		
	area    moncode,code,readonly
; �crire le code ici		
	extern GPIOB_Set
	extern GPIOB_Clear
	export timer_callback
		
	export FlagCligno

timer_callback
	
	; on va appeler GPIOB_Set/Clear qui utilisera les registres r0 et r1, on ne les utilisera donc pas
	push {lr}

	ldr r2,=FlagCligno ; met l'adresse de FlagCligno dans r0
	ldr r3, [r2] ; la valeur de FlagCligno est maintenant dans r1
	
	subs r3,#1	; On soustait 1 pour voir si il egal � 1 : r0=1 <=> r0-1=0
	beq allume; continue si l'op�ration pr�c�dente ne vaut pas 0 

	mov r0, #1
	bl GPIOB_Set

	mov r3, #1 ; FlagCligno est mis � 0
	str r3, [r2] ; On stocke la valeur de FlagCligno � sa place
	
	pop {lr}
	bx lr

allume

	mov r0, #1
	bl GPIOB_Clear
	
	mov r3, #0
	str r3, [r2] ; On stocke la valeur de FlagCligno � sa place
	
	pop {lr}
	bx lr

		
		
	END	