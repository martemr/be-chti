	PRESERVE8
	THUMB   
		

; ====================== zone de r�servation de donn�es,  ======================================
;Section RAM (read only) :
	area    mesdata,data,readonly


;Section RAM (read write):
	area    maram,data,readwrite
		
VarTime	dcd 0 ; dcd=type entier / export rend la variable globale
;export VarTime
	
; ===============================================================================================
	
;constantes (�quivalent du #define en C)
TimeValue	equ 900000 


	EXPORT Delay_100ms ; la fonction Delay_100ms est rendue publique donc utilisable par d'autres modules.
	EXPORT VarTime
		
;Section ROM code (read only) :		
	area    moncode,code,readonly
		


; REMARQUE IMPORTANTE 
; Cette mani�re de cr�er une temporisation n'est clairement pas la bonne mani�re de proc�der :
; - elle est peu pr�cise
; - la fonction prend tout le temps CPU pour... ne rien faire...
;
; Pour autant, la fonction montre :
; - les boucles en ASM
; - l'acc�s �cr/lec de variable en RAM
; - le m�canisme d'appel / retour sous programme
;
; et donc poss�de un int�r�t pour d�buter en ASM pur

Delay_100ms proc
	
	    	ldr r0,=VarTime ; copie l'adresse de VarTime dans r0 
						  
		ldr r1,=TimeValue ; copie la valeur de TimeValue car TimeValue est une constante
		str r1,[r0] 
		; On a mis TimeValue dans VarTime (VarTime=90000)
		
BoucleTempo	
		ldr r1,[r0] ; r1 est VarTime maintenant
						
		subs r1,#1 ; d�cr�mente VarTime de 1
		str  r1,[r0]
		bne	 BoucleTempo
			
		bx lr
		endp
		
		
	END	