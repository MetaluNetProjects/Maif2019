/*********************************************************************
 *               Test Fraise on Versa1.0 
 *********************************************************************/

#define BOARD Versa2

#include <fruit.h>
const int Table[256] = {
#include "../table2.txt"
};

unsigned char period = 200; // number of 5 ms time slices between prints of "Hello"
unsigned char t = 0, t2 = 0;
t_delay mainDelay;

//-------------  Timer1 macros :  ---------------------------------------- 
//prescaler=PS fTMR1=FOSC/(4*PS) nbCycles=0xffff-TMR1init T=nbCycles/fTMR1=(0xffff-TMR1init)*4PS/FOSC
//TMR1init=0xffff-(T*FOSC/4PS) ; max=65536*4PS/FOSC : 
//ex: PS=8 : T=0.01s : TMR1init=0xffff-15000
//Maximum 1s !!
#define	TMR1init(T) (0xffff-((T*FOSC)/32000)) //ms ; maximum: 8MHz:262ms 48MHz:43ms 64MHz:32ms
#define	TMR1initUS(T) (0xffff-((T*FOSC)/32000000)) //us ; 
#define InitTimer(T) do{ TMR1H=TMR1init(T)/256 ; TMR1L=TMR1init(T)%256; PIR1bits.TMR1IF=0; }while(0)
#define InitTimerUS(T) do{ TMR1H=TMR1initUS(T)/256 ; TMR1L=TMR1initUS(T)%256; PIR1bits.TMR1IF=0; }while(0)
#define TimerOut() (PIR1bits.TMR1IF)

void setup(void) {		
//----------- Setup ----------------
	fruitInit();
			
	pinModeDigitalOut(LED); 	// set the LED pin mode to digital out
	digitalClear(LED);		// clear the LED
	delayStart(mainDelay, 5000); 	// init the mainDelay to 5 ms
	
	pinModeDigitalIn(K1);
	
	T1CON=0b00110011;//src=fosc/4,ps=8,16bit r/w,on.
	PIE1bits.TMR1IE=1;  //1;
	IPR1bits.TMR1IP=1;

}

unsigned char index=0;
void loop() {
// ---------- Main loop ------------
	fraiseService();	// listen to Fraise events
	//__critical 
	{
		if(Table[index] != index) printf("CError\n");
	}
	index++;

	if(delayFinished(mainDelay)) // when mainDelay triggers :
	{
		delayStart(mainDelay, 5000); 	// re-init mainDelay
		t = t + 1;			// increment period counter	
		if(t >= period){		// if counter overflows :
			t = 0;				 // clear counter
			t2 = t2 + 1;			 // increment aux counter 
			printf("CHello! t2= %d K1= %d\n", t2, digitalRead(K1));// print Hello + aux counter value
		}
	}
}

// Receiving

void fraiseReceiveChar() // receive text
{
	unsigned char c;
	
	c=fraiseGetChar();
	if(c=='L'){		//switch LED on/off 
		c=fraiseGetChar();
		digitalWrite(LED, c!='0');		
	}
	else if(c=='E') { 	// echo text (send it back to host)
		printf("C");
		c = fraiseGetLen(); 			// get length of current packet
		while(c--) printf("%c",fraiseGetChar());// send each received byte
		putchar('\n');				// end of line
	}	
}

void fraiseReceive() // receive raw bytes
{
	unsigned char c;
	
	c=fraiseGetChar();	// get the first byte

	switch(c) {
		PARAM_CHAR(1,period); break; 	// if the first byte is 1 then set period 
						//to the value of the next byte
	}
}

void highInterrupts()
{
	static unsigned int tableResult, tableIndex;
	
	//servoHighInterrupt();
	if(PIR1bits.TMR1IF) {
		tableResult = Table[tableIndex];
		tableIndex++;
		InitTimerUS(20);
	}
}

