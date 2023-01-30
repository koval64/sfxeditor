
void vertical_line(int pos) {
    for (char i=0; i<24; i++) {
        char_ram_buffer[pos] = 0x5d;
        pos += 40;
    }
}

// copy buffer data to screen
void swap_buffer(void) {

    // copy buffer to char ram screen
    memcpy(CHAR_RAM, char_ram_buffer, 1000);

    // set color ram color
    memset(COLOR_RAM, VCOL_DARK_GREY, 1000);

    // #pragma unroll (page)
    // for(int i=0; i<1000; i++) {
    //     CHAR_RAM [i] = char_ram_buffer[i];
    //     COLOR_RAM[i] = VCOL_DARK_GREY;
    // }
}

// clear buffer data
void clear_buffer(void) {

    // clear char and color RAM
    memset(char_ram_buffer, ' ', 1000);

    // #pragma unroll (page)
    // for(int i=0; i<1000; i++) {
    //     char_ram_buffer[i] = ' ';
    // }
}

// clear screen data and color
void clear_screen(char color) {

    // clear char and color RAM
    memset(CHAR_RAM, ' ', 1000);
    memset(COLOR_RAM, color, 1000);

    // #pragma unroll (page)
    // for(int i=0; i<1000; i++) {
    //     CHAR_RAM [i] = ' ';
    //     COLOR_RAM[i] = color;
    // }

}

// copy window with given (width,height) to (x,y) coordinates on buffer
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

