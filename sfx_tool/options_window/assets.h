
#define OPTIONS_POS_X 9
#define OPTIONS_POS_Y 9
#define OPTIONS_WIDTH 22
#define OPTIONS_HEIGHT 11
#define OPTIONS_SCREEN_POS 40 * OPTIONS_POS_Y + OPTIONS_POS_X

// options
#define OPTIONS_COUNT 6

struct MENU_OPTION
{
    byte close_menu_flag;
    byte x;
    byte y;
    void (*pressed)(void);
};

struct MENU_TREE
{
    byte active_option_index;
    struct MENU_OPTION option[OPTIONS_COUNT];
};

extern struct MENU_TREE options;