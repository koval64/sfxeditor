
void sound_effect_info_window_mainloop(void) {

    effect_info_fill_view();
    effect_info_show_view();

    for(;;) {

        // process input events
        char done = sound_effect_info_process_keyboard_events();
        if(done)
          break;

        // Update sound effects
        sidfx_loop();

        // Wait for one frame iteration
        vic_waitFrame();
    }

    effect_info_hide_view();

}

