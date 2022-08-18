
void sounds_window_show( void ) {

    // clear chars and set color
    clear_screen(VCOL_DARK_GREY);

    // import data from petscii editor ( whole screen )
    copy_to_screen(sounds_view);

    // sounds_window->select_default_menu_options
    store_sfx();                      // temporary workaround ( temporary fix )
    sounds_select_option();

}

