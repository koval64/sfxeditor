
void init_view_buffer(void) {

    int pos = 0;
    char empty[] = " -           ";
    for (char y=SOUND_BANK_ALIGN_Y; y<SOUND_BANK_VIEW_ROWS; y++ ) {
        for (char a=0; a<SOUND_BANK_VIEW_COLUMNS; a++ ) {
            for (char x=0; x<SOUND_BANK_FIELD_SIZE; x++ ) {
                sound_bank_view_buffer[ pos ] = empty[ x ];
                pos++;
            }
        }
        sound_bank_view_buffer[ pos ] = ' ';
        pos++;
    }
}

void copy_screen_name_to_view_buffer(void) {
    char x = SOUND_BANK_ALIGN_X + column * SOUND_BANK_FIELD_SIZE;
    char y = row;
    char length = SOUND_BANK_FIELD_SIZE-1;

    int pos = 40*y + x;

    for (int i=0; i<length; i++ ) {
        sound_bank_view_buffer[pos+i] = CHAR_RAM[pos+i];
    }
}

void view_buffer_set_sound_name(char * name, char nr) {
    char x = SOUND_BANK_ALIGN_X + (nr/SOUND_BANK_VIEW_ROWS) * SOUND_BANK_FIELD_SIZE;
    char y = nr%SOUND_BANK_VIEW_ROWS;
    char length = SOUND_BANK_FIELD_SIZE-1;

    int pos = 40*y + x;

    for (int i=0; i<length; i++ ) {
        sound_bank_view_buffer[pos+i] = name[i];
    }
}

void view_buffer_get_sound_name(char * name, char nr) {
    char x = SOUND_BANK_ALIGN_X + (nr/SOUND_BANK_VIEW_ROWS) * SOUND_BANK_FIELD_SIZE;
    char y = nr%SOUND_BANK_VIEW_ROWS;
    char length = SOUND_BANK_FIELD_SIZE-1;

    int pos = 40*y + x;

    for ( char i=0; i<length; i++ ) {
        name[i] = sound_bank_view_buffer[pos+i];
    }
}

