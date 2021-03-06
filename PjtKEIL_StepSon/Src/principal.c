#include "DriverJeuLaser.h"
#include "GestionSon.h"

int main(void)
{

// ===========================================================================
// ============= INIT PERIPH (faites qu'une seule fois)  =====================
// ===========================================================================

	// Apr?s ex?cution : le coeur CPU est clock? ? 72MHz ainsi que tous les timers
 	CLOCK_Configure();


	// La p?riodicit? du son que l'on veut jouer est de 91ms
	// configuration du Timer 4 en d?bordement 91us
	Timer_1234_Init_ff(TIM4, 6552);
	Active_IT_Debordement_Timer(TIM4, 2, CallbackSon); // activer le d?bordement avec priorit? 2 
	
	// Configuration du timer 3, canal 3, p?riode 720.
	PWM_Init_ff( TIM3, 3, 720);
	GPIO_Configure(GPIOB, 0, OUTPUT, ALT_PPULL);
	

//============================================================================	
	
	
while	(1)
	{
	}
}

