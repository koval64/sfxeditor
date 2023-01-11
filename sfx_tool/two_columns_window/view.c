
void two_columns_window_init_view_buffer(void) {

  char empty[] = " -           ";
  int pos = TWO_COLUMNS_ALIGN_X;
  for (char i=0; i<TWO_COLUMNS_VIEW_SOUND_COUNT; i++) {
      for (char j = 0; j < TWO_COLUMNS_FIELD_SIZE; j++) {
        char_ram_buffer[pos] = empty[j];
        pos++;
      }
      pos +=  40 - TWO_COLUMNS_FIELD_SIZE ;
      if ( (i % TWO_COLUMNS_VIEW_ROWS) == (TWO_COLUMNS_VIEW_ROWS-1) ) {
          pos = TWO_COLUMNS_ALIGN_X + ( i / (TWO_COLUMNS_VIEW_ROWS-1) ) * TWO_COLUMNS_FIELD_SIZE;
      }
  }
}

void two_columns_window_copy_screen_name_to_view_buffer(void) {
  char x = TWO_COLUMNS_ALIGN_X + two_columns_column * TWO_COLUMNS_FIELD_SIZE;
  char y = two_columns_row;
  char length = TWO_COLUMNS_FIELD_SIZE - 1;

  int pos = 40 * y + x;
  char index = two_columns_column * TWO_COLUMNS_VIEW_ROWS + two_columns_row;

  for (int i = 0; i < length; i++) {
    char tmp = CHAR_RAM[pos + i];
    char_ram_buffer[pos + i] = tmp;
    sound_bank[index].name[i] = tmp;
  }
}

int two_columns_calcualate_position(char nr) {
  char x = TWO_COLUMNS_ALIGN_X + (nr / TWO_COLUMNS_VIEW_ROWS) * TWO_COLUMNS_FIELD_SIZE;
  char y = nr % TWO_COLUMNS_VIEW_ROWS;
  return 40 * y + x;
}

void two_columns_window_view_buffer_set_sound_name(char *name, char nr) {
  int pos = two_columns_calcualate_position(nr);

  for (int i = 0; i < SOUND_NAME_LENGTH; i++) {
    char_ram_buffer[pos + i] = name[i];
  }
}

void two_columns_window_view_buffer_get_sound_name(char *name, char nr) {
  int pos = two_columns_calcualate_position(nr);

  for (char i = 0; i < SOUND_NAME_LENGTH; i++) {
    name[i] = char_ram_buffer[pos + i];
  }
}
