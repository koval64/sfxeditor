#include <c64/sprites.h>
#include <c64/keyboard.h>
#include <audio/sidfx.h>
#include <time.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

int main(void) {

	for(;;)
	{
    // get the key
    keyb_poll();
    byte _key = keyb_codes[keyb_key & 0x7f];

    if(_key == 32)
        printf("space pressed\n");
    else if(_key != 20)
        printf("key :  %d\n", _key);

		// Wait for one frame iteration
		vic_waitFrame();

	}

	return 0;
}

