
void loader_window_mainloop(void) {

    loader_show_view();
    argv.cp0 = FALSE;   // pass to the parent
                        // if new file is loaded
                        // it is set to TRUE \
                        // inside loader_process_keyboard_events() function

    for(;;) {

        // process input events
        char done = loader_process_keyboard_events();
        if(done)
          break;

        // Update sound effects
        sidfx_loop();

        // Wait for one frame iteration
        vic_waitFrame();

        // cycles measurment
        /* vic.color_border = VCOL_WHITE; */
        /* loader_hide_view(); */
        /* loader_show_view(); */
        /* vic.color_border = VCOL_BLACK; */
    }

    loader_hide_view();
}

