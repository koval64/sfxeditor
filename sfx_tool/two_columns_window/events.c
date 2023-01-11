
char two_columns_window_process_keyboard_events(void) {

  byte play = FALSE;

  // get the key
  keyb_poll();
  byte _key = keyb_codes[keyb_key & 0x7f];

  if (_key == KEY_ESCAPE || _key == KEY_ARROW_LEFT) {
    return SWITCH_WINDOW;                              // exit main menu
  } else if (_key == KEY_UP || _key == 'i') { // cursor up
    two_columns_window_go_up();
    play = TRUE;
  } else if (_key == KEY_DOWN || _key == 'k') { // cursor down
    two_columns_window_go_down();
    play = TRUE;
  } else if (_key == KEY_LEFT || _key == 'j') { // cursor left
    two_columns_window_go_left();
    play = TRUE;
  } else if (_key == KEY_RIGHT || _key == 'l') { // cursor right
    two_columns_window_go_right();
    play = TRUE;
  } else if (_key == KEY_RETURN || _key == KEY_SPACE) { // return
    play = TRUE;
  } else if (_key == 'a') {
    run_as_child(INFO_WINDOW);
  } else if (_key == 'e') {
    run_as_child(EDIT_WINDOW);

    // copy edit_menu sound into sound bank actual instrument
    byte index = two_columns_column * TWO_COLUMNS_VIEW_ROWS + two_columns_row;
    restore_sfx_from_clipboard( & sound_bank[index] );

    return REFRESH_SCENE;
  } else if (_key == 'b') {
    run_as_child(LOADER_WINDOW);
    if (argv.cp0 == TRUE) { // success loading file; refresh screen
        return REFRESH_SCENE;
    }

  } else if (_key == 'r') {

    // RENAME LABEL

    // prepare label for edition
    two_columns_window_option_normal_text();

    // send arguments to child
    // cp0      label xpos
    // cp1      label ypos
    // cp2      label length
    argv.cp0 = TWO_COLUMNS_ALIGN_X + two_columns_column * TWO_COLUMNS_FIELD_SIZE;
    argv.cp1 = TWO_COLUMNS_ALIGN_Y + two_columns_row;
    argv.cp2 = SOUND_BANK_FIELD_SIZE - 1;

    // run child
    run_as_child(EDIT_LABEL_WINDOW);

    // save new sound name to buffer
    two_columns_window_copy_screen_name_to_view_buffer();

    // edition done, invert label
    two_columns_window_option_invert_text();
  }

  if (play) {
    sidfx_play(2, SIDFXClipboard, 1);
    /* sidfx_play(2, SIDFXTrack, 10); */
  }

  return NO_OPERATION;
}

/* void sounds_process_joystick_events( void ) { */
/* } */
