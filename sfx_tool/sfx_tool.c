
#include "sfx_tool.h"

// maybe create struct VAULT ???

// oscar64 init
void init(void) {

    // Enable ROM
    mmap_set(MMAP_ROM);

    // Init CIAs (no kernal rom was executed so far)
    cia_init();

    // Init VIC
    vic_setmode(VICM_TEXT, (char *)0x0400, (char *)0x1800);
    vic.color_back = VCOL_BLACK;
    vic.color_border = VCOL_BLACK;

    // Init sound effects state machine
    sidfx_init();

    // Full volume
    sid.fmodevol = 15;

}

void scene_tree_assign_pointers(void) {

    scene_tree.active_scene.mainloop  = null;

    set_scene_pointers( EDIT_WINDOW       , edit_window_mainloop );
    set_scene_pointers( INFO_WINDOW       , sound_effect_info_window_mainloop );
    set_scene_pointers( SOUND_BANK_WINDOW , null );
    set_scene_pointers( LOADER_WINDOW     , null );
    // set_scene_pointers( SOUND_BANK_WINDOW , sound_bank_window_mainloop );
    // set_scene_pointers( LOADER_WINDOW     , loader_window_mainloop );
    set_scene_pointers( EDIT_LABEL_WINDOW , edit_label_window_mainloop );
    set_scene_pointers( ONE_TRACK_WINDOW  , null );
    set_scene_pointers( TWO_COLUMNS_WINDOW, null );
    set_scene_pointers( ONE_TRACK_ULTIMATE, one_track_ultimate_window_mainloop );
    set_scene_pointers( OPTIONS_WINDOW    , options_window_mainloop );
}

void project_init( void ) {

    init_sfx_structure(sound_bank, SFX_COUNT);
    init_sfx_structure(one_track, TRACK_LENGTH);

    scene_tree_assign_pointers();

//     sound_bank_window_init();
    one_track_ultimate_window_init();
    edit_window_init();

    // since active_scene pointers are initialized with null function
    // it works as main scene initial activation
    change_main_scene_to( ONE_TRACK_ULTIMATE );
    // change_main_scene_to( TWO_COLUMNS_WINDOW );
}

int main(void) {

    // global inits ( oscar )
    init();

    // project init
    project_init();

    for(;;) {
        scene_tree.active_scene.mainloop();
    }

    return 0;
}

