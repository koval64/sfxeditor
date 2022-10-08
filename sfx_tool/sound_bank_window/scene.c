
void sound_bank_window_init(void) {
    sound_bank_init();

    // FILL BUFFER

    // clear buffer
    clear_buffer( sound_bank_view_buffer );

    // sounds names
    init_view_buffer();

    // horizontal rule
    win_put_at_buffer(sound_bank_view_hr, 0, 17, 40, 1, sound_bank_view_buffer);

    // options
    win_put_at_buffer(sound_bank_view_menu_options, 11, 19, 18, 4, sound_bank_view_buffer);

}

void sound_bank_window_show(void) {

    // clear chars and set color
    clear_screen(VCOL_DARK_GREY);

    // copy buffer data (view) to screen
    copy_to_screen(sound_bank_view_buffer);

    // copy edit_menu sound into sound bank actual instrument
    byte index = column * SOUND_BANK_VIEW_ROWS + row;
    sound_bank_window_store_sfx( index );

    // select default menu option
    sound_bank_window_select_option();

}

void sound_bank_window_mainloop(void) {

    sound_bank_window_show();

    for(;;) {

        // process input events
        char done = sound_bank_window_process_keyboard_events();
        if(done)
            break;

        // Update sound effects
        sidfx_loop();

        // Wait for one frame iteration
        vic_waitFrame();
    }

    change_main_scene_to( EDIT_WINDOW );

}

