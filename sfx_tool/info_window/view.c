
// fill view
void effect_info_fill_view(void) {

    int freq = SIDFXExplosion[0].freq;
    sound_effect_info_ascii[3][8] = int2hexpetscii[ (freq >> 12) & 0x0f];
    sound_effect_info_ascii[3][9] = int2hexpetscii[ (freq >>  8) & 0x0f];
    sound_effect_info_ascii[3][10] = int2hexpetscii[ (freq >>  4) & 0x0f];
    sound_effect_info_ascii[3][11] = int2hexpetscii[ freq & 0x0f];

    unsigned pwm = SIDFXExplosion[0].pwm;
    sound_effect_info_ascii[3][17] = int2hexpetscii[ (pwm >>  8) & 0x0f];
    sound_effect_info_ascii[3][18] = int2hexpetscii[ (pwm >>  4) & 0x0f];
    sound_effect_info_ascii[3][19] = int2hexpetscii[ pwm & 0x0f];

    int ctrl = SIDFXExplosion[0].ctrl;
    sound_effect_info_ascii[4][8] = int2hexpetscii[ (ctrl >>  4) & 0x0f];
    sound_effect_info_ascii[4][9] = int2hexpetscii[ ctrl & 0x0f];

    char ad = SIDFXExplosion[0].attdec;
    char sr = SIDFXExplosion[0].susrel;
    sound_effect_info_ascii[5][8] = int2hexpetscii[ (ad >> 4) & 0x0f ];
    sound_effect_info_ascii[5][9] = int2hexpetscii[ ad & 0x0f ];
    sound_effect_info_ascii[6][8] = int2hexpetscii[ (sr >> 4) & 0x0f ];
    sound_effect_info_ascii[6][9] = int2hexpetscii[ sr & 0x0f ];

    int dfreq = SIDFXExplosion[0].dfreq;
    sound_effect_info_ascii[7][8] = int2hexpetscii[ (dfreq >> 12) & 0x0f];
    sound_effect_info_ascii[7][9] = int2hexpetscii[ (dfreq >>  8) & 0x0f];
    sound_effect_info_ascii[7][10] = int2hexpetscii[ (dfreq >>  4) & 0x0f];
    sound_effect_info_ascii[7][11] = int2hexpetscii[ dfreq & 0x0f];

    int dpwm = SIDFXExplosion[0].dpwm;
    sound_effect_info_ascii[7][16] = int2hexpetscii[ (dpwm >> 12) & 0x0f];
    sound_effect_info_ascii[7][17] = int2hexpetscii[ (dpwm >>  8) & 0x0f];
    sound_effect_info_ascii[7][18] = int2hexpetscii[ (dpwm >>  4) & 0x0f];
    sound_effect_info_ascii[7][19] = int2hexpetscii[ dpwm & 0x0f];

    char time1 = SIDFXExplosion[0].time1;
    sound_effect_info_ascii[8][8] = int2hexpetscii[ (time1 >>  4) & 0x0f];
    sound_effect_info_ascii[8][9] = int2hexpetscii[ time1 & 0x0f];

    char time0 = SIDFXExplosion[0].time0;
    sound_effect_info_ascii[8][16] = int2hexpetscii[ (time0 >>  4) & 0x0f];
    sound_effect_info_ascii[8][17] = int2hexpetscii[ time0 & 0x0f];
}

void effect_info_show_view(void) {
    /* screen_backup[13*26]; */
    for(char y=0; y<13; y++) {
        for(char x=0; x<26; x++) {

            unsigned pos = SOUND_EFFECT_INFO_WINDOW_POS + ( y * 40 ) + x;

            screen_char_backup[y][x]  = CHAR_RAM[pos];
            screen_color_backup[y][x] = COLOR_RAM[pos];

            CHAR_RAM[pos] = sound_effect_info_ascii[y][x];
            COLOR_RAM[pos] = VCOL_LT_GREY;
        }
    }
}

void effect_info_hide_view(void) {
    // restore screen
    for(char y=0; y<13; y++) {
        for(char x=0; x<26; x++) {

            unsigned pos = SOUND_EFFECT_INFO_WINDOW_POS + ( y * 40 ) + x;

            CHAR_RAM[pos]  = screen_char_backup[y][x];
            COLOR_RAM[pos] = screen_color_backup[y][x];
        }
    }
}








