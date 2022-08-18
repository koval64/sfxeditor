
#include "windows_data.h"
#include "menu_handling.c"
#include "inits.c"
#include "show.c"
#include "events.c"

void sounds_mainloop(void) {

    sounds_window_show();

    for(;;) {

        // process input events
        char done = sounds_process_keyboard_events();
        if(done)
            break;

        // Wait for one frame iteration
        vic_waitFrame();
    }

    change_scene_to( EDIT_WINDOW );

}

