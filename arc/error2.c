#include <c64/memmap.h>
#include <c64/charwin.h>
#include <c64/cia.h>
#include <c64/vic.h>
#include <c64/joystick.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <conio.h>

#define OPTIONS_COUNT   2

CharWin	cw;

void print_info(char option_choosen)
{
  char option_color[ OPTIONS_COUNT ] = { 0, 0 };

  for( int i=0; i<OPTIONS_COUNT; i++ )
      option_color[ i ] = VCOL_DARK_GREY;
  option_color[ option_choosen ] = VCOL_WHITE;

	cwin_putat_string(&cw,  0, 4, p"menu1   :", option_color[0]);
	cwin_putat_string(&cw,  0, 8, p"menu2   :", option_color[1]);
}

char option_choosen = 0;
char menu_indexes[OPTIONS_COUNT] = { 0, 0 };

char vals[][] = { " 0", " 1", " 2", " 3", " 4", " 5", " 6", " 7",
                  " 8", " 9", "10", "11", "12", "13", "14", "15", };

void menu1(char direction, char not_used) {
  if(direction == 1)
      menu_indexes[option_choosen]--;
  else if(direction > 1)
      menu_indexes[option_choosen]++
  menu_indexes[option_choosen] &= 0xf;
  cwin_putat_string(&cw, 11, 4, vals[menu_indexes[option_choosen]], VCOL_WHITE);
  cwin_putat_string(&cw, 20, 4, vals[direction], VCOL_WHITE);
  cwin_putat_string(&cw, 24, 4, vals[not_used], VCOL_WHITE);
}

void menu2(char direction, char not_used) {
  if(direction == 1)
      menu_indexes[option_choosen]--;
  else if(direction > 1)
      menu_indexes[option_choosen]++
  menu_indexes[option_choosen] &= 0xf;
  cwin_putat_string(&cw, 11, 8, vals[menu_indexes[option_choosen]], VCOL_WHITE);
  cwin_putat_string(&cw, 20, 8, vals[direction], VCOL_WHITE);
  cwin_putat_string(&cw, 24, 8, vals[not_used], VCOL_WHITE);
  /* adding line below fixes error */
  /* adding line below fixes error */
  /* adding line below fixes error */
  /* printf( "position1 :  %d %d\n", direction, not_used); */
}

/* moving code below to main fixes error */
/* moving code below to main fixes error */
/* moving code below to main fixes error */
void (*choices_table[OPTIONS_COUNT]) (char, char) = {
    menu1,
    menu2
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

  // calling functions from choices_table here makes problem
  // when function is called later as 
  // first argument is parsed it's position in choices_table array
  // and as the second 0
  // NOT argument that you set
  // UNCOMMENT to affect this function
  /* menu1(0, 0); */

  /* removing line below fixes error */
  /* removing line below fixes error */
  /* removing line below fixes error */
  menu2(0, 0);
}

int main(void) {

  init();

  int prevx = 0;
  int prevy = 0;

	for(;;) {

		// Poll joystick
		joy_poll(0);

    if ( joyy[0] != prevy ) {

        if( joyy[0] != 0 ) {
            option_choosen += joyy[0];

            if(option_choosen == OPTIONS_COUNT)
                option_choosen = 0;
            else if (option_choosen > OPTIONS_COUNT)
                option_choosen = OPTIONS_COUNT-1;
            print_info(option_choosen);
        }

        prevy = joyy[0];
    }

    if ( joyx[0] != prevx ) {

      if ( joyx[0] != 0 )
          (*choices_table[option_choosen]) (joyx[0]+2, 4);   // 1 - left, 3 = right

      prevx = joyx[0];
    }

		// Wait for one frame iteration
		vic_waitFrame();
	}

	return 0;
}
