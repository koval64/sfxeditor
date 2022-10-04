
// scene mainloop called every frame
void edit_label_window_mainloop(void) {

    edit_label_window_process_input_arguments();

    for(;;) {

        // process input events
        char done = edit_label_window_process_keyboard_events();
        if(done)
          break;

        // Update sound effects
        sidfx_loop();

        // Wait for one frame iteration
        vic_waitFrame();
    }
}

