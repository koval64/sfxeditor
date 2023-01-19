
void edit_label_window_process_input_arguments(void) {

    // unpack input data from argv structure

    edit_label_x_min = argv.xpos;                   // x min
    edit_label_x_max = argv.xpos + argv.length;     // x max
    edit_label_x_pos = edit_label_x_min;            // actual cursor x position
    edit_label_y_pos = 40 * argv.ypos;              // cursor y position
}

