
char sounds_process_keyboard_events( void ) {

    byte play = FALSE;

    // get the key
    keyb_poll();
    byte _key = keyb_codes[keyb_key & 0x7f];

    if ( _key == 'e' || _key == 27 || _key == 95) {
        return TRUE;      // exit main menu
    } else if( _key == 145 ) {    // cursor up
        go_up();
        play = TRUE;
    } else if( _key == 17 )  {    // cursor down
        go_down();
        play = TRUE;
    } else if( _key == 157 ) {    // cursor left
        go_left();
        play = TRUE;
    } else if( _key == 29 )  {    // cursor right
        go_right();
        play = TRUE;
    } else if( _key == 13 || _key == 32 )  {    // return
        play = TRUE;
    } else if( _key == 'i' ) {
        run_as_child( INFO_WINDOW );
    } else if( _key == 'b' ) {
        run_as_child( LOADER_WINDOW );
    }

    if ( play )
        sidfx_play(2, SIDFXExplosion, 1);

    return FALSE;
}

/* void sounds_process_joystick_events( void ) { */
/* } */

