
void init_view_buffor(void) {
}

void copy_screen_name_to_view_buffor(void) {
    char x = 1 + column * SOUND_BANK_FIELD_SIZE;
    char y = row;
    char length = SOUND_BANK_FIELD_SIZE-1;

    int pos = 40*y + x;

    for (int i=0; i<length; i++ ) {
        sound_bank_view_data[pos+i] = CHAR_RAM[pos+i];
    }
}

void view_buffor_set_sound_name(char * name, char nr) {
    char x = 1 + (nr/SOUND_BANK_VIEW_ROWS) * SOUND_BANK_FIELD_SIZE;
    char y = nr%SOUND_BANK_VIEW_ROWS;
    char length = SOUND_BANK_FIELD_SIZE-1;

    int pos = 40*y + x;

    for (int i=0; i<length; i++ ) {
        sound_bank_view_data[pos+i] = name[i];
    }
}

void view_buffor_get_sound_name(char * name, char nr) {
    char x = 1 + (nr/SOUND_BANK_VIEW_ROWS) * SOUND_BANK_FIELD_SIZE;
    char y = nr%SOUND_BANK_VIEW_ROWS;
    char length = SOUND_BANK_FIELD_SIZE-1;

    int pos = 40*y + x;

    for ( char i=0; i<length; i++ ) {
        name[i] = sound_bank_view_data[pos+i];
    }
}

