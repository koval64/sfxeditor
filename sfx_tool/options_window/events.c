
char options_window_process_keyboard_events(void)
{
    // get the key
    keyb_poll();
    byte _key = keyb_codes[keyb_key & 0x7f];

    if (_key == KEY_F1 || _key == 'q' || _key == KEY_SPACE || _key == KEY_ESCAPE || _key == KEY_ARROW_LEFT)
    {
        return TRUE; // exit main menu
    }
    else if (_key == KEY_UP || _key == 'i' || _key == 'e')
        options_window_menu_go_up();
    else if (_key == KEY_DOWN || _key == 'k' || _key == 'd')
        options_window_menu_go_down();
    else if (_key == KEY_RETURN || _key == 'f')
        return option_menu_menu_run_current_option();
    return FALSE;
}
