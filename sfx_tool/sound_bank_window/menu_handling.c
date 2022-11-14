
void sound_bank_window_option_normal_text( void ) {

    unsigned pos = ( SOUND_BANK_ALIGN_Y + row ) * 40 + ( column * SOUND_BANK_FIELD_SIZE ) + SOUND_BANK_ALIGN_X;
    for(int i=0; i<SFX_NAME_LEN; i++) {
        CHAR_RAM[ pos + i ] = CHAR_RAM[ pos + i ] - 128;
    }
}

void sound_bank_window_option_invert_text( void ) {

    unsigned pos = ( SOUND_BANK_ALIGN_Y + row ) * 40 + ( column * SOUND_BANK_FIELD_SIZE ) + SOUND_BANK_ALIGN_X;
    for(int i=0; i<SFX_NAME_LEN; i++) {
        CHAR_RAM[ pos + i ] = CHAR_RAM[ pos + i ] + 128;
    }
}

void sound_bank_window_deselect_option( void ) {

    unsigned pos = ( SOUND_BANK_ALIGN_Y + row ) * 40 + ( column * SOUND_BANK_FIELD_SIZE ) + SOUND_BANK_ALIGN_X;
    for(int i=0; i<SFX_NAME_LEN; i++) {
        COLOR_RAM[ pos + i ] = OPTION_ON_COLOR;
        CHAR_RAM[ pos + i ] = CHAR_RAM[ pos + i ] - 128;
    }
}

void sound_bank_window_select_option( void ) {

    unsigned pos = ( SOUND_BANK_ALIGN_Y + row ) * 40 + ( column * SOUND_BANK_FIELD_SIZE ) + SOUND_BANK_ALIGN_X;
    for(int i=0; i<SFX_NAME_LEN; i++) {
        COLOR_RAM[ pos + i ] = OPTION_ON_SELECTED_COLOR;
        CHAR_RAM[ pos + i ] = CHAR_RAM[ pos + i ] + 128;
    }

    byte index = column * 16 + row;
    sound_bank_window_restore_sfx( index );

}

void sound_bank_window_go_left( void ) {

    sound_bank_window_deselect_option();

    column -= 1;
    if( column > 3 )
        column = 2;

    sound_bank_window_select_option();

}

void sound_bank_window_go_right( void ) {

    sound_bank_window_deselect_option();

    column += 1;
    if( column == 3 )
        column = 0;

    sound_bank_window_select_option();

}

void sound_bank_window_go_up( void ) {

    sound_bank_window_deselect_option();

    row -= 1;
    if( row > 16 )
        row = 15;

    sound_bank_window_select_option();

}

void sound_bank_window_go_down( void ) {

    sound_bank_window_deselect_option();

    row += 1;
    if( row == 16 )
        row = 0;

    sound_bank_window_select_option();

}

