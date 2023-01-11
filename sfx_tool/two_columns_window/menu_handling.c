
unsigned two_columns_window_calculate_pos_48(void) {
  return (TWO_COLUMNS_ALIGN_Y + two_columns_row) * 40 +
         (two_columns_column * TWO_COLUMNS_FIELD_SIZE) + TWO_COLUMNS_ALIGN_X;
}

void two_columns_window_option_normal_text(void) {
  unsigned pos = two_columns_window_calculate_pos_48();
  for (int i = 0; i < SOUND_NAME_LENGTH; i++) {
    CHAR_RAM[pos + i] = CHAR_RAM[pos + i] & 127;
  }
}

void two_columns_window_option_invert_text(void) {
  unsigned pos = two_columns_window_calculate_pos_48();
  for (int i = 0; i < SOUND_NAME_LENGTH; i++) {
    CHAR_RAM[pos + i] = CHAR_RAM[pos + i] | 128;
  }
}

void two_columns_window_deselect_option(void) {
  unsigned pos = two_columns_window_calculate_pos_48();
  for (int i = 0; i < SOUND_NAME_LENGTH; i++) {
    COLOR_RAM[pos + i] = OPTION_ON_COLOR;
    CHAR_RAM[pos + i] = CHAR_RAM[pos + i] & 127;
  }
}

void two_columns_window_select_option(void) {
  unsigned pos = two_columns_window_calculate_pos_48();
  for (int i = 0; i < SOUND_NAME_LENGTH; i++) {
    COLOR_RAM[pos + i] = OPTION_ON_SELECTED_COLOR;
    CHAR_RAM[pos + i] = CHAR_RAM[pos + i] | 128;
  }
  byte index = two_columns_column * TWO_COLUMNS_VIEW_ROWS + two_columns_row;
  store_sfx_to_clipboard( & sound_bank[index] );
}

void two_columns_window_go_left(void) {
  two_columns_window_deselect_option();
  two_columns_column -= 1;
  if (two_columns_column > TWO_COLUMNS_VIEW_COLUMNS)
    two_columns_column = TWO_COLUMNS_VIEW_COLUMNS-1;
  two_columns_window_select_option();
}

void two_columns_window_go_right(void) {
  two_columns_window_deselect_option();
  two_columns_column += 1;
  if (two_columns_column == TWO_COLUMNS_VIEW_COLUMNS)
    two_columns_column = 0;
  two_columns_window_select_option();
}

void two_columns_window_go_up(void) {
  two_columns_window_deselect_option();
  two_columns_row -= 1;
  if (two_columns_row > TWO_COLUMNS_VIEW_ROWS)
    two_columns_row = TWO_COLUMNS_VIEW_ROWS-1;
  two_columns_window_select_option();
}

void two_columns_window_go_down(void) {
  two_columns_window_deselect_option();
  two_columns_row += 1;
  if (two_columns_row == TWO_COLUMNS_VIEW_ROWS)
    two_columns_row = 0;
  two_columns_window_select_option();
}
