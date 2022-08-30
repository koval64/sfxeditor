
//
// load/save buffor
//
//
//
// 12   name
// 1    note nr
// 1.5  pwm
// 1    ctrl ( wave, gate itd )
// 1    ad
// 1    sr
// 2    dfreq
// 1.5  dpwm
// 1    time1
// 1    time2
//
// 12 + 11
//
// we are using 24 bytes per instrument
// ( 12 name and 12 parameters )
char ins_template[24] = "1234567890ab1234567890ab";


