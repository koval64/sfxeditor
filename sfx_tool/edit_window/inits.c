
void edit_window_init_options_struct( void ) {

    menu.index = 0;

    menu.option[WAVEFORM_INDEX].value = 0;
    menu.option[WAVEFORM_INDEX].step = 1;
    menu.option[WAVEFORM_INDEX].change_value = waveform_menu_change_option;
    menu.option[WAVEFORM_INDEX].change_color = waveform_menu_change_color;
    menu.option[WAVEFORM_INDEX].change_step  = null;

    menu.option[PWM_INDEX].value = 0x100;
    menu.option[PWM_INDEX].step = 0x100;
    menu.option[PWM_INDEX].digit_index = 0;
    menu.option[PWM_INDEX].change_value = pwm_menu_change_value;
    menu.option[PWM_INDEX].change_color = pwm_menu_change_color;
    menu.option[PWM_INDEX].change_step  = pwm_menu_cycle_step;

    menu.option[ATTACK_INDEX].value = 0;
    menu.option[ATTACK_INDEX].step = 1;
    menu.option[ATTACK_INDEX].digit_index = 0;
    menu.option[ATTACK_INDEX].change_value = attack_menu_change_value;
    menu.option[ATTACK_INDEX].change_color = attack_menu_change_color;
    menu.option[ATTACK_INDEX].change_step  = attack_menu_cycle_step;

    menu.option[DECAY_INDEX].value = 15;
    menu.option[DECAY_INDEX].step = 1;
    menu.option[DECAY_INDEX].digit_index = 0;
    menu.option[DECAY_INDEX].change_value = decay_menu_change_value;
    menu.option[DECAY_INDEX].change_color = decay_menu_change_color;
    menu.option[DECAY_INDEX].change_step  = decay_menu_cycle_step;

    menu.option[SUSTAIN_INDEX].value = 0;
    menu.option[SUSTAIN_INDEX].step = 1;
    menu.option[SUSTAIN_INDEX].digit_index = 0;
    menu.option[SUSTAIN_INDEX].change_value = sustain_menu_change_value;
    menu.option[SUSTAIN_INDEX].change_color = sustain_menu_change_color;
    menu.option[SUSTAIN_INDEX].change_step  = sustain_menu_cycle_step;

    menu.option[RELEASE_INDEX].value = 0;
    menu.option[RELEASE_INDEX].step = 1;
    menu.option[RELEASE_INDEX].digit_index = 0;
    menu.option[RELEASE_INDEX].change_value = release_menu_change_value;
    menu.option[RELEASE_INDEX].change_color = release_menu_change_color;
    menu.option[RELEASE_INDEX].change_step  = release_menu_cycle_step;

    menu.option[DFREQ_INDEX].value = 0;
    menu.option[DFREQ_INDEX].step = 0x1000;
    menu.option[DFREQ_INDEX].digit_index = 0;
    menu.option[DFREQ_INDEX].change_value = dfreq_menu_change_value;
    menu.option[DFREQ_INDEX].change_color = dfreq_menu_change_color;
    menu.option[DFREQ_INDEX].change_step  = dfreq_menu_cycle_step;

    menu.option[DPWM_INDEX].value = 0;
    menu.option[DPWM_INDEX].step = 0x100;
    menu.option[DPWM_INDEX].digit_index = 0;
    menu.option[DPWM_INDEX].change_value = dpwm_menu_change_value;
    menu.option[DPWM_INDEX].change_color = dpwm_menu_change_color;
    menu.option[DPWM_INDEX].change_step  = dpwm_menu_cycle_step;

    menu.option[TIME1_INDEX].value = 8;
    menu.option[TIME1_INDEX].step = 0x10;
    menu.option[TIME1_INDEX].digit_index = 0;
    menu.option[TIME1_INDEX].change_value = time1_menu_change_value;
    menu.option[TIME1_INDEX].change_color = time1_menu_change_color;
    menu.option[TIME1_INDEX].change_step  = time1_menu_cycle_step;

    menu.option[TIME0_INDEX].value = 8;
    menu.option[TIME0_INDEX].step = 0x10;
    menu.option[TIME0_INDEX].digit_index = 0;
    menu.option[TIME0_INDEX].change_value = time0_menu_change_value;
    menu.option[TIME0_INDEX].change_color = time0_menu_change_color;
    menu.option[TIME0_INDEX].change_step  = time0_menu_cycle_step;

}










