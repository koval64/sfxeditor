
void edit_label_window_process_input_arguments(void) {
    // input data
    // cp0 - column
    // cp1 - row
    // cp2 - label size
    char edit_label_x = argv.cp0;
    char edit_label_y = argv.cp1;
    char edit_label_size = argv.cp2;

    edit_label_x_min = edit_label_x;
    edit_label_x_max = edit_label_x + edit_label_size;
    edit_label_x_pos = edit_label_x_min;
    edit_label_y_pos = 40 * edit_label_y;
}

