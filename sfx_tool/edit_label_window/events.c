
char edit_label_window_process_keyboard_events( void ) {

    // get the key
    keyb_poll();
    byte _key = keyb_codes[keyb_key & 0x7f];

    if ( _key == KEY_ESCAPE || _key == KEY_GRAVE || _key == KEY_RETURN || \
            _key == KEY_UP || _key == KEY_DOWN ) {
        return TRUE;      // exit main menu
    } else if ( _key == KEY_RESTORE ) {      // restore key as backspace
        label_backspace();
    } else if ( _key >= KEY_A && _key <= KEY_Z ) {   // small letters
        label_add_char( _key - 96 );            // (-96) - align to petscii
    } else {
        // print also if _key is one of the keys in the key_filter
        for ( char i=0; i<KEY_FILTER_CHAR_ARRAY_SIZE; i++ ) {
            if ( _key == key_filter[ i ] ) {
                label_add_char( _key );
            }
        }
    }
    return FALSE;
}

