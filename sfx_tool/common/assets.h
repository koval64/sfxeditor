
#define CHAR_RAM  ((byte *)0x0400)
#define COLOR_RAM ((byte *)0xd800)

// SCENES ID
#define EDIT_WINDOW     0
#define INFO_WINDOW     1
#define SOUNDS_WINDOW   2
#define SCENES_COUNT    3

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

// Sound effect for enemy explosion
SIDFX	SIDFXExplosion[1] = {{
    0x0685, 0x100,
    SID_CTRL_GATE | SID_CTRL_RECT,
    SID_ATK_2 | SID_DKY_6,
    0xf0  | SID_DKY_1500,
    0, 0,
    8, 8
}};

struct SFX {
    /* char name[12]; */
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
    struct SFX sfx[ 48 ];
};

extern volatile struct SOUND_BANK sound_bank;

// "0123456789abcdef"
char int2hexpetscii[] = {48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 1, 2, 3, 4, 5, 6};
char int2hexascii[]   = {48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 97, 98, 99, 100, 101, 102};




