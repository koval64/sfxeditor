
void vertical_line(void) {
    int pos = 13;
    for (char i=0; i<24; i++) {
        char_ram_buffer[pos] = 0x5d;
        pos += 40;
    }
}

void one_track_init_view_buffer(void) {

  char empty[] = " -           ";
  int pos = ONE_TRACK_ALIGN_X;
  for (char i=0; i<ONE_TRACK_VIEW_SOUND_COUNT; i++) {
      for (char j = 0; j < ONE_TRACK_FIELD_SIZE; j++) {
        char_ram_buffer[pos] = empty[j];
        pos++;
      }
      pos +=  40 - ONE_TRACK_FIELD_SIZE ;
      if ( (i % ONE_TRACK_VIEW_ROWS) == (ONE_TRACK_VIEW_ROWS-1) ) {
          pos = ONE_TRACK_ALIGN_X + ( i / (ONE_TRACK_VIEW_ROWS-1) ) * ONE_TRACK_FIELD_SIZE;
      }
  }
}

void one_track_copy_screen_name_to_view_buffer(void) {
  char x = ONE_TRACK_ALIGN_X + one_track_column * ONE_TRACK_FIELD_SIZE;
  char y = one_track_row;
  char length = ONE_TRACK_FIELD_SIZE - 1;

  int pos = 40 * y + x;
  char index = one_track_column * ONE_TRACK_VIEW_ROWS + one_track_row;

  for (int i = 0; i < length; i++) {
    char tmp = CHAR_RAM[pos + i];
    char_ram_buffer[pos + i] = tmp;
    sound_bank.sfx[index].name[i] = tmp;
  }
}

void one_track_view_buffer_set_sound_name(char *name, char nr) {
  char x = ONE_TRACK_ALIGN_X + (nr / ONE_TRACK_VIEW_ROWS) * ONE_TRACK_FIELD_SIZE;
  char y = nr % ONE_TRACK_VIEW_ROWS;
  char length = ONE_TRACK_FIELD_SIZE - 1;

  int pos = 40 * y + x;

  for (int i = 0; i < length; i++) {
    char_ram_buffer[pos + i] = name[i];
  }
}

void one_track_view_buffer_get_sound_name(char *name, char nr) {
  char x =
      ONE_TRACK_ALIGN_X + (nr / ONE_TRACK_VIEW_ROWS) * ONE_TRACK_FIELD_SIZE;
  char y = nr % ONE_TRACK_VIEW_ROWS;
  char length = ONE_TRACK_FIELD_SIZE - 1;

  int pos = 40 * y + x;

  for (char i = 0; i < length; i++) {
    name[i] = char_ram_buffer[pos + i];
  }
}

void refresh_screen() {

  // copy sound names
  for (char i = 0; i < SFX_COUNT; i++) {
    one_track_view_buffer_set_sound_name((char *)sound_bank.sfx[i].name, i);
  }
  // copy buffer data (view) to screen
  swap_buffer();

  // select default menu option
  one_track_window_select_option();
}
