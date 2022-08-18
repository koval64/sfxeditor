#include <c64/memmap.h>
#include <c64/charwin.h>
#include <c64/cia.h>
#include <c64/vic.h>
#include <c64/joystick.h>
#include <audio/sidfx.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <conio.h>

#define OPTIONS_COUNT   11
#define WAVEFORM_INDEX  1
#define PWM_INDEX       2
#define ATTACK_INDEX    3
#define DECAY_INDEX     4
#define SUSTAIN_INDEX   5
#define RELEASE_INDEX   6

CharWin	cw;

// Sound effect for enemy explosion
SIDFX	SIDFXExplosion[1] = {{
	1000, 1000, 
	SID_CTRL_GATE | SID_CTRL_RECT,
	SID_ATK_2 | SID_DKY_6,
	0xf0  | SID_DKY_1500,
	-20, 0,
	8, 40
}};

char sid_waveforms[] = { SID_CTRL_TRI, SID_CTRL_SAW, SID_CTRL_RECT, SID_CTRL_NOISE };

void print_info(char option_choosen)
{
  // pulse range( 0, 4095 )
  char waveform[][6]  = { "tri", "saw", "pulse", "noise" }
  char note_name[][] = { "c-", "c#", "d-", "d#", "e-", "f-", "f#", "g-", "g#", "a-", "a#", "b-" };
  char option_color[ OPTIONS_COUNT ] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

  for( int i=0; i<OPTIONS_COUNT; i++ )
      option_color[ i ] = VCOL_DARK_GREY;
  option_color[ option_choosen ] = VCOL_WHITE;

  // frequency - note
	cwin_putat_string(&cw,  0, 3, p"freq     :", option_color[0]);
	cwin_putat_string(&cw, 11, 3, note_name[3], VCOL_WHITE);

	cwin_putat_string(&cw,  0, 4, p"waveform :", option_color[WAVEFORM_INDEX]);
	cwin_putat_string(&cw,  0, 5, p"pwm      :", option_color[PWM_INDEX]);
	cwin_putat_string(&cw,  0, 6, p"attack   :", option_color[ATTACK_INDEX]);
	cwin_putat_string(&cw,  0, 7, p"decay    :", option_color[DECAY_INDEX]);
	cwin_putat_string(&cw,  0, 8, p"sustain  :", option_color[SUSTAIN_INDEX]);
	cwin_putat_string(&cw,  0, 9, p"release  :", option_color[RELEASE_INDEX]);

  // dfreq
	cwin_putat_string(&cw,  0, 10, p"dfreq    :", option_color[7]);
	cwin_putat_string(&cw, 11, 10, note_name[9], VCOL_WHITE);

  // dpwd
	cwin_putat_string(&cw,  0, 11, p"dpwd     :", option_color[8]);
	cwin_putat_string(&cw, 11, 11, note_name[10], VCOL_WHITE);

  // time1
	cwin_putat_string(&cw,  0, 12, p"time1    :", option_color[9]);
	cwin_putat_string(&cw, 11, 12, note_name[11], VCOL_WHITE);

  // time0
	cwin_putat_string(&cw,  0, 13, p"time0    :", option_color[10]);
	cwin_putat_string(&cw, 11, 13, note_name[0], VCOL_WHITE);

  /* cwin_putat_char(&cw, 1, 6, 5, VCOL_BLUE); */
}

// char is uint8 = it is always in range( 0, 255 ) ( -1 = 255, 256 = 0 )
char option_choosen = 5;
char menu_indexes[OPTIONS_COUNT] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

void waveform_menu(char direction, char not_used) {

  if(direction == 1)
      menu_indexes[option_choosen]--;
  else
      menu_indexes[option_choosen]++;
  menu_indexes[option_choosen] &= 0x3;

  cwin_putat_string(&cw, 11, 4, "tri saw pulse noise", VCOL_DARK_GREY);
  if( menu_indexes[option_choosen] == 0 )
      cwin_putat_string(&cw, 11, 4, "tri", VCOL_WHITE);
  else if( menu_indexes[option_choosen] == 1 )
      cwin_putat_string(&cw, 15, 4, "saw", VCOL_WHITE);
  else if( menu_indexes[option_choosen] == 2 )
      cwin_putat_string(&cw, 19, 4, "pulse", VCOL_WHITE);
  else if( menu_indexes[option_choosen] == 3 )
      cwin_putat_string(&cw, 25, 4, "noise", VCOL_WHITE);
}

