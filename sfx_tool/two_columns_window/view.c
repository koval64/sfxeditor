

byte two_columns_window_get_current_sound_index(void)
{
    return two_columns_column * TWO_COLUMNS_VIEW_ROWS + two_columns_row;
}

struct SFX *two_columns_window_get_sound_pointer(void)
{
    return &sound_bank[two_columns_window_get_current_sound_index()];
}

unsigned two_columns_window_get_cursor_screen_position(void)
{
    return (TWO_COLUMNS_ALIGN_Y + two_columns_row) * 40 + (two_columns_column * TWO_COLUMNS_FIELD_SIZE) + TWO_COLUMNS_ALIGN_X;
}

void two_columns_window_option(byte decorator)
{
    unsigned pos = two_columns_window_get_cursor_screen_position();

    switch (decorator)
    {
    case SELECT:
        select_invert_text(pos, SOUND_NAME_LENGTH);
        sound_focus_load_sound_from(two_columns_window_get_sound_pointer());
        break;
    case DESELECT:
        deselect_normal_text(pos, SOUND_NAME_LENGTH);
        break;
    case GRAY_OUT:
        deselect_normal_text(pos, SOUND_NAME_LENGTH);
        invert_text(pos, SOUND_NAME_LENGTH);
        break;
    }
}

void two_columns_window_view_buffer_set_sound_name(char *name, char nr)
{
    char x = TWO_COLUMNS_ALIGN_X + (nr / TWO_COLUMNS_VIEW_ROWS) * TWO_COLUMNS_FIELD_SIZE;
    char y = nr % TWO_COLUMNS_VIEW_ROWS;
    unsigned pos = (40 * y + x);

    memcpy(&char_ram_buffer[pos], name, SOUND_NAME_LENGTH);
}
