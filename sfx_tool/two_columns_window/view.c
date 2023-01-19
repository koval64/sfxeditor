
void two_columns_window_view_buffer_set_sound_name(char * name, char nr) {
  char x = TWO_COLUMNS_ALIGN_X + (nr / TWO_COLUMNS_VIEW_ROWS) * TWO_COLUMNS_FIELD_SIZE;
  char y = nr % TWO_COLUMNS_VIEW_ROWS;
  unsigned pos = (40 * y + x);

  memcpy( & char_ram_buffer[pos], name, SOUND_NAME_LENGTH);
}
