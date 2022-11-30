
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

