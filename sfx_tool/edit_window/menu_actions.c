
// PWM MENU
void pwm_menu_cycle_step(void) {
    COLOR_RAM[ PWM_DIGITS_POS + menu.option[PWM_INDEX].digit_index ] = OPTION_ON_COLOR;

    unsigned value = menu.option[PWM_INDEX].step;
    if(value == 0x100)
        menu.option[PWM_INDEX].step = 0x010;
    else if(value == 0x010)
        menu.option[PWM_INDEX].step = 0x001;
    else if(value == 0x001)
        menu.option[PWM_INDEX].step = 0x100;

    menu.option[PWM_INDEX].digit_index++;
    if( menu.option[PWM_INDEX].digit_index > 2)
        menu.option[PWM_INDEX].digit_index = 0;
    COLOR_RAM[ PWM_DIGITS_POS + menu.option[PWM_INDEX].digit_index ] = OPTION_ON_SELECTED_COLOR;
}

void pwm_menu_change_color(byte color) {
    COLOR_RAM[ PWM_DIGITS_POS + menu.option[PWM_INDEX].digit_index ] = color;
}

void pwm_menu_change_value(byte direction) {
    // if pwm waveform is selected
    if(menu.option[WAVEFORM_INDEX].value == WAVE_PULSE) {
        if(direction == OPTION_PREVIOUS)
            menu.option[PWM_INDEX].value -= menu.option[PWM_INDEX].step;
        else if(direction == OPTION_NEXT)
            menu.option[PWM_INDEX].value += menu.option[PWM_INDEX].step;
        unsigned value = menu.option[PWM_INDEX].value;
        CHAR_RAM[PWM_DIGITS_POS+0] = int2hexpetscii[ (value >>  8) & 0xf ];
        CHAR_RAM[PWM_DIGITS_POS+1] = int2hexpetscii[ (value >>  4) & 0xf];
        CHAR_RAM[PWM_DIGITS_POS+2] = int2hexpetscii[ value & 0x0f];
    }
}

// WAVEFORM MENU
void waveform_menu_change_color(byte color) {
    COLOR_RAM[WAVEFORM_VALUE_POS+0] = color;
    COLOR_RAM[WAVEFORM_VALUE_POS+1] = color;
    COLOR_RAM[WAVEFORM_VALUE_POS+2] = color;
    COLOR_RAM[WAVEFORM_VALUE_POS+3] = color;
    COLOR_RAM[WAVEFORM_VALUE_POS+4] = color;
}

void waveform_menu_option_put(char c0, char c1, char c2, char c3, char c4) {
    // put chars on screen
    CHAR_RAM[WAVEFORM_VALUE_POS+0] = c0;
    CHAR_RAM[WAVEFORM_VALUE_POS+1] = c1;
    CHAR_RAM[WAVEFORM_VALUE_POS+2] = c2;
    CHAR_RAM[WAVEFORM_VALUE_POS+3] = c3;
    CHAR_RAM[WAVEFORM_VALUE_POS+4] = c4;
}

void waveform_menu_option_pulse(char color) {
    // put on screen string 'pulse'
    if(color == OPTION_ON_SELECTED_COLOR)
        waveform_menu_option_put(0x10, 0x15, 0x0c, 0x13, 0x05);

    // blackout or whitelist PWM options
    // ( activate PWM options only when PWM waveform is choosen )
    if(color == OPTION_ON_SELECTED_COLOR)
        // show PWM options
        color = OPTION_ON_COLOR;
    else
        // hide PWM options
        color = OPTION_OFF_COLOR;

    // pwm option
    for(int i=0; i<28; i++)
        COLOR_RAM[PWM_POS+i] = color;
       
    // dpwm option
    for(int i=0; i<28; i++)
        COLOR_RAM[DPWM_POS+i] = color;
}

void waveform_menu_set_option( byte color ) {
    byte wave = menu.option[ WAVEFORM_INDEX ].value;

    if( wave == 0 )
        // put on screen string '  tri'
        waveform_menu_option_put(' ', ' ', 0x14, 0x12, 0x09);

    else if( wave == 1 )
        // put on screen string '  saw'
        waveform_menu_option_put(' ', ' ', 0x13, 0x01, 0x17);

    else if( wave == 2 )
        waveform_menu_option_pulse( color );

    else if( wave == 3 )
        // put on screen string 'noise'
        waveform_menu_option_put(0x0e, 0x0f, 0x09, 0x13, 0x05);

}

