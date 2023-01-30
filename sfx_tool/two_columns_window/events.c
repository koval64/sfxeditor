
char two_columns_window_process_keyboard_events(void)
{

    byte play = FALSE;

    // get the key
    keyb_poll();
    byte _key = keyb_codes[keyb_key & 0x7f];

    if (_key == 'b' || _key == 's' || _key == 'J' || _key == 'L' || _key == KEY_ESCAPE || _key == KEY_ARROW_LEFT)
    {
        return SWITCH_WINDOW; // exit main menu
    }
    else if (_key == KEY_UP || _key == 'i') // cursor up
    {
        two_columns_window_go(UP);
        play = TRUE;
    }
    else if (_key == KEY_DOWN || _key == 'k')
    {
        two_columns_window_go(DOWN); // cursor down
        play = TRUE;
    }
    else if (_key == KEY_LEFT || _key == 'j')
    {
        two_columns_window_go(LEFT); // cursor left
        play = TRUE;
    }
    else if (_key == KEY_RIGHT || _key == 'l')
    {
        two_columns_window_go(RIGHT); // cursor right
        play = TRUE;
    }
    else if (_key == KEY_RETURN || _key == KEY_SPACE) // return
    {
        play = TRUE;
    }
    else if (_key == KEY_F1 || _key == 'm')
    {
        run_as_child(OPTIONS_WINDOW);
        return REFRESH_SCENE;
    }
    else if (_key == 'a')
    {
        return COPY_SOUND_FROM_TWO_COLUMNS_TO_ONE_TRACK;
    }
    else if (_key == 'e')
    {
        run_as_child(EDIT_WINDOW);

        // copy edit_menu sound into sound bank actual instrument
        sound_focus_save_sound_to(two_columns_window_get_sound_pointer());

        return REFRESH_SCENE;
    }
    else if (_key == 'r')
    {

        // RENAME LABEL

        // prepare label for edition
        normal_text(two_columns_window_get_cursor_screen_position());

        // helper - pointer is used twice
        char *return_pointer = two_columns_window_get_sound_pointer()->name;

        // send arguments to child
        // set text x position, y position, length, and pointer ( memory address ) for output text
        argv.xpos = TWO_COLUMNS_ALIGN_X + two_columns_column * TWO_COLUMNS_FIELD_SIZE;
        argv.ypos = TWO_COLUMNS_ALIGN_Y + two_columns_row;
        argv.length = SOUND_NAME_LENGTH;
        argv.output_text_save_pointer = return_pointer;

        // run child
        run_as_child(EDIT_LABEL_WINDOW);

        // save new sound name to buffer
        two_columns_window_view_buffer_set_sound_name(return_pointer, two_columns_window_get_current_sound_index());

        // edition done, invert label
        invert_text(two_columns_window_get_cursor_screen_position());
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
