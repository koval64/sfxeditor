
void one_track_init_view_buffer(void) {

  int pos = 0;
  char empty[] = " -           ";
  for (char y = SOUND_BANK_ALIGN_Y; y < SOUND_BANK_VIEW_ROWS; y++) {
    for (char a = 0; a < SOUND_BANK_VIEW_COLUMNS; a++) {
      for (char x = 0; x < SOUND_BANK_FIELD_SIZE; x++) {
        char_ram_buffer[pos] = empty[x];
        pos++;
      }
    }
    char_ram_buffer[pos] = ' ';
    pos++;
  }
}

void one_track_copy_screen_name_to_view_buffer(void) {
  char x = SOUND_BANK_ALIGN_X + one_track_column * SOUND_BANK_FIELD_SIZE;
  char y = one_track_row;
  char length = SOUND_BANK_FIELD_SIZE - 1;

  int pos = 40 * y + x;
  char index = one_track_column * 16 + one_track_row;

  for (int i = 0; i < length; i++) {
    char tmp = CHAR_RAM[pos + i];
    char_ram_buffer[pos + i] = tmp;
    sound_bank.sfx[index].name[i] = tmp;
  }
}

void one_track_view_buffer_set_sound_name(char *name, char nr) {
  char x = SOUND_BANK_ALIGN_X + (nr / SOUND_BANK_VIEW_ROWS) * SOUND_BANK_FIELD_SIZE;
  char y = nr % SOUND_BANK_VIEW_ROWS;
  char length = SOUND_BANK_FIELD_SIZE - 1;

  int pos = 40 * y + x;

  for (int i = 0; i < length; i++) {
    char_ram_buffer[pos + i] = name[i];
  }
}

void one_track_view_buffer_get_sound_name(char *name, char nr) {
  char x =
      SOUND_BANK_ALIGN_X + (nr / SOUND_BANK_VIEW_ROWS) * SOUND_BANK_FIELD_SIZE;
  char y = nr % SOUND_BANK_VIEW_ROWS;
  char length = SOUND_BANK_FIELD_SIZE - 1;

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
