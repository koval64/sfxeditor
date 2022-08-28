
void exporter_fill_txt_template(void) {

    int freq = SIDFXExplosion[0].freq;
    exporter_txt_template[30] = int2hexpetscii[ (freq >> 12) & 0x0f];
    exporter_txt_template[31] = int2hexpetscii[ (freq >>  8) & 0x0f];
    exporter_txt_template[32] = int2hexpetscii[ (freq >>  4) & 0x0f];
    exporter_txt_template[33] = int2hexpetscii[ freq & 0x0f];

    unsigned pwm = SIDFXExplosion[0].pwm;
    exporter_txt_template[39] = int2hexpetscii[ (pwm >>  8) & 0x0f];
    exporter_txt_template[40] = int2hexpetscii[ (pwm >>  4) & 0x0f];
    exporter_txt_template[41] = int2hexpetscii[ pwm & 0x0f];

    int ctrl = SIDFXExplosion[0].ctrl;
    exporter_txt_template[50] = int2hexpetscii[ (ctrl >>  4) & 0x0f];
    exporter_txt_template[51] = int2hexpetscii[ ctrl & 0x0f];

    char ad = SIDFXExplosion[0].attdec;
    char sr = SIDFXExplosion[0].susrel;
    exporter_txt_template[60] = int2hexpetscii[ (ad >> 4) & 0x0f ];
    exporter_txt_template[61] = int2hexpetscii[ ad & 0x0f ];
    exporter_txt_template[70] = int2hexpetscii[ (sr >> 4) & 0x0f ];
    exporter_txt_template[71] = int2hexpetscii[ sr & 0x0f ];

    int dfreq = SIDFXExplosion[0].dfreq;
    exporter_txt_template[80] = int2hexpetscii[ (dfreq >> 12) & 0x0f];
    exporter_txt_template[81] = int2hexpetscii[ (dfreq >>  8) & 0x0f];
    exporter_txt_template[82] = int2hexpetscii[ (dfreq >>  4) & 0x0f];
    exporter_txt_template[83] = int2hexpetscii[ dfreq & 0x0f];

    int dpwm = SIDFXExplosion[0].dpwm;
    exporter_txt_template[88] = int2hexpetscii[ (dpwm >> 12) & 0x0f];
    exporter_txt_template[89] = int2hexpetscii[ (dpwm >>  8) & 0x0f];
    exporter_txt_template[90] = int2hexpetscii[ (dpwm >>  4) & 0x0f];
    exporter_txt_template[91] = int2hexpetscii[ dpwm & 0x0f];

    char time1 = SIDFXExplosion[0].time1;
    exporter_txt_template[100] = int2hexpetscii[ (time1 >>  4) & 0x0f];
    exporter_txt_template[101] = int2hexpetscii[ time1 & 0x0f];

    char time0 = SIDFXExplosion[0].time0;
    exporter_txt_template[106] = int2hexpetscii[ (time0 >>  4) & 0x0f];
    exporter_txt_template[107] = int2hexpetscii[ time0 & 0x0f];
}

int exporter_save_file(void)
{
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
	return 0;
}

