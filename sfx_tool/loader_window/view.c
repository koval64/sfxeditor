
void loader_show_view(void) {
    /* backup screen part [ 13x26 ]; */
    for(char y=0; y<LOADER_VIEW_HEIGHT; y++) {
        for(char x=0; x<LOADER_VIEW_WIDTH; x++) {

            unsigned pos = LOADER_WINDOW_POS + ( y * 40 ) + x;

            // backup screen to buffer
            screen_char_backup[y][x]  = CHAR_RAM[pos];
            screen_color_backup[y][x] = COLOR_RAM[pos];

            // copy to screen
            CHAR_RAM[pos] = loader_window_ascii[y][x];
            COLOR_RAM[pos] = VCOL_LT_GREY;
        }
    }
}

void loader_hide_view(void) {
    // restore screen part
    for(char y=0; y<LOADER_VIEW_HEIGHT; y++) {
        for(char x=0; x<LOADER_VIEW_WIDTH; x++) {

            unsigned pos = LOADER_WINDOW_POS + ( y * 40 ) + x;

            CHAR_RAM[pos]  = screen_char_backup[y][x];
            COLOR_RAM[pos] = screen_color_backup[y][x];
        }
    }
}








