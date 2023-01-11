
void edit_window_fill_wave_name(char c0, char c1, char c2, char c3, char c4) {
    // put chars on screen
    edit_window_sfx_properties[11] = c0;
    edit_window_sfx_properties[12] = c1;
    edit_window_sfx_properties[13] = c2;
    edit_window_sfx_properties[14] = c3;
    edit_window_sfx_properties[15] = c4;
}

void edit_window_update_buffer_wave_name(void) {

    // fill wave name field

    if(menu.option[WAVEFORM_INDEX].value == 0) {
        // string '  tri'
        edit_window_fill_wave_name(' ', ' ', 0x14, 0x12, 0x09);
    } else if(menu.option[WAVEFORM_INDEX].value == 1) {
        // string '  saw'
        edit_window_fill_wave_name(' ', ' ', 0x13, 0x01, 0x17);
    } else if(menu.option[WAVEFORM_INDEX].value == 2) {
        // string 'pulse'
        edit_window_fill_wave_name(0x10, 0x15, 0x0c, 0x13, 0x05);
    } else if(menu.option[WAVEFORM_INDEX].value == 3) {
        // string 'noise'
        edit_window_fill_wave_name(0x0e, 0x0f, 0x09, 0x13, 0x05);
    }

}

void edit_window_fill_buffers_with_values(void) {

    //
    // edit_window_sfx_properties[]
    //
    // width = 16 bytes
    //

    // update wave name
    edit_window_update_buffer_wave_name();

    // pwm
    unsigned pwm = SIDFXClipboard[0].pwm;
    edit_window_sfx_properties[16*1+13] = byte2hexpetscii[ (pwm >>  8) & 0xf ];
    edit_window_sfx_properties[16*1+14] = byte2hexpetscii[ (pwm >>  4) & 0xf ];
    edit_window_sfx_properties[16*1+15] = byte2hexpetscii[  pwm        & 0x0f];

    // a/d/s/r
    edit_window_sfx_properties[16*2+15] = byte2hexpetscii[ (menu.option[ATTACK_INDEX].value & 0x0f) ];
    edit_window_sfx_properties[16*3+15] = byte2hexpetscii[ (menu.option[DECAY_INDEX ].value & 0x0f) ];
    edit_window_sfx_properties[16*4+15] = byte2hexpetscii[ (menu.option[SUSTAIN_INDEX].value & 0x0f) ];
    edit_window_sfx_properties[16*5+15] = byte2hexpetscii[ (menu.option[RELEASE_INDEX].value & 0x0f) ];

    // dfreq
    int dfreq = menu.option[DFREQ_INDEX].value;
    edit_window_sfx_properties[16*6+12] = byte2hexpetscii[(dfreq >> 12) & 0x0f];
    edit_window_sfx_properties[16*6+13] = byte2hexpetscii[(dfreq >> 8) & 0x0f];
    edit_window_sfx_properties[16*6+14] = byte2hexpetscii[(dfreq >> 4) & 0x0f];
    edit_window_sfx_properties[16*6+15] = byte2hexpetscii[(dfreq) & 0x0f];

    // dpwm
    int dpwm = menu.option[DPWM_INDEX].value;
    edit_window_sfx_properties[16*7+13] = byte2hexpetscii[(dpwm >> 8) & 0x0f];
    edit_window_sfx_properties[16*7+14] = byte2hexpetscii[(dpwm >> 4) & 0x0f];
    edit_window_sfx_properties[16*7+15] = byte2hexpetscii[(dpwm) & 0x0f];

    // time 1
    char time1 = menu.option[TIME1_INDEX].value;
    edit_window_sfx_properties[16*8+14] = byte2hexpetscii[ time1 >> 4 ];
    edit_window_sfx_properties[16*8+15] = byte2hexpetscii[ time1 & 0x0f];

    // time 0
    char time0 = menu.option[TIME0_INDEX].value;
    edit_window_sfx_properties[16*9+14] = byte2hexpetscii[ time0 >> 4 ];
    edit_window_sfx_properties[16*9+15] = byte2hexpetscii[ time0 & 0x0f];

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

        if( menu.index == PWM_INDEX || menu.index == DPWM_INDEX )
            menu.index++;

    }

    // select default option
    for(int i=0; i<9; i++)
        COLOR_RAM[MENU_START_POS+(40*menu.index)+i] = OPTION_ON_SELECTED_COLOR;

    // select default option value
    menu.option[menu.index].change_color (OPTION_ON_SELECTED_COLOR);

    // find note index
    byte note_index = find_note( SIDFXClipboard[0].freq );

    // global variables from "events.c" file
    octave = note_index / 12;
    note   = note_index % 12;

    // print default octave number
    edit_window_piano[7] = byte2hexpetscii[ octave ];

    // global variables from "menu_handling.c" file
    prev_octave_position = octaves_color_positions[ octave ];
    prev_note_position   = piano_notes_color_positions[ note ];

    // select default octave key
    OCTAVE_MENU_COLOR_ADDR[ prev_octave_position ]  = OPTION_ON_SELECTED_COLOR;

    // select default note key
    SEMINOTES_COLOR_POSITIONS[ prev_note_position ] = OPTION_ON_SELECTED_COLOR;

    // project necessity
    octave *= 12;

}

