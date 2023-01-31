
void normal_text(unsigned pos, byte length)
{
    for (byte i = 0; i < length; i++)
        CHAR_RAM[pos + i] &= 127;
}

void invert_text(unsigned pos, byte length)
{
    for (byte i = 0; i < length; i++)
        CHAR_RAM[pos + i] |= 128;
}

void toggle_invert_text(unsigned pos, byte length)
{
    if (CHAR_RAM[pos] > 127)
        normal_text(pos, length);
    else
        invert_text(pos, length);
}

void select_text(unsigned pos, byte length)
{
    for (byte i = 0; i < length; i++)
        COLOR_RAM[pos + i] = OPTION_COLOR_SELECTED;
}

void deselect_text(unsigned pos, byte length)
{
    for (byte i = 0; i < length; i++)
        COLOR_RAM[pos + i] = OPTION_COLOR_GRAY_OUT;
}

void select_invert_text(unsigned pos, byte length)
{
    for (byte i = 0; i < length; i++)
    {
        COLOR_RAM[pos] = OPTION_COLOR_SELECTED;
        CHAR_RAM[pos] |= 128;
        pos++;
    }
}

void deselect_normal_text(unsigned pos, byte length)
{
    for (byte i = 0; i < length; i++)
    {
        COLOR_RAM[pos] = OPTION_COLOR_GRAY_OUT;
        CHAR_RAM[pos] &= 127;
        pos++;
    }
}
