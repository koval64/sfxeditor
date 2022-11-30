

void exporter_fill_txt_template(void) {

    int freq = SIDFXExplosion[0].freq;
    exporter_txt_template[30] = byte2hexascii[ (freq >> 12) & 0x0f];
    exporter_txt_template[31] = byte2hexascii[ (freq >>  8) & 0x0f];
    exporter_txt_template[32] = byte2hexascii[ (freq >>  4) & 0x0f];
    exporter_txt_template[33] = byte2hexascii[ freq & 0x0f];

    unsigned pwm = SIDFXExplosion[0].pwm;
    exporter_txt_template[39] = byte2hexascii[ (pwm >>  8) & 0x0f];
    exporter_txt_template[40] = byte2hexascii[ (pwm >>  4) & 0x0f];
    exporter_txt_template[41] = byte2hexascii[ pwm & 0x0f];

    int ctrl = SIDFXExplosion[0].ctrl;
    exporter_txt_template[50] = byte2hexascii[ (ctrl >>  4) & 0x0f];
    exporter_txt_template[51] = byte2hexascii[ ctrl & 0x0f];

    char ad = SIDFXExplosion[0].attdec;
    char sr = SIDFXExplosion[0].susrel;
    exporter_txt_template[60] = byte2hexascii[ (ad >> 4) & 0x0f ];
    exporter_txt_template[61] = byte2hexascii[ ad & 0x0f ];
    exporter_txt_template[70] = byte2hexascii[ (sr >> 4) & 0x0f ];
    exporter_txt_template[71] = byte2hexascii[ sr & 0x0f ];

    int dfreq = SIDFXExplosion[0].dfreq;
    exporter_txt_template[80] = byte2hexascii[ (dfreq >> 12) & 0x0f];
    exporter_txt_template[81] = byte2hexascii[ (dfreq >>  8) & 0x0f];
    exporter_txt_template[82] = byte2hexascii[ (dfreq >>  4) & 0x0f];
    exporter_txt_template[83] = byte2hexascii[ dfreq & 0x0f];

    int dpwm = SIDFXExplosion[0].dpwm;
    exporter_txt_template[88] = byte2hexascii[ (dpwm >> 12) & 0x0f];
    exporter_txt_template[89] = byte2hexascii[ (dpwm >>  8) & 0x0f];
    exporter_txt_template[90] = byte2hexascii[ (dpwm >>  4) & 0x0f];
    exporter_txt_template[91] = byte2hexascii[ dpwm & 0x0f];

    char time1 = SIDFXExplosion[0].time1;
    exporter_txt_template[100] = byte2hexascii[ (time1 >>  4) & 0x0f];
    exporter_txt_template[101] = byte2hexascii[ time1 & 0x0f];

    char time0 = SIDFXExplosion[0].time0;
    exporter_txt_template[106] = byte2hexascii[ (time0 >>  4) & 0x0f];
    exporter_txt_template[107] = byte2hexascii[ time0 & 0x0f];

}

void exporter_save_file(void) {

  // FILL SOUND EFFECT TXT TEMPLATE
  exporter_fill_txt_template();

	// SET NAME FOR FILE AND OPEN IT WITH REPLACE ON DRIVE 8
	krnio_setnam("@0:SIDFXEFFECT.TXT,P,W");
	if (krnio_open(2, 8, 2))
	{
		// FILL THE FILE WITH THE ARRAY
		krnio_write(2, (char*)exporter_txt_template, sizeof(exporter_txt_template) - 1);

		// CLOSE THE FILE
		krnio_close(2);
	}

}

