
// called once on project startup
void edit_window_init(void) {
  
    // init options menu
    edit_window_init_options_struct();

}

// called right before mainloop
void edit_window_show(void) {

    // clear chars and set color
    clear_screen(VCOL_DARK_GREY);

    // unpack SIDFX oscar structure into menu selections
    update_menu_selections();

    // fill windows buffers with values
    edit_window_fill_buffers_with_values();

    // default selections
    edit_window_select_default_menu_options();

    // put windows on screen ( char data in one dimensional array )
    /* win_put_at(copyright, 26, 14, 14, 1); */
    win_put_at(edit_window_sfx_properties, 11, 0, 16, 10);
    win_put_at(edit_window_info_bar, 0, 13, 40, 1);
    win_put_at(edit_window_piano, 8, 17, 25, 8);

    // update wave name option
    /* waveform_menu_change_option(OPTION_NOOP); */

}

// called directly after edit_window_show
void edit_window_mainloop(void) {

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
    // set next scene
    change_scene_to( SOUNDS_WINDOW );

}

