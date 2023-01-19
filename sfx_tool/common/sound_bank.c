
void copy_sfx_to_sfx(struct SFX * destination, struct SFX * source_data) {

    memcpy(destination->name, source_data->name, sizeof(source_data->name));

    destination->note       = source_data->note;
    destination->pwm        = source_data->pwm;
    destination->wave       = source_data->wave;
    destination->ad         = source_data->ad;
    destination->sr         = source_data->sr;
    destination->dfreq      = source_data->dfreq;
    destination->dpwm       = source_data->dpwm;
    destination->time1      = source_data->time1;
    destination->time0      = source_data->time0;

}

// copy active sound_bank_instrument into sound_focus
void sound_focus_load_sound_from(struct SFX * sound_data) {

    unsigned hex_freq = notes_pal_table[ sound_data->note ];
    SIDFXFocus[0].freq    = hex_freq;
    SIDFXFocus[0].pwm     = sound_data->pwm;
    SIDFXFocus[0].ctrl    = sound_data->wave;
    SIDFXFocus[0].attdec  = sound_data->ad;
    SIDFXFocus[0].susrel  = sound_data->sr;
    SIDFXFocus[0].dfreq   = sound_data->dfreq;
    SIDFXFocus[0].dpwm    = sound_data->dpwm;
    SIDFXFocus[0].time1   = sound_data->time1;
    SIDFXFocus[0].time0   = sound_data->time0;

}

// copy sound_focus into active sound_bank_instrument
void sound_focus_save_sound_to(struct SFX * sound_data) {
    
    byte note_index = find_note( SIDFXFocus[0].freq );
    sound_data->note  = note_index;
    sound_data->pwm   = SIDFXFocus[0].pwm;
    sound_data->wave  = SIDFXFocus[0].ctrl;
    sound_data->ad    = SIDFXFocus[0].attdec;
    sound_data->sr    = SIDFXFocus[0].susrel;
    sound_data->dfreq = SIDFXFocus[0].dfreq;
    sound_data->dpwm  = SIDFXFocus[0].dpwm;
    sound_data->time1 = SIDFXFocus[0].time1;
    sound_data->time0 = SIDFXFocus[0].time0;

}

void init_sfx_structure(struct SFX * sound_data, byte count) {

    char empty[] = " -           ";

    for(int i=0; i<count; i++ ) {

        memcpy(sound_data[i].name, empty, sizeof(empty));

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

