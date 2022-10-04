
void loader_show_view(void) {
    /* backup screen part [ 15x26 ]; */
    char array_pos = 0;
    int  screen_pos = LOADER_WINDOW_POS;
    for(char y=0; y<LOADER_VIEW_HEIGHT; y++) {
        for(char x=0; x<LOADER_VIEW_WIDTH; x++) {

            // backup screen to buffer
            screen_char_backup [array_pos] = CHAR_RAM [screen_pos];
            screen_color_backup[array_pos] = COLOR_RAM[screen_pos];

            // copy to screen
            CHAR_RAM[screen_pos] = loader_window_ascii[array_pos];
            COLOR_RAM[screen_pos] = VCOL_LT_GREY;

            screen_pos++;
            array_pos++;
        }
        screen_pos += 40-LOADER_VIEW_WIDTH;     // char_ram_width - window_width
    }
}

void loader_hide_view(void) {

    // restore screen part
    int  screen_pos = LOADER_WINDOW_POS;
    char array_pos  = 0;

    for(char y=0; y<LOADER_VIEW_HEIGHT; y++) {
        for(char x=0; x<LOADER_VIEW_WIDTH; x++) {

            CHAR_RAM [screen_pos] = screen_char_backup [array_pos];
            COLOR_RAM[screen_pos] = screen_color_backup[array_pos];

            screen_pos++;
            array_pos++;
        }
        screen_pos += 40-LOADER_VIEW_WIDTH;    // char_ram_width - window_width
    }
}








