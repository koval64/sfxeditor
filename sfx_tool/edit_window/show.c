
void edit_window_fill_menu_values_and_step(void) {

    //
    // VALUES
    //

    // pwm
    unsigned pwm = SIDFXExplosion[0].pwm;
    CHAR_RAM[PWM_DIGITS_POS+0] = int2hexpetscii[ (pwm >>  8) & 0xf ];
    CHAR_RAM[PWM_DIGITS_POS+1] = int2hexpetscii[ (pwm >>  4) & 0xf];
    CHAR_RAM[PWM_DIGITS_POS+2] = int2hexpetscii[ pwm & 0x0f];

    // a/d/s/r
    CHAR_RAM[ATTACK_DIGITS_POS] = int2hexpetscii[menu.option[ATTACK_INDEX].value];
    CHAR_RAM[DECAY_DIGITS_POS] = int2hexpetscii[menu.option[DECAY_INDEX].value];
    CHAR_RAM[SUSTAIN_DIGITS_POS] = int2hexpetscii[menu.option[SUSTAIN_INDEX].value];
    CHAR_RAM[RELEASE_DIGITS_POS] = int2hexpetscii[menu.option[RELEASE_INDEX].value];

    // dfreq
    int dfreq = menu.option[DFREQ_INDEX].value;
    CHAR_RAM[DFREQ_DIGITS_POS+0] = int2hexpetscii[(dfreq >> 12) & 0x0f];
    CHAR_RAM[DFREQ_DIGITS_POS+1] = int2hexpetscii[(dfreq >> 8) & 0x0f];
    CHAR_RAM[DFREQ_DIGITS_POS+2] = int2hexpetscii[(dfreq >> 4) & 0x0f];
    CHAR_RAM[DFREQ_DIGITS_POS+3] = int2hexpetscii[(dfreq ) & 0x0f];

    // dpwm
    int dpwm = menu.option[DPWM_INDEX].value;
    CHAR_RAM[DPWM_DIGITS_POS+0] = int2hexpetscii[(dpwm >> 8) & 0x0f];
    CHAR_RAM[DPWM_DIGITS_POS+1] = int2hexpetscii[(dpwm >> 4) & 0x0f];
    CHAR_RAM[DPWM_DIGITS_POS+2] = int2hexpetscii[(dpwm ) & 0x0f];

    // time 1
    char time1 = menu.option[TIME1_INDEX].value;
    CHAR_RAM[TIME1_DIGITS_POS+0] = int2hexpetscii[ time1 >> 4 ];
    CHAR_RAM[TIME1_DIGITS_POS+1] = int2hexpetscii[ time1 & 0x0f];

    // time 0
    char time0 = menu.option[TIME0_INDEX].value;
    CHAR_RAM[TIME0_DIGITS_POS+0] = int2hexpetscii[ time0 >> 4 ];
    CHAR_RAM[TIME0_DIGITS_POS+1] = int2hexpetscii[ time0 & 0x0f];

}

void edit_window_select_default_menu_options() {

    // select waveform
    waveform_menu_change_option(OPTION_NOOP);
    if(menu.index == WAVEFORM_INDEX)
        waveform_menu_change_color(OPTION_ON_SELECTED_COLOR);

    // blackout PWM options ( PWM options are active only when PWM waveform is choosen )
    if( menu.option[WAVEFORM_INDEX].value != WAVE_PULSE ) {

        for(int i=0; i<28; i++)
            COLOR_RAM[PWM_POS+i] = OPTION_OFF_COLOR;

        for(int i=0; i<28; i++)
            COLOR_RAM[DPWM_POS+i] = OPTION_OFF_COLOR;

    }

    // select default option
    for(int i = 0; i<9; i++)
        COLOR_RAM[MENU_START_POS+(40*menu.index)+i] = OPTION_ON_SELECTED_COLOR;

    // select default option value
    menu.option[menu.index].change_color (OPTION_ON_SELECTED_COLOR);

    byte note_index = find_note( SIDFXExplosion[0].freq );

    // global variables from "controller.c" file
    octave         = note_index / 12;
    note           = note_index % 12;

    // print default octave number
    OCTAVE_MENU_DIGIT_ADDR[0]         = int2hexpetscii[ octave ];

    // select default octave key
    OCTAVE_MENU_COLOR_ADDR[ octaves_color_positions[ octave ] ]      = OPTION_ON_SELECTED_COLOR;

    // select default note key
    SEMINOTES_COLOR_POSITIONS[ piano_notes_color_positions[ note ] ] = OPTION_ON_SELECTED_COLOR;

    octave *= 12;

}

void edit_window_show(void) {

    // clear chars and set color
    clear_screen(VCOL_DARK_GREY);

    // put windows on screen ( char data in one dimensional array )
    win_put_at(copyright, 26, 14, 14, 1);
    win_put_at(edit_window_sfx_properties, 11, 0, 16, 10);
    win_put_at(edit_window_info_bar, 0, 13, 40, 1);
    win_put_at(edit_window_piano, 8, 17, 25, 8);

    // default values
    edit_window_fill_menu_values_and_step();

    // default selections
    edit_window_select_default_menu_options();

}

