
// DESELECT PREVIOUS MENU OPTION AND SELECT NEW ONE
void select_option(char new_opt) {

    unsigned ypos_off = MENU_START_POS + (40 * menu.index);
    unsigned ypos_on  = MENU_START_POS + (40 * new_opt);

    for(int i = 0; i<9; i++) {
        // DESELECT PREVIOUS OPTION
        COLOR_RAM[ypos_off+i] = OPTION_COLOR_GRAY_OUT;
        // SELECT NEW OPTION
        COLOR_RAM[ypos_on +i] = OPTION_COLOR_SELECTED;
    }

    // DESELECT PREVIOUS OPTION VALUE
    menu.option[menu.index].change_color (OPTION_COLOR_GRAY_OUT);

    // SELECT NEW OPTION VALUE
    menu.option[new_opt].change_color (OPTION_COLOR_SELECTED);

}

void update_vertical_menu( char direction ) {
    char new_opt = menu.index + direction;

    // SKIP PWM AND DPWM SETTINGS IF NOT PULSE WAVEFORM
    if(new_opt == PWM_INDEX || new_opt == DPWM_INDEX) {
        if(menu.option[WAVEFORM_INDEX].value != WAVE_PULSE)
            new_opt += direction;
    }

    // keep options index in range( 0, OPTIONS_COUNT-1)
    if(new_opt == OPTIONS_COUNT)          // last option + 1  = go to first option
        new_opt = 0;
    else if (new_opt > OPTIONS_COUNT)     // first option - 1 = go to last option
        new_opt = OPTIONS_COUNT-1;

    // UPDATE
    select_option(new_opt);

    // REMEMBER CHOOSEN OPTION
    menu.index = new_opt;
}

void update_horizontal_menu( char direction ) {
    menu.option[menu.index].change_value (direction);     // direction = 1 - left, 3 - right
    update_sidfx_struct();
    sidfx_play(1, SIDFXFocus, 1);
}

void horizontal_menu_cycle_step(void) {
    menu.option[menu.index].change_step ();
}

// menu helpers - global variables used only here
unsigned prev_octave_position = OCTAVE_2_X_COLOR_POSITION;
unsigned prev_note_position   = NOTES_COLOR_KEY_T;

void select_new_octave(char new_position) {
    OCTAVE_MENU_COLOR_ADDR[prev_octave_position]  = OPTION_COLOR_GRAY_OUT;
    OCTAVE_MENU_COLOR_ADDR[new_position]          = OPTION_COLOR_SELECTED;
    prev_octave_position = new_position;
}

void select_note(char new_position) {
    SEMINOTES_COLOR_POSITIONS[prev_note_position] = OPTION_COLOR_GRAY_OUT;
    SEMINOTES_COLOR_POSITIONS[new_position]       = OPTION_COLOR_SELECTED;
    prev_note_position = new_position;
}

