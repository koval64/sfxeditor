
char loader_process_keyboard_events(void) {

    // get the key
    keyb_poll();
    byte _key = keyb_codes[keyb_key & 0x7f];

    if ( _key == 'f' || _key == 'b' || _key == KEY_ESCAPE || _key == KEY_ARROW_LEFT) {
        return TRUE;      // exit main menu
    } else if ( _key == 's' ) {
        loader_save_file();
        return TRUE;
    } else if ( _key == 'l' ) {
        loader_load_file();
        argv.cp0 = TRUE;        // set flag 'loaded'
        return TRUE;
    } else
        return FALSE;
}

