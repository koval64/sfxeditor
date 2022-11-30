
void one_track_window_init(void) {

    // FILL BUFFER

    // clear buffer
    clear_buffer();

    // sounds names
    one_track_init_view_buffer();

    vertical_line();

    // options help
    win_put_at_buffer( (char *) one_track_view_menu_options, 0, 19, 14, 5 );

}

void one_track_window_show(void) {

    // clear chars and set color
    clear_screen(VCOL_DARK_GREY);

    // copy edit_menu sound into sound bank actual instrument
    byte index = one_track_column * ONE_TRACK_VIEW_ROWS + one_track_row;
    copy_sfx_from_first_sfx_slot_into_sound_bank( index );

    // copy buffer data (view) to screen
    swap_buffer();

    // select default menu option
    one_track_window_select_option();

}

void one_track_window_mainloop(void) {

    one_track_window_show();

    for(;;) {

        // process input events
        char done = one_track_window_process_keyboard_events();
        if(done)
            break;

        // Update sound effects
        sidfx_loop();

        // Wait for one frame iteration
        vic_waitFrame();
    }

    change_main_scene_to( EDIT_WINDOW );

}

