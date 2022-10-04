
//
// load/save buffor
//
//
//
// 96 bits |  12 bytes   -- name
//  8 bits |   1 byte    -- note nr
// 12 bits | 1.5 byte    -- pwm
//  8 bits |   1 byte    -- ctrl ( wave, gate )
//  8 bits |   1 byte    -- attack/decay
//  8 bits |   1 byte    -- sustain/release
// 16 bits |   2 bytes   -- dfreq
// 12 bits | 1.5 byte    -- dpwm
//  8 bits |   1 byte    -- time1
//  8 bits |   1 byte    -- time2
//
// 12 + 11 = 23 but we uses 24 anyway
//
// we are using 24 bytes per instrument
// ( 12 name and 12 parameters )
char ins_template[24] = "1234567890ab1234567890ab";


