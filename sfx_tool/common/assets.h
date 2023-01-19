
// RETURN STATUSES ( ACTIONS )
#define NO_OPERATION                                0
#define SWITCH_WINDOW                               1
#define REFRESH_SCENE                               2
#define COPY_SOUND_FROM_TWO_COLUMNS_TO_ONE_TRACK    3

// DIRECTIONS
#define LEFT                1
#define RIGHT               2
#define UP                  4
#define DOWN                8

// TEXT DECORATORS
#define NORMAL              1
#define INVERT              2
#define SELECT              4
#define DESELECT            8

// HELPERS
#define TRUE                 1
#define FALSE                0
#define SCREEN_CHAR_WIDTH   40
#define CHAR_RAM            ((byte *)0x0400)
#define COLOR_RAM           ((byte *)0xd800)

// SCENE ID'S
#define EDIT_WINDOW         0
#define INFO_WINDOW         1
#define SOUND_BANK_WINDOW   2
#define LOADER_WINDOW       3
#define EDIT_LABEL_WINDOW   4
#define ONE_TRACK_WINDOW    5
#define TWO_COLUMNS_WINDOW  6
#define ONE_TRACK_ULTIMATE  7
#define OPTIONS_WINDOW      8
#define SCENES_COUNT        9

// MENU COLOR SETTINGS
#define OPTION_ON_COLOR             VCOL_DARK_GREY
#define OPTION_ON_SELECTED_COLOR    VCOL_LT_GREY
#define OPTION_OFF_COLOR            VCOL_BLACK

#define SOUND_BANK_FIELD_SIZE   13
#define SOUND_NAME_LENGTH       12
#define TRACK_LENGTH            16
#define MULTITRACK_LENGTH        0
#define SFX_COUNT               48

struct ARGV {
    char xpos;
    char ypos;
    char length;
    char * output_text_save_pointer;
};

extern struct ARGV argv;

// "0123456789abcdef"
char byte2hexpetscii[] = {48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 1, 2, 3, 4, 5, 6};
char byte2hexascii  [] = {48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 97, 98, 99, 100, 101, 102};

char screen_char_backup [1000];
char screen_color_backup[1000];
char char_ram_buffer[1000];



