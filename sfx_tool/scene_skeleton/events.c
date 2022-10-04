
char scene_name_window_process_keyboard_events(void) {

    // get the key
    keyb_poll();
    byte _key = keyb_codes[keyb_key & 0x7f];

    if ( _key == 'b' || _key == 'q' || \
            _key == KEY_SPACE || _key == KEY_ESCAPE || _key == KEY_ARROW_LEFT) {
        return TRUE;      // exit main menu
    } else if ( _key == 's' ) {
        return TRUE;
    } else if ( _key == 'l' ) {
        return TRUE;
    } else
        return FALSE;
}


/* void scene_name_window_process_joystick_events( void ) { */
/* } */

