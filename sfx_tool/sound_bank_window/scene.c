
void sound_bank_window_init(void) {
    sound_bank_init();
}

void sound_bank_window_show(void) {

    // clear chars and set color
    clear_screen(VCOL_DARK_GREY);

    // copy buffor data (view) to screen
    copy_to_screen(sound_bank_view_data);

    // copy edit_menu sound into sound bank actual instrument
    byte index = column * 16 + row;
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

