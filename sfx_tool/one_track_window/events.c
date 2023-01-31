
char one_track_window_process_keyboard_events(void)
{

    byte play = FALSE;

    // get the key
    keyb_poll();
    byte _key = keyb_codes[keyb_key & 0x7f];

    if (_key == 'b' || _key == 's' || _key == 'J' || _key == 'L' || _key == KEY_ESCAPE || _key == KEY_ARROW_LEFT)
    {
        return SWITCH_WINDOW; // exit main menu
    }
    else if (_key == KEY_UP || _key == 'i' || _key == 'e') // cursor up
    {
        one_track_window_go(UP);
        play = TRUE;
    }
    else if (_key == KEY_DOWN || _key == 'k' || _key == 'd') // cursor down
    {
        one_track_window_go(DOWN);
        play = TRUE;
    }
    else if (_key == KEY_LEFT || _key == 'j') // cursor left
    {
        one_track_window_go(LEFT);
        play = TRUE;
    }
    else if (_key == KEY_RIGHT || _key == 'l') // cursor right
    {
        one_track_window_go(RIGHT);
        play = TRUE;
    }
    else if (_key == KEY_RETURN || _key == KEY_SPACE) // return
    {
        play = TRUE;
    }
    else if (_key == KEY_F1 || _key == 'f')
    {
        run_as_child(OPTIONS_WINDOW);
        return REFRESH_SCENE;
    }
    else if (_key == 'E')
    {
        run_as_child(EDIT_WINDOW);

        // copy edit_menu sound into sound bank actual instrument
        sound_focus_save_sound_to(one_track_window_get_sound_pointer());

        return REFRESH_SCENE;
    }
    else if (_key == 'R')
    {

        // RENAME LABEL

        // prepare RENAME LABEL
        normal_text(one_track_window_get_cursor_screen_position(), SOUND_NAME_LENGTH);

        // helper - pointer used twice
        char *return_pointer = one_track_window_get_sound_pointer()->name;

        // send arguments to child
        // set text x position, y position, length, and pointer ( memory address ) for output text
        argv.xpos = ONE_TRACK_ALIGN_X + one_track_column * ONE_TRACK_FIELD_SIZE;
        argv.ypos = ONE_TRACK_ALIGN_Y + one_track_row;
        argv.length = SOUND_NAME_LENGTH;
        argv.output_text_save_pointer = return_pointer;

        // run child
        run_as_child(EDIT_LABEL_WINDOW);

        // save new sound name to buffer
        one_track_window_view_buffer_set_sound_name(return_pointer, one_track_window_get_current_sound_index());

        // RENAME LABEL edition done, invert label
        invert_text(one_track_window_get_cursor_screen_position(), SOUND_NAME_LENGTH);
    }

    if (play)
    {
        sidfx_play(2, SIDFXFocus, 1);
        /* sidfx_play(2, SIDFXTrack, 10); */
    }

    return NO_OPERATION;
}

/* void sounds_process_joystick_events( void ) { */
/* } */
