
void null(void) {
}

void debug_put_word(char value) {
    unsigned pos = 880;
    CHAR_RAM[pos+0] = int2hexpetscii[ (value >> 12) & 0x0f ];
    CHAR_RAM[pos+1] = int2hexpetscii[ (value >>  8) & 0x0f ];
    CHAR_RAM[pos+2] = int2hexpetscii[ (value >>  4) & 0x0f ];
    CHAR_RAM[pos+3] = int2hexpetscii[  value        & 0x0f ];
}

void debug_put_byte(char value) {
    unsigned pos = 880;
    CHAR_RAM[pos+0] = int2hexpetscii[ (value >>  4) & 0x0f ];
    CHAR_RAM[pos+1] = int2hexpetscii[  value        & 0x0f ];
}

void debug_put_byte1(char value) {
    unsigned pos = 880;
    CHAR_RAM[pos+3] = int2hexpetscii[ (value >>  4) & 0x0f ];
    CHAR_RAM[pos+4] = int2hexpetscii[  value        & 0x0f ];
}

void debug_put_byte2(char value) {
    unsigned pos = 880;
    CHAR_RAM[pos+6] = int2hexpetscii[ (value >>  4) & 0x0f ];
    CHAR_RAM[pos+7] = int2hexpetscii[  value        & 0x0f ];
}



