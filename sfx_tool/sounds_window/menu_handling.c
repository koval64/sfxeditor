
void sounds_deselect_option( void ) {

    unsigned pos = ( SOUNDS_ALIGN_Y + row ) * 40 + ( column * SOUNDS_FIELD_SIZE ) + SOUNDS_ALIGN_X;
    for(int i=0; i<12; i++)
        COLOR_RAM[ pos + i ] = OPTION_ON_COLOR;

}

void sounds_select_option( void ) {

    unsigned pos = ( SOUNDS_ALIGN_Y + row ) * 40 + ( column * SOUNDS_FIELD_SIZE ) + SOUNDS_ALIGN_X;
    for(int i=0; i<12; i++)
        COLOR_RAM[ pos + i ] = OPTION_ON_SELECTED_COLOR;

    byte index = column * 16 + row;
    restore_sfx( index );

}

void go_left( void ) {

    sounds_deselect_option();

    column -= 1;
    if( column > 3 )
        column = 2;

    sounds_select_option();

}

void go_right( void ) {

    sounds_deselect_option();

    column += 1;
    if( column == 3 )
        column = 0;

    sounds_select_option();

}

void go_up( void ) {

    sounds_deselect_option();

    row -= 1;
    if( row > 16 )
        row = 15;

    sounds_select_option();

}

void go_down( void ) {

    sounds_deselect_option();

    row += 1;
    if( row == 16 )
        row = 0;

    sounds_select_option();

}

