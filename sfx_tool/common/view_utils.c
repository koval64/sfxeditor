
void copy_to_screen(char * petscii_char_array) {

    // put petscii editor data on screen
    for(int i=0; i<1000; i++)
        CHAR_RAM[i] = petscii_char_array[i];

}

void clear_screen(char color) {

    // clear char and color RAM
    for(int i=0; i<1000; i++) {
        CHAR_RAM[i]  = ' ';
        COLOR_RAM[i] = color;
    }

}

void win_put_at(char * petscii_char_array, char pos_x, char pos_y, char width, char height) {

    // put petscii char array data on screen on specified coordinates
    // with given width and height
    int i=0;
    for(int y=pos_y; y<(pos_y+height); y++) {
        for(int x=pos_x; x<(pos_x+width); x++) {
            CHAR_RAM[y*40+x] = petscii_char_array[i];
            i++;
        }
    }

}

