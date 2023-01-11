
// copy active sound_bank instrument into first sfx slot
void store_sfx_to_clipboard(struct SFX * sound_data) {

    unsigned hex_freq = notes_pal_table[ sound_data->note ];
    SIDFXClipboard[0].freq    = hex_freq;
    SIDFXClipboard[0].pwm     = sound_data->pwm;
    SIDFXClipboard[0].ctrl    = sound_data->wave;
    SIDFXClipboard[0].attdec  = sound_data->ad;
    SIDFXClipboard[0].susrel  = sound_data->sr;
    SIDFXClipboard[0].dfreq   = sound_data->dfreq;
    SIDFXClipboard[0].dpwm    = sound_data->dpwm;
    SIDFXClipboard[0].time1   = sound_data->time1;
    SIDFXClipboard[0].time0   = sound_data->time0;

}

// copy first sfx slot into active sound_bank instrument
void restore_sfx_from_clipboard(struct SFX * sound_data) {
    
    byte note_index = find_note( SIDFXClipboard[0].freq );
    sound_data->note  = note_index;
    sound_data->pwm   = SIDFXClipboard[0].pwm;
    sound_data->wave  = SIDFXClipboard[0].ctrl;
    sound_data->ad    = SIDFXClipboard[0].attdec;
    sound_data->sr    = SIDFXClipboard[0].susrel;
    sound_data->dfreq = SIDFXClipboard[0].dfreq;
    sound_data->dpwm  = SIDFXClipboard[0].dpwm;
    sound_data->time1 = SIDFXClipboard[0].time1;
    sound_data->time0 = SIDFXClipboard[0].time0;

}

void init_sfx_structure(struct SFX * sound_data, byte count) {

    char empty[] = " -           ";
    for(int i=0; i<count; i++ ) {
        for (char j=0; j<SOUND_NAME_LENGTH; j++) {
            sound_data[i].name[j] = empty[j];
        }
        sound_data[ i ].note  =  0x1d;
        sound_data[ i ].pwm   = 0x080;
        sound_data[ i ].wave  =  0x21;
        sound_data[ i ].ad    =     0;
        sound_data[ i ].sr    =  0xf0;
        sound_data[ i ].dfreq =     0;
        sound_data[ i ].dpwm  =     0;
        sound_data[ i ].time1 =  0x08;
        sound_data[ i ].time0 =  0x08;
    }

}

