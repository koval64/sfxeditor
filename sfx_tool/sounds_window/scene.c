

void sounds_window_init( void ) {

    sound_bank_init();

}

void sounds_window_show( void ) {

    // clear chars and set color
    clear_screen(VCOL_DARK_GREY);

    // import data from petscii editor ( whole screen )
    copy_to_screen(sounds_view);

    // copy edit_menu sound into sound bank actual instrument
    byte index = column * 16 + row;
    store_sfx( index );

    // select default menu option
    sounds_select_option();

}

void sounds_window_mainloop(void) {

    for(;;) {

        // process input events
        char done = sounds_process_keyboard_events();
        if(done)
            break;

        // Update sound effects
        sidfx_loop();

        // Wait for one frame iteration
        vic_waitFrame();
    }

    change_main_scene_to( EDIT_WINDOW );

}

