
// copy given data to screen
void copy_to_screen(byte * petscii_char_array) {

    // put char data on screen
    for(int i=0; i<1000; i++)
        CHAR_RAM[i] = petscii_char_array[i];

}

// clear screen
void clear_screen(byte color) {

    // clear char and color RAM
    for(int i=0; i<1000; i++) {
        CHAR_RAM[i]  = ' ';
        COLOR_RAM[i] = color;
    }

}

// copy window with given (width,height) to (x,y) coordinates on to the screen
void win_put_at(byte * petscii_char_array, byte pos_x, byte pos_y, byte width, byte height) {

    // put char array data on screen on specified coordinates
    // with given width and height
    int i=0;
    for(int y=pos_y; y<(pos_y+height); y++) {
        for(int x=pos_x; x<(pos_x+width); x++) {
            CHAR_RAM[y*40+x] = petscii_char_array[i];
            i++;
        }
    }

}

