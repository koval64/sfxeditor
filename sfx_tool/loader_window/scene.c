
int loader_mainloop(void) {

    loader_show_view();

    for(;;) {

        // process input events
        char done = loader_process_keyboard_events();
        if(done)
          break;

        // Update sound effects
        sidfx_loop();

        // Wait for one frame iteration
        vic_waitFrame();
    }

    loader_hide_view();

    return 0;
}

