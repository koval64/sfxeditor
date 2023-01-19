

void normal_text(unsigned pos) {
  for (byte i = 0; i < SOUND_NAME_LENGTH; i++) {
    CHAR_RAM[pos + i] &= 127;
  }
}

void invert_text(unsigned pos) {
  for (byte i = 0; i < SOUND_NAME_LENGTH; i++) {
    CHAR_RAM[pos + i] |= 128;
  }
}

void deselect_normal_text(unsigned pos) {
  for (byte i = 0; i < SOUND_NAME_LENGTH; i++) {
    COLOR_RAM[pos] = OPTION_ON_COLOR;
    CHAR_RAM[pos] &= 127;
    pos++;
  }
}

void select_invert_text(unsigned pos) {
  for (byte i = 0; i < SOUND_NAME_LENGTH; i++) {
    COLOR_RAM[pos] = OPTION_ON_SELECTED_COLOR;
    CHAR_RAM[pos] |= 128;
    pos++;
  }
}
