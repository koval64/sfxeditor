
// menu helpers - global variables used only here
int prevx = 0;
int prevy = 0;
int prevb = 0;

// menu helpers - frequency choosen - global variables used only here
int octave = 2;
int note = 7;

char edit_window_process_keyboard_events() {

    // get the key
    keyb_poll();
    byte _key = keyb_codes[keyb_key & 0x7f];
    byte play = TRUE;

    if (_key == 'z' || _key == 'b' || _key == KEY_SPACE || _key == KEY_ESCAPE || _key == KEY_ARROW_LEFT ) {
        return TRUE;
        /* play = FALSE; */
    } else if (_key == 'q') {
        note = 0;
        select_note(NOTES_COLOR_KEY_Q);
    } else if(_key == '2') {
        note = 1;
        select_note(NOTES_COLOR_KEY_2);
    } else if(_key == 'w') {
        note = 2;
        select_note(NOTES_COLOR_KEY_W);
    } else if(_key == '3') {
        note = 3;
        select_note(NOTES_COLOR_KEY_3);
    } else if(_key == 'e') {
        note = 4;
        select_note(NOTES_COLOR_KEY_E);
    } else if(_key == 'r') {
        note = 5;
        select_note(NOTES_COLOR_KEY_R);
    } else if(_key == '5') {
        note = 6;
        select_note(NOTES_COLOR_KEY_5);
    } else if(_key == 't') {
        note = 7;
        select_note(NOTES_COLOR_KEY_T);
    } else if(_key == '6') {
        note = 8;
        select_note(NOTES_COLOR_KEY_6);
    } else if(_key == 'y') {
        note = 9;
        select_note(NOTES_COLOR_KEY_Y);
    } else if(_key == '7') {
        note = 10;
        select_note(NOTES_COLOR_KEY_7);
    } else if(_key == 'u') {
        note = 11;
        select_note(NOTES_COLOR_KEY_U);
    } else if(_key == 'i') {
        note = 12;
        select_note(NOTES_COLOR_KEY_I);
    } else if(_key == '9') {
        note = 13;
        select_note(NOTES_COLOR_KEY_9);
    } else if(_key == 'o') {
        note = 14;
        select_note(NOTES_COLOR_KEY_O);
    } else if(_key == '0') {
        note = 15;
        select_note(NOTES_COLOR_KEY_0);
    } else if(_key == 'p') {
        note = 16;
        select_note(NOTES_COLOR_KEY_P);
    } else if(_key == '@') {
        note = 17;
        select_note(NOTES_COLOR_KEY_AT);
    } else if(_key == '-') {
        note = 18;
        select_note(NOTES_COLOR_KEY_MINUS);
    } else if(_key == '*') {
        note = 19;
        select_note(NOTES_COLOR_KEY_ASTERISK);
    }

    /* choose octave */
    else if (_key == 'a') {
        octave = 0;
        OCTAVE_MENU_DIGIT_ADDR[0] = '0';
        select_new_octave(OCTAVE_0_X_COLOR_POSITION);
    } else if(_key == 's') {
        octave = 12;
        OCTAVE_MENU_DIGIT_ADDR[0] = '1';
        select_new_octave(OCTAVE_1_X_COLOR_POSITION);
    } else if(_key == 'd') {
        octave = 24;
        OCTAVE_MENU_DIGIT_ADDR[0] = '2';
        select_new_octave(OCTAVE_2_X_COLOR_POSITION);
    } else if(_key == 'f') {
        octave = 36;
        OCTAVE_MENU_DIGIT_ADDR[0] = '3';
        select_new_octave(OCTAVE_3_X_COLOR_POSITION);
    } else if(_key == 'g') {
        octave = 48;
        OCTAVE_MENU_DIGIT_ADDR[0] = '4';
        select_new_octave(OCTAVE_4_X_COLOR_POSITION);
    } else if(_key == 'h') {
        octave = 60;
        OCTAVE_MENU_DIGIT_ADDR[0] = '5';
        select_new_octave(OCTAVE_5_X_COLOR_POSITION);
    } else if(_key == 'j') {
        octave = 72;
        OCTAVE_MENU_DIGIT_ADDR[0] = '6';
        select_new_octave(OCTAVE_6_X_COLOR_POSITION);
    } else if(_key == 'k') {
        octave = 84;
        OCTAVE_MENU_DIGIT_ADDR[0] = '7';
        select_new_octave(OCTAVE_7_X_COLOR_POSITION);
    } else if(_key == KEY_UP ) {        // cursor up
        update_vertical_menu( MENU_UP );
        play = FALSE;
    } else if(_key == KEY_DOWN ) {      // cursor down
        update_vertical_menu( MENU_DOWN );
        play = FALSE;
    } else if(_key == KEY_LEFT ) {      // cursor left
        update_horizontal_menu( OPTION_PREVIOUS );
        play = FALSE;
    } else if(_key == KEY_RIGHT ) {     // cursor right
        update_horizontal_menu( OPTION_NEXT );
        play = FALSE;
    } else if(_key == KEY_RETURN ) {
        menu.option[menu.index].change_step ();     // 1 - left, 3 - right
        play = FALSE;
    } else
        play = FALSE;

    if( play ) {
        int sum = octave + note;
        if( sum < 96) {
            int freq = notes_pal_table[ sum ];
            SIDFXFocus[0].freq = freq;
            sidfx_play(2, SIDFXFocus, 1);
        }
    }
    return FALSE;
}

void edit_window_process_joystick_events( void ) {

    // Poll joystick
    joy_poll(0);

    if ( joyy[0] != prevy ) {
        if( joyy[0] != 0 )
          update_vertical_menu( joyy[0] );
        prevy = joyy[0];
    }

    if ( joyx[0] != prevx ) {
        if ( joyx[0] != 0 )
          update_horizontal_menu( joyx[0] + 1 );  // 0 left - 2 right
        prevx = joyx[0];
    }

    if ( joyb[0] != prevb ) {
        if( joyb[0] == 1 )
          sidfx_play(0, SIDFXFocus, 1);
        prevb = joyb[0];
    }
}

