
char sound_effect_info_process_keyboard_events(void) {

    // get the key
    keyb_poll();
    byte _key = keyb_codes[keyb_key & 0x7f];

    if ( _key == 'i' || _key == 'q' || \
            _key == KEY_SPACE || _key == KEY_ESCAPE || _key == KEY_ARROW_LEFT ) {
        return TRUE;      // exit main menu
    } else if ( _key == 'd' ) {
        // dump sound info into text file
        exporter_save_file();
        return TRUE;
    } else
        return FALSE;
}

