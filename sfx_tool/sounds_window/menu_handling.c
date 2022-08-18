
// sounds menu - used only here
byte column = 0;
byte row    = 0;

// menu helpers - used only here
unsigned option_x = 0;
unsigned option_y = 0;

void restore_sfx( void ) {
    
    byte index = column * 16 + row;


    SIDFXExplosion[0].freq    = notes_pal_table[ sound_bank.sfx[ index ].note ];
    SIDFXExplosion[0].pwm     = sound_bank.sfx[ index ].pwm;
    SIDFXExplosion[0].ctrl    = sound_bank.sfx[ index ].wave;
    SIDFXExplosion[0].attdec  = sound_bank.sfx[ index ].ad;
    SIDFXExplosion[0].susrel  = sound_bank.sfx[ index ].sr;
    SIDFXExplosion[0].dfreq   = sound_bank.sfx[ index ].dfreq;
    SIDFXExplosion[0].dpwm    = sound_bank.sfx[ index ].dpwm;
    SIDFXExplosion[0].time1   = sound_bank.sfx[ index ].time1;
    SIDFXExplosion[0].time0   = sound_bank.sfx[ index ].time0;

    debug_put_byte1( index );
    /* debug_put_byte1( sound_bank.sfx[ index ].ad ); */
    /* debug_put_byte2( sound_bank.sfx[ index ].sr ); */

}

void store_sfx( void ) {
    
    byte index = column * 16 + row;
    byte note_index = find_note( SIDFXExplosion[0].freq );
    sound_bank.sfx[ index ].note  = note_index;
    sound_bank.sfx[ index ].pwm   = SIDFXExplosion[0].pwm;
    sound_bank.sfx[ index ].wave  = SIDFXExplosion[0].ctrl;
    sound_bank.sfx[ index ].ad    = SIDFXExplosion[0].attdec;
    sound_bank.sfx[ index ].sr    = SIDFXExplosion[0].susrel
    sound_bank.sfx[ index ].dfreq = SIDFXExplosion[0].dfreq;
    sound_bank.sfx[ index ].dpwm  = SIDFXExplosion[0].dpwm;
    sound_bank.sfx[ index ].time1 = SIDFXExplosion[0].time1;
    sound_bank.sfx[ index ].time0 = SIDFXExplosion[0].time0;

    debug_put_byte( index );
}

#define SOUNDS_ALIGN_X    1
#define SOUNDS_ALIGN_Y    2
#define SOUNDS_FIELD_SIZE 13

void sounds_deselect_option( void ) {

    unsigned pos = ( SOUNDS_ALIGN_Y + row ) * 40 + ( column * SOUNDS_FIELD_SIZE ) + SOUNDS_ALIGN_X;
    for(int i=0; i<12; i++)
        COLOR_RAM[ pos + i ] = OPTION_ON_COLOR;

}

void sounds_select_option( void ) {

    unsigned pos = ( SOUNDS_ALIGN_Y + row ) * 40 + ( column * SOUNDS_FIELD_SIZE ) + SOUNDS_ALIGN_X;
    for(int i=0; i<12; i++)
        COLOR_RAM[ pos + i ] = OPTION_ON_SELECTED_COLOR;

    restore_sfx();

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

