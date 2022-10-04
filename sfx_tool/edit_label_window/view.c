
// global variables used here and in "scene.c"
char edit_label_x_pos = 0;
char edit_label_x_min = 0;
char edit_label_x_max = 0;
int edit_label_y_pos = 0;

void label_add_char( byte key ) {
    if ( edit_label_x_pos < edit_label_x_max && edit_label_x_pos < 39 ) {
        // screen char pos put[ key ];
        CHAR_RAM[ edit_label_y_pos + edit_label_x_pos ] = key;
        edit_label_x_pos++;
    }
}

void label_backspace(void) {
    if ( edit_label_x_pos > edit_label_x_min && edit_label_x_pos < 40 ) {
        // screen char pos put space and go back 1 char
        edit_label_x_pos--;
        CHAR_RAM[ edit_label_y_pos + edit_label_x_pos ] = KEY_SPACE;
    }
}

