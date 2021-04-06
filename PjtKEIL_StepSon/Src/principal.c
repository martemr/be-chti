

#include "DriverJeuLaser.h"

void CallbackSon(void);

int main(void)
{

// ===========================================================================
// ============= INIT PERIPH (faites qu'une seule fois)  =====================
// ===========================================================================

	// Après exécution : le coeur CPU est clocké à 72MHz ainsi que tous les timers
 	CLOCK_Configure();


	// La périodicité du son que l'on veut jouer est de 91ms
	// configuration du Timer 4 en débordement 91us
	Timer_1234_Init_ff(TIM4, 6552);
	Active_IT_Debordement_Timer(TIM4, 2, CallbackSon); // activer le débordement avec priorité 2 
	

	

//============================================================================	
	
	
while	(1)
	{
	}
}

