

// copy active sound_bank_instrument into sound_focus_nr
void sound_focus_nr_load_sound_from(struct SIDFX * sound_focus, struct SFX * sound_data) {

    unsigned hex_freq = notes_pal_table[ sound_data->note ];
    sound_focus->freq    = hex_freq;
    sound_focus->pwm     = sound_data->pwm;
    sound_focus->ctrl    = sound_data->wave;
    sound_focus->attdec  = sound_data->ad;
    sound_focus->susrel  = sound_data->sr;
    sound_focus->dfreq   = sound_data->dfreq;
    sound_focus->dpwm    = sound_data->dpwm;
    sound_focus->time1   = sound_data->time1;
    sound_focus->time0   = sound_data->time0;

}

// copy sound_focus into active sound_bank_instrument
void sound_focus_nr_save_sound_to(struct SIDFX * sound_focus, struct SFX * sound_data) {
    
    byte note_index = find_note( SIDFXFocus[0].freq );
    sound_data->note  = note_index;
    sound_data->pwm   = sound_focus->pwm;
    sound_data->wave  = sound_focus->ctrl;
    sound_data->ad    = sound_focus->attdec;
    sound_data->sr    = sound_focus->susrel;
    sound_data->dfreq = sound_focus->dfreq;
    sound_data->dpwm  = sound_focus->dpwm;
    sound_data->time1 = sound_focus->time1;
    sound_data->time0 = sound_focus->time0;

}

// copy active sound_bank_instrument into sound_focus
void sound_focus_load_sound_from(struct SFX * sound_data) {
    sound_focus_nr_load_sound_from(SIDFXFocus, sound_data);
}

// copy sound_focus into active sound_bank_instrument
void sound_focus_save_sound_to(struct SFX * sound_data) {
    sound_focus_nr_save_sound_to(SIDFXFocus, sound_data);
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

