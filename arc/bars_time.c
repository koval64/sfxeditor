#include <c64/memmap.h>
#include <c64/vic.h>
#include <gfx/mcbitmap.h>
#include <c64/keyboard.h>
#include <string.h>
#include <conio.h>

#define Color1	((char *)0xc800)
#define Color2	((char *)0xd800)
#define Hires	((char *)0xe000)

Bitmap		Screen;

void init(void)
{
	mmap_trampoline();
	mmap_set(MMAP_RAM);

	memset(Color1, 0x67, 1000);
	memset(Color2, 0x02, 1000);
	memset(Hires, 0x00, 8000);

	mmap_set(MMAP_NO_ROM);

	vic_setmode(VICM_HIRES_MC, Color1, Hires);

	vic.color_back = VCOL_BLACK;
	vic.color_border = VCOL_BLACK;

	bm_init(&Screen, Hires, 40, 25);	
}

char process_keyboard(void) {
    keyb_poll();
    byte _key = keyb_codes[keyb_key & 0x7f];
    /* bool play = true; */

    if ( _key == 32 || _key == 'q' || _key == 27 || _key == 95)
        return true;      // exit main menu
    else
        return false;
}

void done(void)
{
	mmap_set(MMAP_ROM);

	/* getch(); */

	vic_setmode(VICM_TEXT, (char *)0x0400, (char *)0x1000);
}

//
// IN MULTICOLOR IN X DIRECTION ( ALSO BAR_WIDTH, BARS_X_GAP ) ONLY EVEN VALUES WORK PROPERLY
//
// BAR DIMENSIONS
#define BAR_HEIGHT 40
#define BAR_WIDTH 8
#define BARS_X_GAP 6
#define BAR_X_STEP ( BAR_WIDTH + BARS_X_GAP )
#define BARS_COUNT 9
#define BAR_PART ( 40 / 10 )    // DIVIDE BAR HEIGHT INTO 10 PARTS

// MARGINS AND SMALL BOARD WIDTH
#define MARGIN1_X 2
#define MARGIN1_Y 1
#define MARGIN2_X 2
#define MARGIN2_Y 1
#define MARGIN_SUM_X ( MARGIN1_X + MARGIN2_X )
#define MARGIN_SUM_Y ( MARGIN1_Y + MARGIN2_Y )
#define ALL_BARS_WIDTH ( BARS_COUNT * BAR_WIDTH + ( BARS_COUNT - 1 ) * BARS_X_GAP )

// CALCULATE LARGE BOARD DIMENSIONS
#define BOARD_L_X 20
#define BOARD_L_Y 80
#define BOARD_L_W ( 2 * MARGIN_SUM_X + ALL_BARS_WIDTH )
#define BOARD_L_H ( 2 * MARGIN_SUM_Y + BAR_HEIGHT )

// CALCULATE MEDIUM BOARD DIMENSIONS
#define BOARD_M_X ( BOARD_L_X + MARGIN1_X )
#define BOARD_M_Y ( BOARD_L_Y + MARGIN1_Y )
#define BOARD_M_W ( BOARD_L_W - 2 * MARGIN1_X )
#define BOARD_M_H ( BOARD_L_H - 2 * MARGIN1_Y )

// CALCULATE SMALL BOARD DIMENSIONS
#define BOARD_S_X ( BOARD_M_X + MARGIN2_X )
#define BOARD_S_Y ( BOARD_M_Y + MARGIN2_Y )

void bars(int *params )
{

  /* bmmcu_rect_fill(&Screen, BOARD_L_X, BOARD_L_Y, BOARD_L_W, BOARD_L_H, 1); */
  /* bmmcu_rect_fill(&Screen, BOARD_M_X, BOARD_M_Y, BOARD_M_W, BOARD_M_H, 2); */
  bmmcu_rect_fill(&Screen, BOARD_M_X, BOARD_M_Y, 16, 32, 2);

  /* for( int i = 0; i < BARS_COUNT; i++ ) { */
  /*     bmmcu_rect_fill(&Screen, */
  /*         BOARD_S_X + BAR_X_STEP * i, */
  /*         BOARD_S_Y + ( BAR_HEIGHT - ( params[ i ] * BAR_PART ) ), */
  /*         BAR_WIDTH, */
  /*         params[ i ] * BAR_PART, */
  /*         1); */
  /* } */
}

int main(void)
{
	init();

  int params[BARS_COUNT] = { 2, 3, 4, 5, 6, 0, 9, 8, 7 };

  for(;;) {
      // draw bars
      /* vic.color_back = VCOL_WHITE; */
      /* vic.color_border = VCOL_WHITE; */
      /* bars( params ); */
      /* vic.color_back = VCOL_BLACK; */
      /* vic.color_border = VCOL_BLACK; */
      vic.color_border = VCOL_BLACK;
      bars( params );
      vic.color_border = VCOL_WHITE;

      // wait for frame iteration
      vic_waitFrame();

      // check keys
      char done = process_keyboard();
      if(done)
        break;
  }

	done();
	return 0;
}


