
char sounds_process_keyboard_events( void ) {

    // get the key
    keyb_poll();
    byte _key = keyb_codes[keyb_key & 0x7f];

    if ( _key == 32 || _key == 'q' || _key == 27 || _key == 95) {
        return true;      // exit main menu
    } else if(_key == 145 ) {   // cursor up
        go_up();
    } else if(_key == 17 )  {    // cursor down
        go_down();
    } else if(_key == 157 ) {   // cursor left
        go_left();
    } else if(_key == 29 )  {    // cursor right
        go_right();
    } else if(_key == 13 )  {    // enter
        // enter
    }

    return false;
}

void sounds_process_joystick_events( void ) {
}

