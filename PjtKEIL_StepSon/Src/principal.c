

#include "DriverJeuLaser.h"

void CallbackSon(void);

int main(void)
{

// ===========================================================================
// ============= INIT PERIPH (faites qu'une seule fois)  =====================
// ===========================================================================

	// Apr�s ex�cution : le coeur CPU est clock� � 72MHz ainsi que tous les timers
	CLOCK_Configure();


	// La p�riodicit� du son que l'on veut jouer est de 91ms
	// configuration du Timer 4 en d�bordement 91ms
	Timer_1234_Init_ff(TIM4, 6552000);
	Active_IT_Debordement_Timer(TIM4, 2, CallbackSon); // activer le d�bordement avec priorit� 2 
	

	

//============================================================================	
	
	
while	(1)
	{
	}
}
