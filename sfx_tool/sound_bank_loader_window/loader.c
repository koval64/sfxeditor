
void loader_save_file(void) {

    // SET NAME FOR FILE AND OPEN IT WITH REPLACE ON DRIVE 8
    krnio_setnam("@0:SOUNDBANK00.SBK,P,W");

    if (krnio_open(2, 8, 2)) {

        // FILL THE FILE WITH THE ARRAY
        for( byte i=0; i<SFX_COUNT; i++ ) {

            //
            // convert sound bank data structure into template
            //
            for (char j=0; j<SFX_NAME_LEN; j++) {
                ins_template[j] = sound_bank.sfx[i].name[j];
            }
            ins_template[12] = sound_bank.sfx[i].note;
            ins_template[13] = (sound_bank.sfx[i].pwm >> 8) & 0xff;
            ins_template[14] = (sound_bank.sfx[i].pwm & 0xff);
            ins_template[15] = sound_bank.sfx[i].wave;
            ins_template[16] = sound_bank.sfx[i].ad;
            ins_template[17] = sound_bank.sfx[i].sr;
            ins_template[18] = (sound_bank.sfx[i].dfreq >> 8) & 0xff;
            ins_template[19] = (sound_bank.sfx[i].dfreq & 0xff);
            ins_template[20] = (sound_bank.sfx[i].dpwm >> 8) & 0xff;
            ins_template[21] = (sound_bank.sfx[i].dpwm & 0xff);
            ins_template[22] = sound_bank.sfx[i].time1;
            ins_template[23] = sound_bank.sfx[i].time0;

            //
            // save template
            //
            krnio_write(2, (char*)ins_template, sizeof(ins_template));
        }
        // CLOSE THE FILE
        krnio_close(2);
    }
}

void loader_load_file(void) {

    // SET NAME FOR FILE AND OPEN IT WITH REPLACE ON DRIVE 8
    krnio_setnam("SOUNDBANK00.SBK,P,R");

    if (krnio_open(2, 8, 2)) {

        for( byte i=0; i<SFX_COUNT; i++ ) {

            //
            // read instrument data into template
            //
            krnio_read(2, (char*)ins_template, sizeof(ins_template));

            //
            // convert sound data from template into sound bank structure
            //
            for (char j=0; j<SFX_NAME_LEN; j++) {
                sound_bank.sfx[i].name[j] = ins_template[j];
            }
            sound_bank.sfx[i].note = ins_template[12];
            sound_bank.sfx[i].pwm  = (ins_template[13] << 8) + ins_template[14];
            sound_bank.sfx[i].wave = ins_template[15];
            sound_bank.sfx[i].ad   = ins_template[16];
            sound_bank.sfx[i].sr   = ins_template[17];
            sound_bank.sfx[i].dfreq = (ins_template[18] << 8) + ins_template[19];
            sound_bank.sfx[i].dpwm  = (ins_template[20] << 8) + ins_template[21];
            sound_bank.sfx[i].time1 = ins_template[22];
            sound_bank.sfx[i].time0 = ins_template[23];
        }
      // CLOSE THE FILE
      krnio_close(2);
    }
}

