
char one_track_window_process_keyboard_events(void) {

  byte play = FALSE;

  // get the key
  keyb_poll();
  byte _key = keyb_codes[keyb_key & 0x7f];

  if (_key == 'e' || _key == KEY_ESCAPE || _key == KEY_ARROW_LEFT) {
    return TRUE;                              // exit main menu
  } else if (_key == KEY_UP || _key == 'i') { // cursor up
    one_track_window_go_up();
    play = TRUE;
  } else if (_key == KEY_DOWN || _key == 'k') { // cursor down
    one_track_window_go_down();
    play = TRUE;
  } else if (_key == KEY_LEFT || _key == 'j') { // cursor left
    one_track_window_go_left();
    play = TRUE;
  } else if (_key == KEY_RIGHT || _key == 'l') { // cursor right
    one_track_window_go_right();
    play = TRUE;
  } else if (_key == KEY_RETURN || _key == KEY_SPACE) { // return
    play = TRUE;
  } else if (_key == 'a') {
    run_as_child(INFO_WINDOW);
  } else if (_key == 'f') {

    run_as_child(LOADER_WINDOW);
    if (argv.cp0 == TRUE) { // success loading file; refresh screen
        refresh_screen();
    }

  } else if (_key == 'r') {

    // RENAME LABEL

    // prepare label for edition
    one_track_window_option_normal_text();

    // send arguments to child
    // cp0      label xpos
    // cp1      label ypos
    // cp2      label length
    argv.cp0 = ONE_TRACK_ALIGN_X + one_track_column * ONE_TRACK_FIELD_SIZE;
    argv.cp1 = ONE_TRACK_ALIGN_Y + one_track_row;
    argv.cp2 = SOUND_BANK_FIELD_SIZE - 1;

    // run child
    run_as_child(EDIT_LABEL_WINDOW);

    // save new sound name to buffer
    one_track_copy_screen_name_to_view_buffer();

    // edition done, invert label
    one_track_window_option_invert_text();
  }

  if (play)
    sidfx_play(2, SIDFXExplosion, 1);

  return FALSE;
}

/* void sounds_process_joystick_events( void ) { */
/* } */
