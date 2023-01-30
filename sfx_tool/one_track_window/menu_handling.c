
void one_track_window_go(byte direction)
{
    // deselect previous option
    one_track_window_option(DESELECT);

    switch (direction)
    {
    case LEFT:
        one_track_column -= 1;
        if (one_track_column > ONE_TRACK_VIEW_COLUMNS)
            one_track_column = ONE_TRACK_VIEW_COLUMNS - 1;
        break;
    case RIGHT:
        one_track_column += 1;
        if (one_track_column == ONE_TRACK_VIEW_COLUMNS)
            one_track_column = 0;
        break;
    case UP:
        one_track_row -= 1;
        if (one_track_row > ONE_TRACK_VIEW_ROWS)
            one_track_row = ONE_TRACK_VIEW_ROWS - 1;
        break;
    case DOWN:
        one_track_row += 1;
        if (one_track_row == ONE_TRACK_VIEW_ROWS)
            one_track_row = 0;
        break;
    }

    // select new option
    one_track_window_option(SELECT);
}
