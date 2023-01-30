
// global variables used here and in "scene.c"
char edit_label_x_pos = 0;
char edit_label_x_min = 0;
char edit_label_x_max = 0;
int edit_label_y_pos = 0;

void screen_char_set_normal(void)
{
    int pos = edit_label_y_pos + edit_label_x_pos;
    CHAR_RAM[pos] &= 127;
}

void label_go_left(void)
{
    screen_char_set_normal();
    if (edit_label_x_pos > edit_label_x_min)
    {
        edit_label_x_pos--;
    }
    if (edit_label_x_pos == (edit_label_x_max - 1))
    {
        screen_char_set_normal(); // fix: set last character to normal
        edit_label_x_pos--;
    }
}

void label_go_right(void)
{
    screen_char_set_normal();
    if (edit_label_x_pos < edit_label_x_max)
    {
        edit_label_x_pos++;
    }
}

void label_add_char(byte key)
{
    if ((edit_label_x_pos < edit_label_x_max) && (edit_label_x_pos < 40))
    {
        // screen char pos put[ key ];
        CHAR_RAM[edit_label_y_pos + edit_label_x_pos] = key;
        edit_label_x_pos++;
    }
    if ((edit_label_x_pos == 40) || (edit_label_x_pos == edit_label_x_max))
    {
        CHAR_RAM[edit_label_y_pos + edit_label_x_pos - 1] = key;
    }
}

void label_backspace(void)
{
    if (edit_label_x_pos > edit_label_x_min && edit_label_x_pos < 41)
    {
        screen_char_set_normal();
        // screen char pos go back 1 char and put space
        edit_label_x_pos--;
        CHAR_RAM[edit_label_y_pos + edit_label_x_pos] = KEY_SPACE;
    }
}
