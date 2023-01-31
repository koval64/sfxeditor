

byte one_track_window_get_current_sound_index(void)
{
    return one_track_column * ONE_TRACK_VIEW_ROWS + one_track_row;
}

struct SFX *one_track_window_get_sound_pointer(void)
{
    return &one_track[one_track_window_get_current_sound_index()];
}

unsigned one_track_window_get_cursor_screen_position(void)
{
    return (ONE_TRACK_ALIGN_Y + one_track_row) * 40 + (one_track_column * ONE_TRACK_FIELD_SIZE) + ONE_TRACK_ALIGN_X;
}

void one_track_window_option(byte decorator)
{
    unsigned pos = one_track_window_get_cursor_screen_position();

    switch (decorator)
    {
    case SELECT:
        select_invert_text(pos, SOUND_NAME_LENGTH);
        sound_focus_load_sound_from(one_track_window_get_sound_pointer()); // play sound effect
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

void one_track_window_view_buffer_set_sound_name(char *name, char nr)
{
    char x = ONE_TRACK_ALIGN_X + (nr / ONE_TRACK_VIEW_ROWS) * ONE_TRACK_FIELD_SIZE;
    char y = nr % ONE_TRACK_VIEW_ROWS;
    unsigned pos = (40 * y + x);

    memcpy(&char_ram_buffer[pos], name, SOUND_NAME_LENGTH);
}
