
// copy given data to screen
void copy_to_screen(byte * petscii_char_array) {

    // put char data on screen
    #pragma unroll (page)
    for(int i=0; i<1000; i++) {
        CHAR_RAM [i] = petscii_char_array[i];
        COLOR_RAM[i] = VCOL_DARK_GREY;
    }
}

// clear buffer
void clear_buffer(char * buffer) {

    // clear char and color RAM
    #pragma unroll (page)
    for(int i=0; i<1000; i++) {
        buffer[i] = ' ';
    }

}
// clear screen
void clear_screen(byte color) {

    // clear char and color RAM
    #pragma unroll (page)
    for(int i=0; i<1000; i++) {
        CHAR_RAM [i] = ' ';
        COLOR_RAM[i] = color;
    }

}

// copy window with given (width,height) to (x,y) coordinates on destination buffer
void win_put_at_buffer(byte * petscii_char_array, byte pos_x, byte pos_y, byte width, byte height, byte * destination) {

    // put char array data on screen on specified coordinates
    // with given width and height
    int i=0;
    int cpos=40*pos_y+pos_x;
    for(int y=0; y<height; y++) {
        for(int x=0; x<width; x++) {
            destination[cpos] = petscii_char_array[i];
            i++;
            cpos++;
        }
        cpos += 40-width;
    }

}

// copy window with given (width,height) to (x,y) coordinates on to the screen
void win_put_at(byte * petscii_char_array, byte pos_x, byte pos_y, byte width, byte height) {

    // put char array data on screen on specified coordinates
    // with given width and height
    int i=0;
    int cpos=40*pos_y+pos_x;
    for(int y=0; y<height; y++) {
        for(int x=0; x<width; x++) {
            CHAR_RAM[cpos] = petscii_char_array[i];
            i++;
            cpos++;
        }
        cpos += 40-width;
    }

}

