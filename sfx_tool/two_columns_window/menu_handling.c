
byte two_columns_window_get_current_sound_index(void) {
  return two_columns_column * TWO_COLUMNS_VIEW_ROWS + two_columns_row;
}

struct SFX * two_columns_window_get_sound_pointer(void) {
  return & sound_bank[ two_columns_window_get_current_sound_index() ];
}

void two_columns_window_option(byte decorator)
{
  unsigned pos = (TWO_COLUMNS_ALIGN_Y + two_columns_row) * 40 + (two_columns_column * TWO_COLUMNS_FIELD_SIZE) + TWO_COLUMNS_ALIGN_X;

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
    sound_focus_load_sound_from( two_columns_window_get_sound_pointer() );
  }
  else if (decorator == DESELECT)
  {
    deselect_normal_text(pos);
  }
}

void two_columns_window_go(byte direction)
{

  // deselect previous option
  two_columns_window_option(DESELECT);

  if (direction == LEFT)
  {
    two_columns_column -= 1;
    if (two_columns_column > TWO_COLUMNS_VIEW_COLUMNS)
      two_columns_column = TWO_COLUMNS_VIEW_COLUMNS - 1;
  }
  else if (direction == RIGHT)
  {
    two_columns_column += 1;
    if (two_columns_column == TWO_COLUMNS_VIEW_COLUMNS)
      two_columns_column = 0;
  }
  else if (direction == UP)
  {
    two_columns_row -= 1;
    if (two_columns_row > TWO_COLUMNS_VIEW_ROWS)
      two_columns_row = TWO_COLUMNS_VIEW_ROWS - 1;
  }
  else if (direction == DOWN)
  {
    two_columns_row += 1;
    if (two_columns_row == TWO_COLUMNS_VIEW_ROWS)
      two_columns_row = 0;
  }

  // select new option
  two_columns_window_option(SELECT);
}