void waveform_menu_change_option(byte value) {

    // deselect pulse additional settings if PULSE wave selected
    if(menu.option[WAVEFORM_INDEX].value == WAVE_PULSE)
        waveform_menu_set_option( OPTION_ON_COLOR );

    // change waveform
    if(value == OPTION_PREVIOUS)
        menu.option[WAVEFORM_INDEX].value--;
    else if(value == OPTION_NEXT)
        menu.option[WAVEFORM_INDEX].value++;

    // keep in range(0, 3)
    menu.option[WAVEFORM_INDEX].value &= 0x3;

    // select new waveform
    waveform_menu_set_option( OPTION_ON_SELECTED_COLOR );

}

// ATTACK MENU
void attack_menu_cycle_step(void) {
    unsigned value = menu.option[ATTACK_INDEX].step;
    if(value == 0x01)
      menu.option[ATTACK_INDEX].step = 0x02;
    else if(value == 0x02)
      menu.option[ATTACK_INDEX].step = 0x01;
    value = menu.option[ATTACK_INDEX].step;
    CHAR_RAM[ATTACK_DIGITS_POS+11] = int2hexpetscii[ value & 0x0f];
}

void attack_menu_change_color(byte color) {
    COLOR_RAM[ATTACK_DIGITS_POS] = color;
}

void attack_menu_change_value(byte value) {
    if(value == OPTION_PREVIOUS) {
        menu.option[ATTACK_INDEX].value -= menu.option[ATTACK_INDEX].step;
    } else if(value == OPTION_NEXT) {
        menu.option[ATTACK_INDEX].value += menu.option[ATTACK_INDEX].step;
    }
    menu.option[ATTACK_INDEX].value &= 0xf;
    CHAR_RAM[ATTACK_DIGITS_POS] = int2hexpetscii[menu.option[ATTACK_INDEX].value];
}

// DECAY MENU
void decay_menu_cycle_step(void) {
    unsigned value = menu.option[DECAY_INDEX].step;
    if(value == 0x01)
      menu.option[DECAY_INDEX].step = 0x02;
    else if(value == 0x02)
      menu.option[DECAY_INDEX].step = 0x01;
    value = menu.option[DECAY_INDEX].step;
    CHAR_RAM[DECAY_DIGITS_POS+11] = int2hexpetscii[ value & 0x0f];
}

void decay_menu_change_color(byte color) {
    COLOR_RAM[DECAY_DIGITS_POS] = color;
}

void decay_menu_change_value(byte value) {
    if(value == OPTION_PREVIOUS) {
        menu.option[DECAY_INDEX].value -= menu.option[DECAY_INDEX].step;
    } else if(value == OPTION_NEXT) {
        menu.option[DECAY_INDEX].value += menu.option[DECAY_INDEX].step;
    }
    menu.option[DECAY_INDEX].value &= 0xf;
    CHAR_RAM[DECAY_DIGITS_POS] = int2hexpetscii[menu.option[DECAY_INDEX].value];
}

// SUSTAIN MENU
void sustain_menu_cycle_step(void) {
    unsigned value = menu.option[SUSTAIN_INDEX].step;
    if(value == 0x01)
      menu.option[SUSTAIN_INDEX].step = 0x02;
    else if(value == 0x02)
      menu.option[SUSTAIN_INDEX].step = 0x01;
    value = menu.option[SUSTAIN_INDEX].step;
    CHAR_RAM[SUSTAIN_DIGITS_POS+11] = int2hexpetscii[ value & 0x0f];
}

void sustain_menu_change_color(byte color) {
    COLOR_RAM[SUSTAIN_DIGITS_POS] = color;
}

void sustain_menu_change_value(byte value) {
    if(value == OPTION_PREVIOUS) {
        menu.option[SUSTAIN_INDEX].value -= menu.option[SUSTAIN_INDEX].step;
    } else if(value == OPTION_NEXT) {
        menu.option[SUSTAIN_INDEX].value += menu.option[SUSTAIN_INDEX].step;
    }
    menu.option[SUSTAIN_INDEX].value &= 0xf;
    CHAR_RAM[SUSTAIN_DIGITS_POS] = int2hexpetscii[menu.option[SUSTAIN_INDEX].value];
}

