
byte sid_waveforms[] = { SID_CTRL_TRI, SID_CTRL_SAW, SID_CTRL_RECT, SID_CTRL_NOISE };

// update audio
// pack (menu selections) to (SIDFX oscar structure)
void update_sidfx_struct() {

    byte ad = menu.option[ ATTACK_INDEX  ].value << 4 | menu.option[ DECAY_INDEX ].value; 
    byte sr = menu.option[ SUSTAIN_INDEX ].value << 4 | menu.option[ RELEASE_INDEX ].value;

    SIDFXClipboard[0].ctrl = sid_waveforms[ menu.option[ WAVEFORM_INDEX ].value ] | SID_CTRL_GATE;
    SIDFXClipboard[0].pwm  = menu.option[ PWM_INDEX ].value;     // PWM(0,4096) - 12 bits

    SIDFXClipboard[0].attdec = ad;  // attack/decay
    SIDFXClipboard[0].susrel = sr;  // sustain/release

    SIDFXClipboard[0].dfreq = menu.option[ DFREQ_INDEX ].value;
    SIDFXClipboard[0].dpwm  = menu.option[ DPWM_INDEX  ].value;

    SIDFXClipboard[0].time1 = menu.option[ TIME1_INDEX ].value;
    SIDFXClipboard[0].time0 = menu.option[ TIME0_INDEX ].value;
}

// unpack (SIDFX oscar structure) into (menu selections)
void update_menu_selections() {

    byte wave = SIDFXClipboard[0].ctrl & 0xf0;
    byte ad   = SIDFXClipboard[0].attdec;  // attack/decay
    byte sr   = SIDFXClipboard[0].susrel;  // sustain/release

    // calculate waveform menu index (0,1,2,3)
    for( int i=0; i<=3; i++ ) {
        if( wave == sid_waveforms[i] ) {
            menu.option[ WAVEFORM_INDEX ].value = i;
            break;
        }
    }

    menu.option[ PWM_INDEX ].value = SIDFXClipboard[0].pwm;     // PWM(0,4096) - 12 bits

    menu.option[ ATTACK_INDEX  ].value = (ad >> 4) & 0x0f;
    menu.option[ DECAY_INDEX   ].value = (ad     ) & 0x0f;

    menu.option[ SUSTAIN_INDEX ].value = (sr >> 4) & 0x0f;
    menu.option[ RELEASE_INDEX ].value = (sr     ) & 0x0f;

    menu.option[ DFREQ_INDEX ].value = SIDFXClipboard[0].dfreq;
    menu.option[ DPWM_INDEX  ].value = SIDFXClipboard[0].dpwm;

    menu.option[ TIME1_INDEX ].value = SIDFXClipboard[0].time1; 
    menu.option[ TIME0_INDEX ].value = SIDFXClipboard[0].time0;
}

