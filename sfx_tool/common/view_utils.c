
// copy buffer data to screen
void swap_buffer(void) {

    // put char data on screen
    #pragma unroll (page)
    for(int i=0; i<1000; i++) {
        CHAR_RAM [i] = char_ram_buffer[i];
        COLOR_RAM[i] = VCOL_DARK_GREY;
    }
}

// clear buffer data
void clear_buffer(void) {

    // clear char and color RAM
    #pragma unroll (page)
    for(int i=0; i<1000; i++) {
        char_ram_buffer[i] = ' ';
    }

}
// clear screen
void clear_screen(char color) {

    // clear char and color RAM
    #pragma unroll (page)
    for(int i=0; i<1000; i++) {
        CHAR_RAM [i] = ' ';
        COLOR_RAM[i] = color;
    }

}

// copy window with given (width,height) to (x,y) coordinates on destination buffer
void win_put_at_buffer(char * petscii_char_array, byte pos_x, byte pos_y, byte width, byte height) {

    // put char array data on screen on specified coordinates
    // with given width and height
    int i=0;
    int cpos=40*pos_y+pos_x;
    for(int y=0; y<height; y++) {
        for(int x=0; x<width; x++) {
            char_ram_buffer[cpos] = petscii_char_array[i];
            i++;
            cpos++;
        }
        cpos += 40-width;
    }

}

// copy window with given (width,height) to (x,y) coordinates on to the screen
void win_put_at(char * petscii_char_array, byte pos_x, byte pos_y, byte width, byte height) {

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

