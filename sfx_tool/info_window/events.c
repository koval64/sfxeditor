
char sound_effect_info_process_keyboard_events(void) {

    // get the key
    keyb_poll();
    byte _key = keyb_codes[keyb_key & 0x7f];

    if ( _key == 'i' || _key == 'q' || _key == 32 || _key == 27 || _key == 95 ) {
        return TRUE;      // exit main menu
    } else if ( _key == 'd' ) {
        // dump sound info into text file
        exporter_save_file();
        return TRUE;
    } else
        return FALSE;
}
