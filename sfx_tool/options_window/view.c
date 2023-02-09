
void add_option(byte OPTION_INDEX, byte flags, byte x, byte y, void (*pressed)(void))
{
    options.option[OPTION_INDEX].close_menu_flag = flags;
    options.option[OPTION_INDEX].x = x;
    options.option[OPTION_INDEX].y = y;
    options.option[OPTION_INDEX].pressed = pressed;
}

void options_window_show(void)
{
    /* backup screen part [ WIDTH x HEIGHT ]; */
    int array_pos = 0;
    int screen_pos = OPTIONS_SCREEN_POS;
    for (char y = 0; y < OPTIONS_HEIGHT; y++)
    {
        for (char x = 0; x < OPTIONS_WIDTH; x++)
        {
            // backup screen to buffer
            screen_char_backup[array_pos] = CHAR_RAM[screen_pos];
            screen_color_backup[array_pos] = COLOR_RAM[screen_pos];

            // copy to screen
            CHAR_RAM[screen_pos] = options_window_view[array_pos];
            COLOR_RAM[screen_pos] = OPTION_COLOR_GRAY_OUT;

            screen_pos++;
            array_pos++;
        }
        screen_pos += 40 - OPTIONS_WIDTH; // char_ram_width - window_width
    }
}

void options_window_hide(void)
{
    // restore screen part
    int screen_pos = OPTIONS_SCREEN_POS;
    int array_pos = 0;

    for (char y = 0; y < OPTIONS_HEIGHT; y++)
    {
        for (char x = 0; x < OPTIONS_WIDTH; x++)
        {
            CHAR_RAM[screen_pos] = screen_char_backup[array_pos];
            COLOR_RAM[screen_pos] = screen_color_backup[array_pos];

            screen_pos++;
            array_pos++;
        }
        screen_pos += 40 - OPTIONS_WIDTH; // char_ram_width - window_width
    }
}