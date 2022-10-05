
char sound_bank_window_process_keyboard_events( void ) {

    byte play = FALSE;

    // get the key
    keyb_poll();
    byte _key = keyb_codes[keyb_key & 0x7f];

    if ( _key == 'e' || _key == KEY_ESCAPE || _key == KEY_ARROW_LEFT) {
        return TRUE;      // exit main menu
    } else if( _key == KEY_UP || _key == 'k' ) {    // cursor up
        sound_bank_window_go_up();
        play = TRUE;
    } else if( _key == KEY_DOWN || _key == 'j' )  {    // cursor down
        sound_bank_window_go_down();
        play = TRUE;
    } else if( _key == KEY_LEFT || _key == 'h' ) {    // cursor left
        sound_bank_window_go_left();
        play = TRUE;
    } else if( _key == KEY_RIGHT || _key == 'l' )  {    // cursor right
        sound_bank_window_go_right();
        play = TRUE;
    } else if( _key == KEY_RETURN || _key == KEY_SPACE )  {    // return
        play = TRUE;
    } else if( _key == 'i' ) {
        run_as_child( INFO_WINDOW );
    } else if( _key == 'b' ) {

        run_as_child( LOADER_WINDOW );

        if ( argv.cp0 == TRUE ) {   // loaded new file; frefresh screen
                                    //
            // copy buffor data (view) to screen
            copy_to_screen(sound_bank_view_data);

            // select default menu option
            sound_bank_window_select_option();
        }

    } else if( _key == 'r' ) {

        // RENAME LABEL

        sound_bank_window_option_normal_text();

        // send arguments to child
        argv.cp0 = 1 + column * SOUND_BANK_FIELD_SIZE;
        argv.cp1 = row;
        argv.cp2 = SOUND_BANK_FIELD_SIZE-1;

        // run child
        run_as_child( EDIT_LABEL_WINDOW );

        // save new sound name to buffor
        copy_screen_name_to_view_buffor();

        sound_bank_window_option_invert_text();
    }

    if ( play )
        sidfx_play(2, SIDFXExplosion, 1);

    return FALSE;
}

/* void sounds_process_joystick_events( void ) { */
/* } */

