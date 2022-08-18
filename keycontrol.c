#include <c64/sprites.h>
#include <c64/keyboard.h>
#include <audio/sidfx.h>
#include <time.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

/* struct SIDFX */
/* { */
/* 	unsigned	freq, pwm; */
/* 	byte		ctrl, attdec, susrel; */
/* 	int			dfreq, dpwm; */
/* 	byte		time1, time0; */
/* 	byte		priority; */
/* }; */

/* inline void sidfx_play(byte chn, const SIDFX * fx, byte cnt); */

#define FREQ1 8000
#define FREQ2 1000
#define PWM   1000

// Sound effect for a player shot
SIDFX	SIDFXFire[1] = {{
	FREQ1, PWM, 
	SID_CTRL_GATE | SID_CTRL_SAW,
	SID_ATK_16 | SID_DKY_114,
	0x40  | SID_DKY_750,
	-80, 0,
	4, 30
}};

// Sound effect for enemy explosion
SIDFX	SIDFXExplosion[1] = {{
	FREQ2, PWM, 
	SID_CTRL_GATE | SID_CTRL_NOISE,
	SID_ATK_2 | SID_DKY_6,
	0xf0  | SID_DKY_1500,
	-20, 0,
	8, 40
}};

// Sound effect for player explosion
SIDFX	SIDFXBigExplosion[3] = {
	{
	FREQ2, PWM, 
	SID_CTRL_GATE | SID_CTRL_SAW,
	SID_ATK_2 | SID_DKY_6,
	0xf0  | SID_DKY_168,
	-20, 0,
	4, 0
	},
	{
	FREQ2, PWM, 
	SID_CTRL_GATE | SID_CTRL_NOISE,
	SID_ATK_2 | SID_DKY_6,
	0xf0  | SID_DKY_168,
	-20, 0,
	10, 0
	},
	{
	FREQ2, PWM, 
	SID_CTRL_GATE | SID_CTRL_NOISE,
	SID_ATK_2 | SID_DKY_6,
	0xf0  | SID_DKY_1500,
	-10, 0,
	8, 80
	},	
};

int main(void) {

	// Init sound effects state machine
	sidfx_init();

	// Full volume
	sid.fmodevol = 15;

  /* srand( 12345678L ); */
  printf("random :  %d\n", rand() );

  SIDFXExplosion[0].freq = FREQ1;

	for(;;)
	{
    // get the key
    keyb_poll();
    byte _key = keyb_codes[keyb_key & 0x7f];

    /* if (_key == 'r'){ */

    /*     sidfx_play(0, SIDFXFire, 1); */
    /*     printf("random :  %d\n", rand()%12 ); */

    /*     printf(p"r key\n"); */
    /* } else if (_key == 't'){ */

    /*     sidfx_play(1, SIDFXExplosion, 1); */

    /*     printf(p"t key\n"); */
    /* } else if (_key == 'y'){ */

    /*     sidfx_play(2, SIDFXBigExplosion, 3); */

    /*     printf(p"y key\n"); */
    /* } else if(_key != 20) { */
    if(_key == 32)
      printf("space pressed\n");
    else if(_key != 20)
        printf("key :  %d\n", _key);
    // Update sound effects
    sidfx_loop();
		// Wait for one frame iteration
		vic_waitFrame();
	}

	return 0;
}

