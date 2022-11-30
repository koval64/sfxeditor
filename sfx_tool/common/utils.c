
void null(void) {
}

void debug_put_word0(int value) {
    unsigned pos = 920;
    CHAR_RAM[pos+0] = byte2hexpetscii[ (value >> 12) & 0x0f ];
    CHAR_RAM[pos+1] = byte2hexpetscii[ (value >>  8) & 0x0f ];
    CHAR_RAM[pos+2] = byte2hexpetscii[ (value >>  4) & 0x0f ];
    CHAR_RAM[pos+3] = byte2hexpetscii[  value        & 0x0f ];
}

void debug_put_byte0(byte value) {
    unsigned pos = 880;
    CHAR_RAM[pos+0] = byte2hexpetscii[ (value >>  4) & 0x0f ];
    CHAR_RAM[pos+1] = byte2hexpetscii[  value        & 0x0f ];
}

void debug_put_byte1(byte value) {
    unsigned pos = 880;
    CHAR_RAM[pos+3] = byte2hexpetscii[ (value >>  4) & 0x0f ];
    CHAR_RAM[pos+4] = byte2hexpetscii[  value        & 0x0f ];
}

void debug_put_byte2(byte value) {
    unsigned pos = 880;
    CHAR_RAM[pos+6] = byte2hexpetscii[ (value >>  4) & 0x0f ];
    CHAR_RAM[pos+7] = byte2hexpetscii[  value        & 0x0f ];
}

void debug_put_byte3(byte value) {
    unsigned pos = 880;
    CHAR_RAM[pos+ 9] = byte2hexpetscii[ (value >>  4) & 0x0f ];
    CHAR_RAM[pos+10] = byte2hexpetscii[  value        & 0x0f ];
}

void debug_put_byte4(byte value) {
    unsigned pos = 880;
    CHAR_RAM[pos+11] = byte2hexpetscii[ (value >>  4) & 0x0f ];
    CHAR_RAM[pos+12] = byte2hexpetscii[  value        & 0x0f ];
}



