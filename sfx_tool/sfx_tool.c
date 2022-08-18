// OSCAR INCLUDES
#include <c64/memmap.h>
#include <c64/cia.h>
#include <c64/vic.h>
#include <c64/joystick.h>
#include <c64/keyboard.h>
#include <audio/sidfx.h>
#include <stdlib.h>

// PROJECT INCLUDES
#include "common/assets.h"
#include "common/utils.c"
#include "common/view_utils.c"
#include "common/scene_utils.c"
#include "common/inits.c"
#include "info_window/main.h"
#include "edit_window/main.h"
#include "sounds_window/main.c"

// maybe create struct VAULT ???

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

void scene_tree_init(void) {

    scene_tree.active_scene.init      = null;
    scene_tree.active_scene.show      = null;
    scene_tree.active_scene.mainloop  = null;
    scene_tree.active_scene.hide      = null;

    scene_tree.scene[EDIT_WINDOW].init     = null;
    scene_tree.scene[EDIT_WINDOW].show     = edit_window_show;
    scene_tree.scene[EDIT_WINDOW].mainloop = edit_window_mainloop;
    scene_tree.scene[EDIT_WINDOW].hide     = null;

    scene_tree.scene[SOUNDS_WINDOW].init     = null;
    scene_tree.scene[SOUNDS_WINDOW].show     = sounds_window_show;
    scene_tree.scene[SOUNDS_WINDOW].mainloop = sounds_mainloop;
    scene_tree.scene[SOUNDS_WINDOW].hide     = null;

    // necessary one time inits
    edit_window_init();

    // since active_scene pointers are initialized with null function
    // it work as initial activation
    // main scene
    change_scene_to( EDIT_WINDOW );
    
}

void project_init( void ) {
    scene_tree_init();
    sound_bank_init();
}

int main(void) {

    // global inits
    init();

    // project init
    project_init();

    for(;;) {
        scene_tree.active_scene.mainloop()
    }

    return 0;
}

