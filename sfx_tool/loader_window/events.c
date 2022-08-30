
char loader_process_keyboard_events(void) {

    // get the key
    keyb_poll();
    byte _key = keyb_codes[keyb_key & 0x7f];

    if ( _key == 'b' || _key == 'q' || _key == 32 || _key == 27 || _key == 95) {
        return true;      // exit main menu
    } else if ( _key == 's' ) {
        loader_save_file();
        return true;
    } else if ( _key == 'l' ) {
        loader_load_file();
        return true;
    } else
        return false;
}

