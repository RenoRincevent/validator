#include <stdio.h>
#include <stdlib.h> 

char text[] = "Vafgehpgvba frgf jnag gb or serr!";

// Don't use the stack, because sp isn't set up.
volatile int wait = 0;
volatile uint32_t b = 4;
volatile int8_t c = 0;

int main(int argc, char** argv){

    while (wait);


	if(b>= 1)
		c = b + 4;	


    // Doesn't actually go on the stack, because there are lots of GPRs.
    int i = 0;
    while (text[i]) {
        char lower = text[i] | 32;
        if (lower >= 'a' && lower <= 'm')
            text[i] += 13;
        else if (lower > 'm' && lower <= 'z')
            text[i] -= 13;
        i++;
    }

    int k = 0;
    while (!wait){
		k++;
		if(k > 5)
			break;
    }

	return 0;
}
