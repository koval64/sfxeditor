
void focus_window(byte index)
{
    // switch betweend windows, and gray out choosen option
    if (index == 0)
    {
        one_track_window_option(GRAY_OUT);
        two_columns_window_option(SELECT);
    }
    else if (index == 1)
    {
        two_columns_window_option(GRAY_OUT);
        one_track_window_option(SELECT);
    }
}

void one_track_ultimate_window_refresh_one_track_window(void)
{
    // copy sound names
    for (char i = 0; i < ONE_TRACK_VIEW_SOUND_COUNT; i++)
        one_track_window_view_buffer_set_sound_name((char *)one_track[i].name, i);
}

void one_track_ultimate_window_refresh_two_columns_window(void)
{
    // copy sound names to buffer
    for (char i = 0; i < SFX_COUNT; i++)
        two_columns_window_view_buffer_set_sound_name((char *)sound_bank[i].name, i);
}

void one_track_ultimate_window_refresh_screen(void)
{
    one_track_ultimate_window_refresh_one_track_window();
    one_track_ultimate_window_refresh_two_columns_window();
    // copy buffer data (view) to screen
    swap_buffer();
}
