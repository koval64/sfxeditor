
void one_track_window_option_normal_text( void ) {

    unsigned pos = ( SOUND_BANK_ALIGN_Y + one_track_row ) * 40 + ( one_track_column * SOUND_BANK_FIELD_SIZE ) + SOUND_BANK_ALIGN_X;
    for(int i=0; i<SFX_NAME_LEN; i++) {
        CHAR_RAM[ pos + i ] = CHAR_RAM[ pos + i ] - 128;
    }
}

void one_track_window_option_invert_text( void ) {

    unsigned pos = ( SOUND_BANK_ALIGN_Y + one_track_row ) * 40 + ( one_track_column * SOUND_BANK_FIELD_SIZE ) + SOUND_BANK_ALIGN_X;
    for(int i=0; i<SFX_NAME_LEN; i++) {
        CHAR_RAM[ pos + i ] = CHAR_RAM[ pos + i ] + 128;
    }
}

void one_track_window_deselect_option( void ) {

    unsigned pos = ( SOUND_BANK_ALIGN_Y + one_track_row ) * 40 + ( one_track_column * SOUND_BANK_FIELD_SIZE ) + SOUND_BANK_ALIGN_X;
    for(int i=0; i<SFX_NAME_LEN; i++) {
        COLOR_RAM[ pos + i ] = OPTION_ON_COLOR;
        CHAR_RAM[ pos + i ] = CHAR_RAM[ pos + i ] - 128;
    }
}

void one_track_window_select_option( void ) {

    unsigned pos = ( SOUND_BANK_ALIGN_Y + one_track_row ) * 40 + ( one_track_column * SOUND_BANK_FIELD_SIZE ) + SOUND_BANK_ALIGN_X;
    for(int i=0; i<SFX_NAME_LEN; i++) {
        COLOR_RAM[ pos + i ] = OPTION_ON_SELECTED_COLOR;
        CHAR_RAM[ pos + i ] = CHAR_RAM[ pos + i ] + 128;
    }

    byte index = one_track_column * 16 + one_track_row;
    one_track_window_restore_sfx( index );

}

void one_track_window_go_left( void ) {

    one_track_window_deselect_option();

    one_track_column -= 1;
    if( one_track_column > 3 )
        one_track_column = 2;

    one_track_window_select_option();

}

void one_track_window_go_right( void ) {

    one_track_window_deselect_option();

    one_track_column += 1;
    if( one_track_column == 3 )
        one_track_column = 0;

    one_track_window_select_option();

}

void one_track_window_go_up( void ) {

    one_track_window_deselect_option();

    one_track_row -= 1;
    if( one_track_row > 16 )
        one_track_row = 15;

    one_track_window_select_option();

}

void one_track_window_go_down( void ) {

    one_track_window_deselect_option();

    one_track_row += 1;
    if( one_track_row == 16 )
        one_track_row = 0;

    one_track_window_select_option();

}

