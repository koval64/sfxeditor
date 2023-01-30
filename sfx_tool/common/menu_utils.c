
void normal_text(unsigned pos)
{
    for (byte i = 0; i < SOUND_NAME_LENGTH; i++)
        CHAR_RAM[pos + i] &= 127;
}

void invert_text(unsigned pos)
{
    for (byte i = 0; i < SOUND_NAME_LENGTH; i++)
        CHAR_RAM[pos + i] |= 128;
}

void toggle_invert_text(unsigned pos)
{
    if (CHAR_RAM[pos] > 127)
        normal_text(pos);
    else
        invert_text(pos);
}
void select_text(unsigned pos)
{
    for (byte i = 0; i < SOUND_NAME_LENGTH; i++)
        COLOR_RAM[pos + i] = OPTION_COLOR_SELECTED;
}

void deselect_text(unsigned pos)
{
    for (byte i = 0; i < SOUND_NAME_LENGTH; i++)
        COLOR_RAM[pos + i] = OPTION_COLOR_GRAY_OUT;
}

void select_invert_text(unsigned pos)
{
    for (byte i = 0; i < SOUND_NAME_LENGTH; i++)
    {
        COLOR_RAM[pos] = OPTION_COLOR_SELECTED;
        CHAR_RAM[pos] |= 128;
        pos++;
    }
}

void deselect_normal_text(unsigned pos)
{
    for (byte i = 0; i < SOUND_NAME_LENGTH; i++)
    {
        COLOR_RAM[pos] = OPTION_COLOR_GRAY_OUT;
        CHAR_RAM[pos] &= 127;
        pos++;
    }
}
