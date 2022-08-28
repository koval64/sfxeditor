
char sound_effect_info_process_keyboard_events(void) {

    // get the key
    keyb_poll();
    byte _key = keyb_codes[keyb_key & 0x7f];

    if ( _key == 32 || _key == 'q' || _key == 27 || _key == 95) {
        return true;      // exit main menu
    } else if ( _key == 'd' ) {
        // dump sound info into text file
        exporter_save_file();
        return true;
    } else
        return false;
}

