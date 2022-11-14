
#define CHAR_RAM  ((byte *)0x0400)
#define COLOR_RAM ((byte *)0xd800)

#define SCREEN_CHAR_WIDTH   40

// SCENES ID
#define EDIT_WINDOW         0
#define INFO_WINDOW         1
#define SOUND_BANK_WINDOW   2
#define LOADER_WINDOW       3
#define EDIT_LABEL_WINDOW   4
#define ONE_TRACK_WINDOW    5
#define SCENES_COUNT        6

// HELPERS
#define FALSE   0
#define TRUE    1

// menu color settings
#define OPTION_ON_COLOR             VCOL_DARK_GREY
#define OPTION_ON_SELECTED_COLOR    VCOL_LT_GREY
#define OPTION_OFF_COLOR            VCOL_BLACK

/* struct SIDFX */
/* { */
/* 	unsigned	freq, pwm; */
/* 	byte		ctrl, attdec, susrel; */
/* 	int			dfreq, dpwm; */
/* 	byte		time1, time0; */
/* 	byte		priority; */
/* }; */

// main sound effect structure to play sound by oscar64
/* sidfx_play(1, const SIDFX *fx, 1); */

struct SIDFX SIDFXExplosion[1] = {{
    0x0685, 0x100,
    SID_CTRL_GATE | SID_CTRL_RECT,
    SID_ATK_2 | SID_DKY_6,
    0xf0  | SID_DKY_1500,
    0, 0,
    8, 8
}};

#define SFX_NAME_LEN        12
#define SFX_COUNT           48
#define SFX_TRACK_SINGLE    15
#define SFX_TRACK_MULTI     5

struct SFX {
    char name[SFX_NAME_LEN];
    char note;
    unsigned pwm;
    char wave;
    char ad;
    char sr;
    int dfreq;
    int dpwm;
    char time1;
    char time0;
};

struct SOUND_BANK {
    struct SFX sfx[ SFX_COUNT ];
};

extern struct SOUND_BANK sound_bank;

struct ARGV {
    char cp0;
    char cp1;
    char cp2;
};

extern struct ARGV argv;

// "0123456789abcdef"
char int2hexpetscii[] = {48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 1, 2, 3, 4, 5, 6};
char int2hexascii  [] = {48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 97, 98, 99, 100, 101, 102};


char screen_char_backup [1000];
char screen_color_backup[1000];

char char_ram_buffer[1000];



