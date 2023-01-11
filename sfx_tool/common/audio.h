
/* sidfx_play(1, const SIDFX *fx, 1); */

/* struct SIDFX */
/* { */
/* 	unsigned	freq, pwm; */
/* 	byte		ctrl, attdec, susrel; */
/* 	int		dfreq, dpwm; */
/* 	byte		time1, time0; */
/* 	byte		priority; */
/* }; */

// main sound effect structure to play sound by oscar64
struct SIDFX SIDFXClipboard[1];

struct SFX {
    char name[SOUND_NAME_LENGTH];
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

// struct SOUND_BANK {
//     struct SFX sfx[ SFX_COUNT ];
// };
// extern struct SOUND_BANK sound_bank;

extern struct SFX sound_bank[ SFX_COUNT ];
extern struct SFX one_track[ TRACK_LENGTH ];
