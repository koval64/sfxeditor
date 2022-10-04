
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

    scene_tree.active_scene.init      = null;
    scene_tree.active_scene.mainloop  = null;

    set_scene_pointers( EDIT_WINDOW,
            edit_window_init,
            edit_window_mainloop );
    set_scene_pointers( INFO_WINDOW,
            null,  
            sound_effect_info_window_mainloop );
    set_scene_pointers( SOUND_BANK_WINDOW,
            sound_bank_window_init,
            sound_bank_window_mainloop );
    set_scene_pointers( LOADER_WINDOW,
            null,
            loader_window_mainloop );
    set_scene_pointers( EDIT_LABEL_WINDOW,
            null,
            edit_label_window_mainloop );
}

void project_init( void ) {

    scene_tree_assign_pointers();

    // necessary one time inits
    for( int i=0; i<SCENES_COUNT; i++ )
        scene_tree.scene[ i ].init();

    // since active_scene pointers are initialized with null function
    // it works as main scene initial activation
    change_main_scene_to( SOUND_BANK_WINDOW );
    
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