char adsr_vals[][] = { " 0", " 1", " 2", " 3", " 4", " 5", " 6", " 7",
                       " 8", " 9", "10", "11", "12", "13", "14", "15", };

char pwm_vals[][] = { "  0", "  5", " 10", " 15", " 20", " 25", " 30", " 35",
                      " 40", " 45", " 50", " 55", " 60", " 65", " 70", " 80",
                      " 85", " 90", " 95", "100"};

void pwm_menu(char direction, char not_used) {
  if(direction == 1)
      menu_indexes[option_choosen]--;
  else if(direction > 1)
      menu_indexes[option_choosen]++
  if(menu_indexes[option_choosen] > 20)
      menu_indexes[option_choosen] = 19;
  else if(menu_indexes[option_choosen] == 20)
      menu_indexes[option_choosen] = 0;
  cwin_putat_string(&cw, 14, 5, "%", VCOL_DARK_GREY);
  cwin_putat_string(&cw, 10, 5, pwm_vals[menu_indexes[option_choosen]], VCOL_WHITE);
}

void attack_menu(char direction, char not_used) {
  if(direction == 1)
      menu_indexes[option_choosen]--;
  else if(direction > 1)
      menu_indexes[option_choosen]++
  menu_indexes[option_choosen] &= 0xf;
  cwin_putat_string(&cw, 11, 6, adsr_vals[menu_indexes[option_choosen]], VCOL_WHITE);
  cwin_putat_string(&cw, 0, 24, adsr_vals[direction], VCOL_WHITE);
  cwin_putat_string(&cw, 0, 23, adsr_vals[not_used], VCOL_WHITE);
}

void decay_menu(char direction, char not_used) {
  if(direction == 1)
      menu_indexes[option_choosen]--;
  else if(direction > 1)
      menu_indexes[option_choosen]++
  menu_indexes[option_choosen] &= 0xf;
  cwin_putat_string(&cw, 11, 7, adsr_vals[menu_indexes[option_choosen]], VCOL_WHITE);
}

void sustain_menu(char direction, char not_used) {
  if(direction == 1)
      menu_indexes[option_choosen]--;
  else if(direction > 1)
      menu_indexes[option_choosen]++
  menu_indexes[option_choosen] &= 0xf;
  cwin_putat_string(&cw, 11, 8, adsr_vals[menu_indexes[option_choosen]], VCOL_WHITE);
}

void release_menu(char direction, char not_used) {
  if(direction == 1)
      menu_indexes[option_choosen]--;
  else if(direction > 1)
      menu_indexes[option_choosen]++
  menu_indexes[option_choosen] &= 0xf;
  cwin_putat_string(&cw, 11, 9, adsr_vals[menu_indexes[option_choosen]], VCOL_WHITE);
}

void nullfunc(char direction, char value) {
  if(direction == 1) {
	    cwin_putat_string(&cw,  0, 15, p"left    :  ", VCOL_GREEN);
      cwin_putat_char(&cw, 0, 16, value, VCOL_BLUE);
  } else if(direction == 2) {
	    cwin_putat_string(&cw,  0, 15, p"right    :  ", VCOL_GREEN);
      cwin_putat_char(&cw, 0, 16, value, VCOL_BLUE);
  }
}