// RELEASE MENU
void release_menu_cycle_step(void) {
    unsigned value = menu.option[RELEASE_INDEX].step;
    if(value == 0x01)
      menu.option[RELEASE_INDEX].step = 0x02;
    else if(value == 0x02)
      menu.option[RELEASE_INDEX].step = 0x01;
    value = menu.option[RELEASE_INDEX].step;
    CHAR_RAM[RELEASE_DIGITS_POS+11] = int2hexpetscii[ value & 0x0f];
}

void release_menu_change_color(byte color) {
    COLOR_RAM[RELEASE_DIGITS_POS] = color;
}

void release_menu_change_value(byte value) {
    if(value == OPTION_PREVIOUS) {
        menu.option[RELEASE_INDEX].value -= menu.option[RELEASE_INDEX].step;
    } else if(value == OPTION_NEXT) {
        menu.option[RELEASE_INDEX].value += menu.option[RELEASE_INDEX].step;
    }
    menu.option[RELEASE_INDEX].value &= 0xf;
    CHAR_RAM[RELEASE_DIGITS_POS] = int2hexpetscii[menu.option[RELEASE_INDEX].value];
}

// DFREQ MENU
void dfreq_menu_cycle_step(void) {
    COLOR_RAM[ DFREQ_DIGITS_POS + menu.option[DFREQ_INDEX].digit_index ] = OPTION_ON_COLOR;

    unsigned value = menu.option[DFREQ_INDEX].step;
    if(value == 0x1000)
        menu.option[DFREQ_INDEX].step = 0x0100;
    else if(value == 0x0100)
        menu.option[DFREQ_INDEX].step = 0x0010;
    else if(value == 0x0010)
        menu.option[DFREQ_INDEX].step = 0x0001;
    else if(value == 0x0001)
        menu.option[DFREQ_INDEX].step = 0x1000;

    menu.option[DFREQ_INDEX].digit_index++;
    menu.option[DFREQ_INDEX].digit_index &= 0x3;
    COLOR_RAM[ DFREQ_DIGITS_POS + menu.option[DFREQ_INDEX].digit_index ] = OPTION_ON_SELECTED_COLOR;
}

void dfreq_menu_change_color(byte color) {
    COLOR_RAM[ DFREQ_DIGITS_POS + menu.option[DFREQ_INDEX].digit_index ] = color;
}

void dfreq_menu_change_value(byte diff) {
    if(diff == OPTION_PREVIOUS)
        menu.option[DFREQ_INDEX].value -= menu.option[DFREQ_INDEX].step;
    else if(diff == OPTION_NEXT)
        menu.option[DFREQ_INDEX].value += menu.option[DFREQ_INDEX].step;
    int value = menu.option[DFREQ_INDEX].value;
    CHAR_RAM[DFREQ_DIGITS_POS+0] = int2hexpetscii[(value >> 12) & 0x0f];
    CHAR_RAM[DFREQ_DIGITS_POS+1] = int2hexpetscii[(value >> 8) & 0x0f];
    CHAR_RAM[DFREQ_DIGITS_POS+2] = int2hexpetscii[(value >> 4) & 0x0f];
    CHAR_RAM[DFREQ_DIGITS_POS+3] = int2hexpetscii[(value) & 0x0f];
}

// DPWM MENU
void dpwm_menu_cycle_step(void) {
    COLOR_RAM[ DPWM_DIGITS_POS + menu.option[DPWM_INDEX].digit_index ] = OPTION_ON_COLOR;

    unsigned value = menu.option[DPWM_INDEX].step;
    if(value == 0x100)
        menu.option[DPWM_INDEX].step = 0x010;
    else if(value == 0x010)
        menu.option[DPWM_INDEX].step = 0x001;
    else if(value == 0x001)
        menu.option[DPWM_INDEX].step = 0x100;

    menu.option[DPWM_INDEX].digit_index++;
    if(menu.option[DPWM_INDEX].digit_index > 2)
        menu.option[DPWM_INDEX].digit_index = 0;
    COLOR_RAM[ DPWM_DIGITS_POS + menu.option[DPWM_INDEX].digit_index ] = OPTION_ON_SELECTED_COLOR;
}

