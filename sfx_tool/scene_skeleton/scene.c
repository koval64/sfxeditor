
/* // called once on project startup */
/* void scene_name_window_init(void) { */
/* } */

/* // this is run everytime we opening the scene window */
/* void scene_name_window_show(void) { */
/* } */

// scene mainloop called every frame
void scene_name_window_mainloop(void) {

    /* scene_name_window_show(); */

    for(;;) {

        // process input events
        char done = scene_name_window_process_keyboard_events();
        if(done)
          break;

        // Update sound effects
        /* sidfx_loop(); */

        // Wait for one frame iteration
        vic_waitFrame();
    }

    // set next scene
    // as well can be done in keyboard events loop
    // comment out if you wanna back to parent scene
    /* change_main_scene_to( SOUNDS_WINDOW ); */
}

/* // this is run everytime we closing the scene window */
/* void scene_name_window_hide_view(void) { */
/* } */

