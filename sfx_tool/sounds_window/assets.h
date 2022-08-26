
// sounds menu
byte column = 0;
byte row    = 0;

#define SOUNDS_ALIGN_X    1
#define SOUNDS_ALIGN_Y    2
#define SOUNDS_FIELD_SIZE 13

struct SFX {
    byte note;
    unsigned pwm;
    byte wave;
    byte ad;
    byte sr;
    int dfreq;
    int dpwm;
    byte time1;
    byte time0;
};

struct SOUND_BANK {
    struct SFX sfx[ 48 ];
};

extern volatile struct SOUND_BANK sound_bank;