void sfx_update() {

    char info_txt[] = "ADSR :        ";
    char int2hex[] = p"0123456789abcdef";
    
    char a = menu_indexes[ ATTACK_INDEX ]; 
    char d = menu_indexes[ DECAY_INDEX ];
    char s = menu_indexes[ SUSTAIN_INDEX ];
    char r = menu_indexes[ RELEASE_INDEX ];

    info_txt[8]  = int2hex[a];
    info_txt[9]  = int2hex[d];
    info_txt[11] = int2hex[s];
    info_txt[12] = int2hex[r];
    
    cwin_putat_string(&cw,  0, 17, info_txt, VCOL_GREEN );

    SIDFXExplosion[0].attdec = a << 4 | d;
    SIDFXExplosion[0].susrel = s << 4 | r;
    SIDFXExplosion[0].pwm = menu_indexes[ PWM_INDEX ] * 204.8;  //  4096 / 20.
    SIDFXExplosion[0].ctrl = sid_waveforms[ menu_indexes[ WAVEFORM_INDEX ] ] | SID_CTRL_GATE;
}

void init(void) {

	// Enable ROM
	mmap_set(MMAP_ROM);

	// Init CIAs (no kernal rom was executed so far)
	cia_init();

	// Init VIC
	vic_setmode(VICM_TEXT, (char *)0x0400, (char *)0x1800);
	vic.color_back = VCOL_BLACK;
	vic.color_border = VCOL_BLACK;

	// Prepare output window
	cwin_init(&cw, (char *)0x0400, 0, 0, 40, 25);
	cwin_clear(&cw);

	// Init sound effects state machine
	sidfx_init();

	// Full volume
	sid.fmodevol = 15;

  putchar(14);

  // show menu entries
	print_info(option_choosen);
  waveform_menu(0, 0);
  pwm_menu(0, 0);
  attack_menu(0, 0);
  decay_menu(0, 0);
  sustain_menu(0, 0);
  release_menu(0, 0);
}

  void (*choices_table[OPTIONS_COUNT]) (char, char) = {
      nullfunc,
      waveform_menu,
      pwm_menu,
      attack_menu,
      decay_menu,
      sustain_menu,
      release_menu,
      nullfunc,
      nullfunc,
      nullfunc,
      nullfunc
  }

int main(void) {

  init();

  int prevx = 0;
  int prevy = 0;
  int prevb = 0;

	for(;;)
	{
    // process input events
    /* process_input_events(); */

		// Poll joystick
		joy_poll(0);

    if ( joyy[0] != prevy ) {

        char prev_option = option_choosen;

        if ( joyy[0] == 1 ) {
            /* printf(p"down pressed\n"); */
            option_choosen++;
        } else if (joyy[0] == -1 ) {
            /* printf(p"up pressed\n"); */
            option_choosen--;
        } else {
            if (prevy == 1) {
                /* printf(p"down released\n"); */
            } else if (prevy == -1) {
                /* printf(p"up released\n"); */
            }
        }

        if( prev_option != option_choosen ) {

            if(option_choosen == OPTIONS_COUNT) {
                option_choosen = 0;
            } else if (option_choosen > OPTIONS_COUNT) {
                option_choosen = OPTIONS_COUNT-1;
            }
            print_info(option_choosen);
        }

        prevy = joyy[0];
    }

    if ( joyx[0] != prevx ) {
      if ( joyx[0] == 1 ) {
          /* printf("right pressed %d\n", option_choosen); */
          (*choices_table[option_choosen]) (2, 0);   // 2 = right
          sfx_update();
          sidfx_play(1, SIDFXExplosion, 1);
      } else if (joyx[0] == -1 ) {
          /* printf(p"left pressed\n"); */
          (*choices_table[option_choosen]) (1, 0);   // 1 = left
          sfx_update();
          sidfx_play(1, SIDFXExplosion, 1);
      } else {
          if (prevx == 1) {
              /* printf(p"right released\n"); */
          } else if (prevx == -1) {
              /* printf(p"left released\n"); */
          }
      }
      prevx = joyx[0];
    }

    if ( joyb[0] != prevb ) {
      if( joyb[0] == 1 ) {

        // SID FX - Fire button
        sidfx_play(0, SIDFXExplosion, 1);

        /* printf(p"fire pressed\n"); */
      } else {
        /* printf(p"fire released\n"); */
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
