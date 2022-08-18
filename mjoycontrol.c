#include <c64/sprites.h>
#include <c64/joystick.h>
#include <audio/sidfx.h>
#include <string.h>
#include <stdio.h>

// Sound effect for a player shot
SIDFX	SIDFXFire[1] = {{
	8000, 1000, 
	SID_CTRL_GATE | SID_CTRL_SAW,
	SID_ATK_16 | SID_DKY_114,
	0x40  | SID_DKY_750,
	-80, 0,
	4, 30
}};

// Sound effect for enemy explosion
SIDFX	SIDFXExplosion[1] = {{
	1000, 1000, 
	SID_CTRL_GATE | SID_CTRL_NOISE,
	SID_ATK_2 | SID_DKY_6,
	0xf0  | SID_DKY_1500,
	-20, 0,
	8, 40
}};

// Sound effect for player explosion
SIDFX	SIDFXBigExplosion[3] = {
	{
	1000, 1000, 
	SID_CTRL_GATE | SID_CTRL_SAW,
	SID_ATK_2 | SID_DKY_6,
	0xf0  | SID_DKY_168,
	-20, 0,
	4, 0
	},
	{
	1000, 1000, 
	SID_CTRL_GATE | SID_CTRL_NOISE,
	SID_ATK_2 | SID_DKY_6,
	0xf0  | SID_DKY_168,
	-20, 0,
	10, 0
	},
	{
	1000, 1000, 
	SID_CTRL_GATE | SID_CTRL_NOISE,
	SID_ATK_2 | SID_DKY_6,
	0xf0  | SID_DKY_1500,
	-10, 0,
	8, 80
	},	
};

int main(void)
{

	// Init sound effects state machine
	sidfx_init();

	// Full volume
	sid.fmodevol = 15;

  putchar(14);

  int prevx = 0;
  int prevy = 0;
  int prevb = 0;

	for(;;)
	{
		// Poll joytick
		joy_poll(0);

    if ( joyy[0] != prevy ) {
      if ( joyy[0] == 1 ) {
	        printf(p"down pressed\n");

          // SID FX
          sidfx_play(0, SIDFXBigExplosion, 3);

      } else if (joyy[0] == -1 ) {
	        printf(p"up pressed\n");
      } else {
          if (prevy == 1)
	            printf(p"down released\n");
          else if (prevy == -1)
	            printf(p"up released\n");
      }
      prevy = joyy[0];
    }
    if ( joyx[0] != prevx ) {
      if ( joyx[0] == 1 ) {
	        printf(p"right pressed\n");

          // SID FX
          sidfx_play(1, SIDFXExplosion, 1);

      } else if (joyx[0] == -1 ) {
	        printf(p"left pressed\n");
      } else {
          if (prevx == 1)
	            printf(p"right released\n");
          else if (prevx == -1)
	            printf(p"left released\n");
      }
      prevx = joyx[0];
    }
    if ( joyb[0] != prevb ) {
      if( joyb[0] == 1 ) {

        // SID FX - Fire button
        sidfx_play(0, SIDFXFire, 1);

        printf(p"fire pressed\n");
      } else {
        printf(p"fire released\n");
      }
      prevb = joyb[0];
    }

    // Update sound effects
    sidfx_loop();
		// Wait for one frame iteration
		vic_waitFrame();
	}

	return 0;
}

