
unsigned options_window_menu_get_current_cursor_screen_position(void)
{
    byte active = options.active_option_index;
    return ((options.option[active].y * 40) + options.option[active].x);
}

void options_window_menu_go_up(void)
{
    deselect_text(options_window_menu_get_current_cursor_screen_position());
    options.active_option_index--;
    if (options.active_option_index > OPTIONS_COUNT)
    {
        options.active_option_index = (OPTIONS_COUNT - 1);
    }
    select_text(options_window_menu_get_current_cursor_screen_position());
}

void options_window_menu_go_down(void)
{
    deselect_text(options_window_menu_get_current_cursor_screen_position());
    options.active_option_index++;
    if (options.active_option_index > (OPTIONS_COUNT - 1))
    {
        options.active_option_index = 0;
    }
    select_text(options_window_menu_get_current_cursor_screen_position());
}
