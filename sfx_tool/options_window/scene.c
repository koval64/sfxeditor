
void options_window_mainloop(void) {

    options_window_show();

    for(;;) {

        // process input events
        char done = options_window_process_keyboard_events();
        if(done)
          break;

        // Update sound effects
        sidfx_loop();

        // Wait for one frame iteration
        vic_waitFrame();

    }
    // options_window_hide();

}