void dpwm_menu_change_color(byte color) {
    COLOR_RAM[ DPWM_DIGITS_POS + menu.option[DPWM_INDEX].digit_index ] = color;
}

void dpwm_menu_change_value(byte diff) {
    if(diff == OPTION_PREVIOUS)
        menu.option[DPWM_INDEX].value -= menu.option[DPWM_INDEX].step;
    else if(diff == OPTION_NEXT)
        menu.option[DPWM_INDEX].value += menu.option[DPWM_INDEX].step;
    int value = menu.option[DPWM_INDEX].value;
    CHAR_RAM[DPWM_DIGITS_POS+0] = int2hexpetscii[(value >> 8) & 0x0f];
    CHAR_RAM[DPWM_DIGITS_POS+1] = int2hexpetscii[(value >> 4) & 0x0f];
    CHAR_RAM[DPWM_DIGITS_POS+2] = int2hexpetscii[(value) & 0x0f];
}

// TIME 1 MENU
void time1_menu_cycle_step(void) {
    COLOR_RAM[ TIME1_DIGITS_POS + menu.option[TIME1_INDEX].digit_index ] = OPTION_ON_COLOR;

    unsigned value = menu.option[TIME1_INDEX].step;
    if(value == 0x10) {
        menu.option[TIME1_INDEX].step = 0x01;
    } else if(value == 0x01) {
        menu.option[TIME1_INDEX].step = 0x10;
    }

    menu.option[TIME1_INDEX].digit_index++;
    menu.option[TIME1_INDEX].digit_index &= 0x01;
    COLOR_RAM[ TIME1_DIGITS_POS + menu.option[TIME1_INDEX].digit_index ] = OPTION_ON_SELECTED_COLOR;
}

void time1_menu_change_color(byte color) {
    COLOR_RAM[ TIME1_DIGITS_POS + menu.option[TIME1_INDEX].digit_index ] = color;
}

void time1_menu_change_value(byte value) {
    if(value == OPTION_PREVIOUS)
        menu.option[TIME1_INDEX].value -= menu.option[TIME1_INDEX].step;
    else if(value == OPTION_NEXT)
        menu.option[TIME1_INDEX].value += menu.option[TIME1_INDEX].step;
    char value = menu.option[TIME1_INDEX].value;
    CHAR_RAM[TIME1_DIGITS_POS+0] = int2hexpetscii[ value >> 4 ];
    CHAR_RAM[TIME1_DIGITS_POS+1] = int2hexpetscii[ value & 0x0f];
}

// TIME 0 MENU
void time0_menu_cycle_step(void) {
    COLOR_RAM[ TIME0_DIGITS_POS + menu.option[TIME0_INDEX].digit_index ] = OPTION_ON_COLOR;

    unsigned value = menu.option[TIME0_INDEX].step;
    if(value == 0x10)
        menu.option[TIME0_INDEX].step = 0x01;
    else if(value == 0x01)
        menu.option[TIME0_INDEX].step = 0x10;

    menu.option[TIME0_INDEX].digit_index++;
    menu.option[TIME0_INDEX].digit_index &= 0x01;
    COLOR_RAM[ TIME0_DIGITS_POS + menu.option[TIME0_INDEX].digit_index ] = OPTION_ON_SELECTED_COLOR;
}

void time0_menu_change_color(byte color) {
    COLOR_RAM[ TIME0_DIGITS_POS + menu.option[TIME0_INDEX].digit_index ] = color;
}

void time0_menu_change_value(byte value) {
    if(value == OPTION_PREVIOUS)
        menu.option[TIME0_INDEX].value -= menu.option[TIME0_INDEX].step;
    else if(value == OPTION_NEXT)
        menu.option[TIME0_INDEX].value += menu.option[TIME0_INDEX].step;
    char value = menu.option[TIME0_INDEX].value;
    CHAR_RAM[TIME0_DIGITS_POS+0] = int2hexpetscii[ value >> 4 ];
    CHAR_RAM[TIME0_DIGITS_POS+1] = int2hexpetscii[ value & 0x0f];
}

