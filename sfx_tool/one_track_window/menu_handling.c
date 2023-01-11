
unsigned one_track_window_calculate_pos_48(void) {
  return (ONE_TRACK_ALIGN_Y + one_track_row) * 40 +
         (one_track_column * ONE_TRACK_FIELD_SIZE) + ONE_TRACK_ALIGN_X;
}

void one_track_window_option_normal_text(void) {
  unsigned pos = one_track_window_calculate_pos_48();
  for (int i = 0; i < SOUND_NAME_LENGTH; i++) {
    CHAR_RAM[pos + i] = CHAR_RAM[pos + i] & 127;
  }
}

void one_track_window_option_invert_text(void) {
  unsigned pos = one_track_window_calculate_pos_48();
  for (int i = 0; i < SOUND_NAME_LENGTH; i++) {
    CHAR_RAM[pos + i] = CHAR_RAM[pos + i] | 128;
  }
}

void one_track_window_deselect_option(void) {
  unsigned pos = one_track_window_calculate_pos_48();
  for (int i = 0; i < SOUND_NAME_LENGTH; i++) {
    COLOR_RAM[pos + i] = OPTION_ON_COLOR;
    CHAR_RAM[pos + i] = CHAR_RAM[pos + i] & 127;
  }
}

void one_track_window_select_option(void) {
  unsigned pos = one_track_window_calculate_pos_48();
  for (int i = 0; i < SOUND_NAME_LENGTH; i++) {
    COLOR_RAM[pos + i] = OPTION_ON_SELECTED_COLOR;
    CHAR_RAM[pos + i] = CHAR_RAM[pos + i] | 128;
  }
  byte index = one_track_column * ONE_TRACK_VIEW_ROWS + one_track_row;
  store_sfx_to_clipboard( & one_track[index] );
}

void one_track_window_go_left(void) {
  one_track_window_deselect_option();
  one_track_column -= 1;
  if (one_track_column > ONE_TRACK_VIEW_COLUMNS)
    one_track_column = ONE_TRACK_VIEW_COLUMNS-1;
  one_track_window_select_option();
}

void one_track_window_go_right(void) {
  one_track_window_deselect_option();
  one_track_column += 1;
  if (one_track_column == ONE_TRACK_VIEW_COLUMNS)
    one_track_column = 0;
  one_track_window_select_option();
}

void one_track_window_go_up(void) {
  one_track_window_deselect_option();
  one_track_row -= 1;
  if (one_track_row > ONE_TRACK_VIEW_ROWS)
    one_track_row = ONE_TRACK_VIEW_ROWS-1;
  one_track_window_select_option();
}

void one_track_window_go_down(void) {
  one_track_window_deselect_option();
  one_track_row += 1;
  if (one_track_row == ONE_TRACK_VIEW_ROWS)
    one_track_row = 0;
  one_track_window_select_option();
}
