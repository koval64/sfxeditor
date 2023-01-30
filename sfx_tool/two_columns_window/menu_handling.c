

void two_columns_window_go(byte direction)
{

    // deselect previous option
    two_columns_window_option(DESELECT);

    switch (direction)
    {
    case LEFT:
        two_columns_column -= 1;
        if (two_columns_column > TWO_COLUMNS_VIEW_COLUMNS)
            two_columns_column = TWO_COLUMNS_VIEW_COLUMNS - 1;
        break;
    case RIGHT:
        two_columns_column += 1;
        if (two_columns_column == TWO_COLUMNS_VIEW_COLUMNS)
            two_columns_column = 0;
        break;
    case UP:
        two_columns_row -= 1;
        if (two_columns_row > TWO_COLUMNS_VIEW_ROWS)
            two_columns_row = TWO_COLUMNS_VIEW_ROWS - 1;
        break;
    case DOWN:
        two_columns_row += 1;
        if (two_columns_row == TWO_COLUMNS_VIEW_ROWS)
            two_columns_row = 0;
        break;
    }

    // select new option
    two_columns_window_option(SELECT);
}
