
void one_track_ultimate_window_init(void) {

    // FILL BUFFER

    // clear buffer
    clear_buffer();

    // sounds names
    one_track_window_init_view_buffer();
    two_columns_window_init_view_buffer();

    vertical_line(13);

    // options help
    win_put_at_buffer( (char *) one_track_ultimate_window_view_menu_options, 0, 19, 13, 5 );

}

void one_track_ultimate_window_show(void) {

    // clear screen and set color
    clear_screen(VCOL_DARK_GREY);

    // copy buffer data (view) to screen
    swap_buffer();

    // select default menu options
    refresh_scene(DEFAULT_SUBSCENE_INDEX);
}

void one_track_ultimate_window_mainloop(void) {

    one_track_ultimate_window_show();

    char (* const process_keyboard_events[] ) (void) = {
        two_columns_window_process_keyboard_events,
        one_track_window_process_keyboard_events
    };
    byte index = DEFAULT_SUBSCENE_INDEX;

    for(;;) {

        // process input events
        char status = process_keyboard_events[index] ();
        if (status != NO_OPERATION) {

            if (status == SWITCH_WINDOW) {
                index++;
                if (index > 1)
                    index = 0;
            } else if (status == REFRESH_SCENE) {
                one_track_ultimate_window_refresh_screen();
            }
            refresh_scene(index);
        }

        // Update sound effects
        sidfx_loop();

        // Wait for one frame iteration
        vic_waitFrame();
    }

}

