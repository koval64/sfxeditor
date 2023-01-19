

void one_track_window_view_buffer_set_sound_name(char * name, char nr) {
  char x = ONE_TRACK_ALIGN_X + (nr / ONE_TRACK_VIEW_ROWS) * ONE_TRACK_FIELD_SIZE;
  char y = nr % ONE_TRACK_VIEW_ROWS;
  unsigned pos = (40 * y + x);

  memcpy( & char_ram_buffer[pos], name, SOUND_NAME_LENGTH );
}

