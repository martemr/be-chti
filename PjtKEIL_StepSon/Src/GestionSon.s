	PRESERVE8
	THUMB   
		

; ====================== zone de réservation de données,  ======================================
;Section RAM (read only) :
	area    mesdata,data,readonly

;Section RAM (read write):
	area    maram,data,readwrite
		
SortieSon dcd 0
AdresseSon dcd 0
	
; ===============================================================================================
	


		
;Section ROM code (read only) :		
	area    moncode,code,readonly
; écrire le code ici		
	
	extern Son
	export CallbackSon
	
CallbackSon

	ldr r0,=AdresseSon	
	ldr r1, [r0]	; r0 est l'adresse de adresse son, r1 est sa valeur
	
	; initialisation de adresse son si elle vaut 0
	cmp r1, #0
	beq	first
	
	; 
	

		
first 
	ldr r1, =Son
	str r1, [r0]
	bx lr
	
	END	
		
	