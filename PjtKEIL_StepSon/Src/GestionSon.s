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
	
	extern Son ; Son est l'adresse du tableau de sons
	extern PWM_Set_Value_TIM3_Ch3
	export CallbackSon
	export SortieSon
	extern LongueurSon
		

StartSon 
	ldr r1,=AdresseSon
	ldr r0, =Son
	str r0,[r1] ; stocke adresse son
	bl CallBackSon
	
CallbackSon

	push {r4, r5, r6, lr}
	ldr r1,=AdresseSon
	ldr r3,=SortieSon
	ldr r0, [r1]	; r1 est l'adresse de adresse son, r0 est sa valeur
	
	; Dire au programme de ne plus lire après la fin du son
	
	ldr r5, =LongueurSon
	ldr r5, [r5]
	mov r6, #2
	mul r5, r6		; soit la taille de Son * 2 car 2 bits
	ldr r6, =Son
	add r5, r6
	cmp r0, r5 
	beq fin
	
	; initialisation de adresse son si elle vaut 0
	cmp r0, #0 
	bne	lire_son
	ldr r0, =Son

lire_son

	; Lire le son tous les ticks d'horloge, en avançant de 16 bits à chaque fois
	ldrsh r2, [r0] ; lire le son sur 16 bits
	
	; mise à l'echelle [0, 719] : Produit en croix, maxi=65535 -> 719 , min=0->0
	adds r2, #32768 ; Décalage pour faire une valeur absolue (2^15)
	mov r4, #719
	mul r2, r4
	mov r4, #65535
	sdiv r2, r4
	
	str r2, [r3] ; stocker le son lu dans SortieSon
	add r0, #2 ; incrémente adresse son de 16 bits
	str r0,[r1] ; stocke adresse son
	
	mov r0,r2
	bl PWM_Set_Value_TIM3_Ch3
	
fin
	pop {r4}
	pop {r5}
	pop {r6}
	pop {pc}
	
	END	
		

		
	
