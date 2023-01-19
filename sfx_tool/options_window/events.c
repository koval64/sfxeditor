
char options_window_process_keyboard_events(void) {

    // get the key
    keyb_poll();
    byte _key = keyb_codes[keyb_key & 0x7f];

    if (_key == KEY_F1 || _key == 'q' || _key == 'm' || _key == KEY_ESCAPE || _key == KEY_ARROW_LEFT) {
        return TRUE;      // exit main menu
    } else if ( _key == 'd' ) {
        // dump sound info into text file
        exporter_save_file();
        return TRUE;
    } else if (_key == 's') {
        loader_save_file();
        return TRUE;
    } else if (_key == 'i') {
        run_as_child(INFO_WINDOW);
    } else if (_key == 'l') {
        loader_load_file();
        return TRUE;
    }
    return FALSE;
}

