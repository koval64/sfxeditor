
void edit_window_mainloop(void) {

    // main window show
    edit_window_show();

    for(;;) {

        // process input events
        edit_window_process_joystick_events();
        char done = edit_window_process_keyboard_events();
        if(done)
            break;

        // Update sound effects
        sidfx_loop();

        // Wait for one frame iteration
        vic_waitFrame();
    }

    // as well can be done in keyboard events loop
    change_scene_to( SOUNDS_WINDOW );

}

