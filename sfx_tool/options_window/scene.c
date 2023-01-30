
void options_window_init_menu(void)
{
    add_option(0, 11, 10, null);
    add_option(1, 11, 11, null);
    add_option(2, 11, 13, null);
    add_option(3, 11, 14, null);
}

void options_window_mainloop(void)
{

    options_window_show();
    select_text(options_window_menu_get_current_cursor_screen_position());

    for (;;)
    {

        // process input events
        char done = options_window_process_keyboard_events();
        if (done)
            break;

        // Update sound effects
        sidfx_loop();

        // Wait for one frame iteration
        vic_waitFrame();
    }
    // options_window_hide();
}
