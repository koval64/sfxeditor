
// fill view buffer
void sound_effect_info_fill_buffer(void) {

    int freq = SIDFXExplosion[0].freq;
    sound_effect_info_ascii[3*SOUND_EFFECT_INFO_WIDTH+8] = byte2hexpetscii[ (freq >> 12) & 0x0f];
    sound_effect_info_ascii[3*SOUND_EFFECT_INFO_WIDTH+9] = byte2hexpetscii[ (freq >>  8) & 0x0f];
    sound_effect_info_ascii[3*SOUND_EFFECT_INFO_WIDTH+10] = byte2hexpetscii[ (freq >>  4) & 0x0f];
    sound_effect_info_ascii[3*SOUND_EFFECT_INFO_WIDTH+11] = byte2hexpetscii[ freq & 0x0f];

    unsigned pwm = SIDFXExplosion[0].pwm;
    sound_effect_info_ascii[3*SOUND_EFFECT_INFO_WIDTH+17] = byte2hexpetscii[ (pwm >>  8) & 0x0f];
    sound_effect_info_ascii[3*SOUND_EFFECT_INFO_WIDTH+18] = byte2hexpetscii[ (pwm >>  4) & 0x0f];
    sound_effect_info_ascii[3*SOUND_EFFECT_INFO_WIDTH+19] = byte2hexpetscii[ pwm & 0x0f];

    int ctrl = SIDFXExplosion[0].ctrl;
    sound_effect_info_ascii[4*SOUND_EFFECT_INFO_WIDTH+8] = byte2hexpetscii[ (ctrl >>  4) & 0x0f];
    sound_effect_info_ascii[4*SOUND_EFFECT_INFO_WIDTH+9] = byte2hexpetscii[ ctrl & 0x0f];

    char ad = SIDFXExplosion[0].attdec;
    char sr = SIDFXExplosion[0].susrel;
    sound_effect_info_ascii[5*SOUND_EFFECT_INFO_WIDTH+8] = byte2hexpetscii[ (ad >> 4) & 0x0f ];
    sound_effect_info_ascii[5*SOUND_EFFECT_INFO_WIDTH+9] = byte2hexpetscii[ ad & 0x0f ];
    sound_effect_info_ascii[6*SOUND_EFFECT_INFO_WIDTH+8] = byte2hexpetscii[ (sr >> 4) & 0x0f ];
    sound_effect_info_ascii[6*SOUND_EFFECT_INFO_WIDTH+9] = byte2hexpetscii[ sr & 0x0f ];

    int dfreq = SIDFXExplosion[0].dfreq;
    sound_effect_info_ascii[7*SOUND_EFFECT_INFO_WIDTH+8] = byte2hexpetscii[ (dfreq >> 12) & 0x0f];
    sound_effect_info_ascii[7*SOUND_EFFECT_INFO_WIDTH+9] = byte2hexpetscii[ (dfreq >>  8) & 0x0f];
    sound_effect_info_ascii[7*SOUND_EFFECT_INFO_WIDTH+10] = byte2hexpetscii[ (dfreq >>  4) & 0x0f];
    sound_effect_info_ascii[7*SOUND_EFFECT_INFO_WIDTH+11] = byte2hexpetscii[ dfreq & 0x0f];

    int dpwm = SIDFXExplosion[0].dpwm;
    sound_effect_info_ascii[7*SOUND_EFFECT_INFO_WIDTH+16] = byte2hexpetscii[ (dpwm >> 12) & 0x0f];
    sound_effect_info_ascii[7*SOUND_EFFECT_INFO_WIDTH+17] = byte2hexpetscii[ (dpwm >>  8) & 0x0f];
    sound_effect_info_ascii[7*SOUND_EFFECT_INFO_WIDTH+18] = byte2hexpetscii[ (dpwm >>  4) & 0x0f];
    sound_effect_info_ascii[7*SOUND_EFFECT_INFO_WIDTH+19] = byte2hexpetscii[ dpwm & 0x0f];

    char time1 = SIDFXExplosion[0].time1;
    sound_effect_info_ascii[8*SOUND_EFFECT_INFO_WIDTH+8] = byte2hexpetscii[ (time1 >>  4) & 0x0f];
    sound_effect_info_ascii[8*SOUND_EFFECT_INFO_WIDTH+9] = byte2hexpetscii[ time1 & 0x0f];

    char time0 = SIDFXExplosion[0].time0;
    sound_effect_info_ascii[8*SOUND_EFFECT_INFO_WIDTH+16] = byte2hexpetscii[ (time0 >>  4) & 0x0f];
    sound_effect_info_ascii[8*SOUND_EFFECT_INFO_WIDTH+17] = byte2hexpetscii[ time0 & 0x0f];
}

void sound_effect_info_show(void) {
    /* backup screen part [ 15x26 ]; */
    int array_pos = 0;
    int screen_pos = SOUND_EFFECT_INFO_SCREEN_POS;
    for(char y=0; y<SOUND_EFFECT_INFO_HEIGHT; y++) {
        for(char x=0; x<SOUND_EFFECT_INFO_WIDTH; x++) {

            // backup screen to buffer
            screen_char_backup [array_pos] = CHAR_RAM [screen_pos];
            screen_color_backup[array_pos] = COLOR_RAM[screen_pos];

            // copy to screen
            CHAR_RAM[screen_pos] = sound_effect_info_ascii[array_pos];
            COLOR_RAM[screen_pos] = VCOL_LT_GREY;

            screen_pos++;
            array_pos++;
        }
        screen_pos += 40-SOUND_EFFECT_INFO_WIDTH;     // char_ram_width - window_width
    }
}

void sound_effect_info_hide(void) {

    // restore screen part
    int screen_pos = SOUND_EFFECT_INFO_SCREEN_POS;
    int array_pos  = 0;

    for(char y=0; y<SOUND_EFFECT_INFO_HEIGHT; y++) {
        for(char x=0; x<SOUND_EFFECT_INFO_WIDTH; x++) {

            CHAR_RAM [screen_pos] = screen_char_backup [array_pos];
            COLOR_RAM[screen_pos] = screen_color_backup[array_pos];

            screen_pos++;
            array_pos++;
        }
        screen_pos += 40-SOUND_EFFECT_INFO_WIDTH;    // char_ram_width - window_width
    }
}








