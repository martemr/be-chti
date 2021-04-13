	PRESERVE8
	THUMB   
		

; ====================== zone de r�servation de donn�es,  ======================================
;Section RAM (read only) :
	area    mesdata,data,readonly

;Section RAM (read write):
	area    maram,data,readwrite
		
SortieSon dcd 0
AdresseSon dcd 0
	
; ===============================================================================================
	


		
;Section ROM code (read only) :		
	area    moncode,code,readonly
; �crire le code ici		
	
	extern Son ; Son est l'adresse du tableau de sons
	export CallbackSon
	export SortieSon
	
CallbackSon

	ldr r1,=AdresseSon
	ldr r3,=SortieSon
	ldr r0, [r1]	; r1 est l'adresse de adresse son, r0 est sa valeur
	
	; initialisation de adresse son si elle vaut 0
	cmp r0, #0 
	bne	lire_son
	ldr r0, =Son
	b lire_son	


lire_son

	; Lire le son tous les ticks d'horloge, en avan�ant de 16 bits � chaque fois
	ldrsh r2, [r0] ; lire le son sur 16 bits
	
	; mise � l'echelle [0, 719]
	adds r2, #32768
	mov r4, #719
	mul r2, r4
	mov r4, #65535
	sdiv r2, r4
	
	str r2, [r3] ; stocker le son lu dans SortieSon
	add r0, #2 ; incr�mente adresse son de 16 bits
	str r0,[r1] ; stocke adresse son
		
	bx lr 
	
	END	
		
	