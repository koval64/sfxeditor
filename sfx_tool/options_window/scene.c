
void options_window_init_menu(void)
{
    // add_option(index, should_i_close_menu_flag, x, y, function_to_call)
    add_option(0, TRUE, 9, OPTIONS_POS_Y+1, edit_window_mainloop);              // edit sound
    add_option(1, TRUE, 9, OPTIONS_POS_Y+3, exporter_save_file);                 // dump sound as txt
    add_option(2, FALSE, 9, OPTIONS_POS_Y+4, sound_effect_info_window_mainloop); // show sound info
    add_option(3, TRUE, 9, OPTIONS_POS_Y+6, loader_load_file);                   // load soundbank00.sbk
    add_option(4, TRUE, 9, OPTIONS_POS_Y+7, loader_save_file);                   // save soundbank00.sbk
    add_option(5, TRUE, 9, OPTIONS_POS_Y+9, null);
}

void options_window_mainloop(void)
{
    options_window_show();
    select_text(options_window_menu_get_current_cursor_screen_position(), OPTIONS_WIDTH);

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
