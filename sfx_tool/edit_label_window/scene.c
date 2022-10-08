
// scene mainloop
void edit_label_window_mainloop(void) {

    edit_label_window_process_input_arguments();
    char timer = CURSOR_TIMER_DELAY;

    for(;;) {

        // process input events
        char done = edit_label_window_process_keyboard_events();
        if(done)
          break;

        // Update sound effects
        sidfx_loop();

        timer--;
        if ( timer == 0 ) {
            timer = CURSOR_TIMER_DELAY;
            int pos = edit_label_y_pos + edit_label_x_pos;
            if ( CHAR_RAM[ pos ] < 128 ) {
                CHAR_RAM[ pos ] += 128;
            } else {
                CHAR_RAM[ pos ] -= 128;
            }
        }
        // Wait for one frame iteration
        vic_waitFrame();
    }

    int pos = edit_label_y_pos + edit_label_x_pos;
    if ( CHAR_RAM[ pos ] > 127 ) {
        CHAR_RAM[ pos ] -= 128;
    }

}

