

// struct SIDFX SIDFXOneTrack[TRACK_LENGTH];
// sound_focus_nr_save_sound_to

// sound_data[ i ].note  =  0x1d;
// sound_data[ i ].pwm   = 0x080;
// sound_data[ i ].wave  =  0x21;
// sound_data[ i ].ad    =     0;
// sound_data[ i ].sr    =  0xf0;
// sound_data[ i ].dfreq =     0;
// sound_data[ i ].dpwm  =     0;
// sound_data[ i ].time1 =  0x08;
// sound_data[ i ].time0 =  0x08;

/* struct SIDFX */
/* { */
/* 	unsigned	freq, pwm; */
/* 	byte		ctrl, attdec, susrel; */
/* 	int		dfreq, dpwm; */
/* 	byte		time1, time0; */
/* 	byte		priority; */
/* }; */

void fill_one_track_play_structure(void)
{
    for (byte i = 0; i < TRACK_LENGTH; i++)
    {
        SIDFXOneTrack[i].freq = notes_pal_table[one_track[i].note];
        SIDFXOneTrack[i].pwm = one_track[i].pwm;
        SIDFXOneTrack[i].ctrl = one_track[i].wave;
        SIDFXOneTrack[i].attdec = one_track[i].ad;
        SIDFXOneTrack[i].susrel = one_track[i].sr;
        SIDFXOneTrack[i].dfreq = one_track[i].dfreq;
        SIDFXOneTrack[i].dpwm = one_track[i].dpwm;
        SIDFXOneTrack[i].time0 = one_track[i].time0;
        SIDFXOneTrack[i].time1 = one_track[i].time1;
    }
}

// copy active sound_bank_instrument into sound_focus
void one_track_sound_focus_load_sound_from(struct SFX *sound_data)
{
    sound_focus_nr_load_sound_from(SIDFXFocusOneTrack, sound_data);
}

// copy sound_focus into active sound_bank_instrument
void one_track_save_sound_focus_to_sound(struct SFX *sound_data)
{
    // sound_focus_nr_save_sound_to(SIDFXFocusOneTrack, sound_data);
    sound_focus_nr_save_sound_to(SIDFXFocus, sound_data);
}