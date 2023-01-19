
byte one_track_window_get_current_sound_index(void) {
  return one_track_column * ONE_TRACK_VIEW_ROWS + one_track_row;
}

struct SFX * one_track_window_get_sound_pointer(void) {
  return & one_track[ one_track_window_get_current_sound_index() ];
}


void one_track_window_option(byte decorator)
{
  unsigned pos = (ONE_TRACK_ALIGN_Y + one_track_row) * 40 + (one_track_column * ONE_TRACK_FIELD_SIZE) + ONE_TRACK_ALIGN_X;

  if (decorator == NORMAL)
  {
    normal_text(pos);
  }
  else if (decorator == INVERT)
  {
    invert_text(pos);
  }
  else if (decorator == SELECT)
  {
    select_invert_text(pos);
    sound_focus_load_sound_from( one_track_window_get_sound_pointer() );
  }
  else if (decorator == DESELECT)
  {
    deselect_normal_text(pos);
  }
}

void one_track_window_go(byte direction)
{
  // deselect previous option
  one_track_window_option(DESELECT);

  if (direction == LEFT)
  {
    one_track_column -= 1;
    if (one_track_column > ONE_TRACK_VIEW_COLUMNS)
      one_track_column = ONE_TRACK_VIEW_COLUMNS - 1;
  }
  else if (direction == RIGHT)
  {
    one_track_column += 1;
    if (one_track_column == ONE_TRACK_VIEW_COLUMNS)
      one_track_column = 0;
  }
  else if (direction == UP)
  {
    one_track_row -= 1;
    if (one_track_row > ONE_TRACK_VIEW_ROWS)
      one_track_row = ONE_TRACK_VIEW_ROWS - 1;
  }
  else if (direction == DOWN)
  {
    one_track_row += 1;
    if (one_track_row == ONE_TRACK_VIEW_ROWS)
      one_track_row = 0;
  }

  // select new option
  one_track_window_option(SELECT);
}
