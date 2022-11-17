
// copy active sound_bank instrument into first sfx slot
// restore sfx
void copy_sfx_from_sound_bank_into_first_sfx_slot( byte index ) {

    unsigned hex_freq = notes_pal_table[ sound_bank.sfx[ index ].note ];

    SIDFXExplosion[0].freq    = hex_freq;
    SIDFXExplosion[0].pwm     = sound_bank.sfx[ index ].pwm;
    SIDFXExplosion[0].ctrl    = sound_bank.sfx[ index ].wave;
    SIDFXExplosion[0].attdec  = sound_bank.sfx[ index ].ad;
    SIDFXExplosion[0].susrel  = sound_bank.sfx[ index ].sr;
    SIDFXExplosion[0].dfreq   = sound_bank.sfx[ index ].dfreq;
    SIDFXExplosion[0].dpwm    = sound_bank.sfx[ index ].dpwm;
    SIDFXExplosion[0].time1   = sound_bank.sfx[ index ].time1;
    SIDFXExplosion[0].time0   = sound_bank.sfx[ index ].time0;

}

// copy first sfx slot into active sound_bank instrument
// store sfx
void copy_sfx_from_first_sfx_slot_into_sound_bank( byte index ) {
    
    byte note_index = find_note( SIDFXExplosion[0].freq );

    sound_bank.sfx[ index ].note  = note_index;
    sound_bank.sfx[ index ].pwm   = SIDFXExplosion[0].pwm;
    sound_bank.sfx[ index ].wave  = SIDFXExplosion[0].ctrl;
    sound_bank.sfx[ index ].ad    = SIDFXExplosion[0].attdec;
    sound_bank.sfx[ index ].sr    = SIDFXExplosion[0].susrel;
    sound_bank.sfx[ index ].dfreq = SIDFXExplosion[0].dfreq;
    sound_bank.sfx[ index ].dpwm  = SIDFXExplosion[0].dpwm;
    sound_bank.sfx[ index ].time1 = SIDFXExplosion[0].time1;
    sound_bank.sfx[ index ].time0 = SIDFXExplosion[0].time0;

}

void sound_bank_init( void ) {
    
    byte counter = sizeof( sound_bank ) / sizeof( struct SFX );

    for(int i=0; i<counter; i++ ) {

        sound_bank.sfx[ i ].note  =  0x1d;
        sound_bank.sfx[ i ].pwm   = 0x080;
        sound_bank.sfx[ i ].wave  =  0x21;
        sound_bank.sfx[ i ].ad    =     0;
        sound_bank.sfx[ i ].sr    =  0xf0;
        sound_bank.sfx[ i ].dfreq =     0;
        sound_bank.sfx[ i ].dpwm  =     0;
        sound_bank.sfx[ i ].time1 =  0x08;
        sound_bank.sfx[ i ].time0 =  0x08;

    }

}

