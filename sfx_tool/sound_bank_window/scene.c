
void sound_bank_window_init(void) {

    // FILL BUFFER

    // clear buffer
    clear_buffer();

    // sounds names
    init_view_buffer();

    // horizontal rule
    win_put_at_buffer( (char *)sound_bank_view_hr, 0, 17, 40, 1 );

    // options
    win_put_at_buffer( (char *)sound_bank_view_menu_options, 11, 19, 18, 4 );

}

void sound_bank_window_show(void) {

    // clear chars and set color
    clear_screen(VCOL_DARK_GREY);

    // copy buffer data (view) to screen
    swap_buffer();

    // copy edit_menu sound into sound bank actual instrument
    byte index = column * SOUND_BANK_VIEW_ROWS + row;
    copy_sfx_from_first_sfx_slot_into_sound_bank( index );

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

