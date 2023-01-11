
void sound_effect_info_window_mainloop(void) {

    sound_effect_info_window_fill_buffer();
    sound_effect_info_window_show();

    for(;;) {

        // process input events
        char done = sound_effect_info_window_process_keyboard_events();
        if(done)
          break;

        // Update sound effects
        sidfx_loop();

        // Wait for one frame iteration
        vic_waitFrame();

    }
    sound_effect_info_window_hide();

}

