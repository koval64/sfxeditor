
void sounds_window_show( void ) {

    // clear chars and set color
    clear_screen(VCOL_DARK_GREY);

    // import data from petscii editor ( whole screen )
    copy_to_screen(sounds_view);

    // temporary workaround ( temporary fix ) START
    byte index = column * 16 + row;
    store_sfx( index );
    // temporary workaround ( temporary fix ) END

    // select default menu option
    sounds_select_option();

}

void sounds_mainloop(void) {

    for(;;) {

        // process input events
        char done = sounds_process_keyboard_events();
        if(done)
            break;

        // Wait for one frame iteration
        vic_waitFrame();
    }

    change_scene_to( EDIT_WINDOW );

}

