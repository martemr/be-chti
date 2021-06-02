

#include "DriverJeuLaser.h"
#include "GestionSon.h"
#include <stdio.h>

int DFT_ModuleAuCarre( short int * Signal64ech, char k) ;
extern short int LeSignal;
extern short int TabCos;

short int dma_buf[64];
int result[64];

void CallBack_Systick(){
	// Lecture avec la DMA
	Start_DMA1(64);
	Wait_On_End_Of_DMA1();
	Stop_DMA1;
	
	// Lire les 64 pics de la DFT.
	for(int k=0; k<63; k++){
		result[k]=DFT_ModuleAuCarre(dma_buf, k);//dma_buf, k);
	}
	if (result[19]>0x10000)
		StartSon();

}
	
int main(void)
{

	
// ===========================================================================
// ============= INIT PERIPH (faites qu'une seule fois)  =====================
// ===========================================================================

// Après exécution : le coeur CPU est clocké à 72MHz ainsi que tous les timers
	CLOCK_Configure();

	// Mise en place du callback
	Systick_Period_ff(360000); 
	Systick_Prio_IT(1, CallBack_Systick);
	SysTick_On ;
	SysTick_Enable_IT ;
	
	// Configuration de l'architecture
	Init_TimingADC_ActiveADC_ff(ADC1, 72);
	Single_Channel_ADC( ADC1, 2 );
	Init_Conversion_On_Trig_Timer_ff( ADC1, TIM2_CC2, 225 );
	Init_ADC1_DMA1( 0, dma_buf);
	
	Timer_1234_Init_ff(TIM4, 6552);
	Active_IT_Debordement_Timer(TIM4, 2, CallbackSon); // activer le débordement avec priorité 2 
	
	PWM_Init_ff( TIM3, 3, 720);
	GPIO_Configure(GPIOB, 0, OUTPUT, ALT_PPULL);



	//int a = DFT_ModuleAuCarre(&LeSignal , 1);


//============================================================================	
	
	
while	(1)
	{
	}
}

