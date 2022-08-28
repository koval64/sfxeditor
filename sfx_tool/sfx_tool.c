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
#include "info_window/scene.h"
#include "edit_window/scene.h"
#include "sounds_window/scene.h"

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

void set_scene_pointers(
    byte scene_id,
    void (*init) (void),
    void (*show) (void),
    void (*mainloop) (void),
    void (*hide) (void) )
{

    scene_tree.scene[scene_id].init     = init;
    scene_tree.scene[scene_id].show     = show;
    scene_tree.scene[scene_id].mainloop = mainloop;
    scene_tree.scene[scene_id].hide     = hide;

}

void scene_tree_assign_pointers(void) {

    scene_tree.active_scene.init      = null;
    scene_tree.active_scene.show      = null;
    scene_tree.active_scene.mainloop  = null;
    scene_tree.active_scene.hide      = null;

    set_scene_pointers( EDIT_WINDOW,
        edit_window_init, edit_window_show, edit_window_mainloop, null );

    set_scene_pointers( INFO_WINDOW,
        null, null, null, null );

    set_scene_pointers( SOUNDS_WINDOW,
        sounds_window_init, sounds_window_show, sounds_mainloop, null );

}

void project_init( void ) {

    scene_tree_assign_pointers();

    // necessary one time inits
    for( int i=0; i<SCENES_COUNT; i++ )
        scene_tree.scene[ i ].init();

    // since active_scene pointers are initialized with null function
    // it works as main scene initial activation
    change_scene_to( EDIT_WINDOW );
    
}

int main(void) {

    // global inits ( oscar )
    init();

    // project init
    project_init();

    for(;;) {
        scene_tree.active_scene.mainloop()
    }

    return 0;
}

