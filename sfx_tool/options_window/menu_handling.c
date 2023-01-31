
unsigned options_window_menu_get_current_cursor_screen_position(void)
{
    byte active = options.active_option_index;
    return ((options.option[active].y * 40) + options.option[active].x);
}

byte option_menu_menu_run_current_option(void) {
    options.option[options.active_option_index].pressed();
    return options.option[options.active_option_index].close_menu_flag;
}

void options_window_menu_go_up(void)
{
    deselect_text(options_window_menu_get_current_cursor_screen_position(), OPTIONS_WIDTH);
    options.active_option_index--;
    if (options.active_option_index > OPTIONS_COUNT)
    {
        options.active_option_index = (OPTIONS_COUNT - 1);
    }
    select_text(options_window_menu_get_current_cursor_screen_position(), OPTIONS_WIDTH);
}

void options_window_menu_go_down(void)
{
    deselect_text(options_window_menu_get_current_cursor_screen_position(), OPTIONS_WIDTH);
    options.active_option_index++;
    if (options.active_option_index > (OPTIONS_COUNT - 1))
    {
        options.active_option_index = 0;
    }
    select_text(options_window_menu_get_current_cursor_screen_position(), OPTIONS_WIDTH);
}
