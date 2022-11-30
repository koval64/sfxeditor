
unsigned calculate_pos_48(void) {
  return (ONE_TRACK_ALIGN_Y + one_track_row) * 40 +
         (one_track_column * ONE_TRACK_FIELD_SIZE) + ONE_TRACK_ALIGN_X;
}

void one_track_window_option_normal_text(void) {
  unsigned pos = calculate_pos_48();
  for (int i = 0; i < SFX_NAME_LEN; i++) {
    CHAR_RAM[pos + i] = CHAR_RAM[pos + i] - 128;
  }
}

void one_track_window_option_invert_text(void) {
  unsigned pos = calculate_pos_48();
  for (int i = 0; i < SFX_NAME_LEN; i++) {
    CHAR_RAM[pos + i] = CHAR_RAM[pos + i] + 128;
  }
}

void one_track_window_deselect_option(void) {
  unsigned pos = calculate_pos_48();
  for (int i = 0; i < SFX_NAME_LEN; i++) {
    COLOR_RAM[pos + i] = OPTION_ON_COLOR;
    CHAR_RAM[pos + i] = CHAR_RAM[pos + i] - 128;
  }
}

void one_track_window_select_option(void) {
  unsigned pos = calculate_pos_48();
  for (int i = 0; i < SFX_NAME_LEN; i++) {
    COLOR_RAM[pos + i] = OPTION_ON_SELECTED_COLOR;
    CHAR_RAM[pos + i] = CHAR_RAM[pos + i] + 128;
  }
  byte index = one_track_column * ONE_TRACK_VIEW_ROWS + one_track_row;
  copy_sfx_from_sound_bank_into_first_sfx_slot(index);
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
