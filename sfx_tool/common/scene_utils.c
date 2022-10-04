
struct SCENE {
    void (*init) (void);
    void (*mainloop) (void);
};

struct SCENE_TREE {
    byte active_scene_id;
    struct SCENE scene[ SCENES_COUNT ];
    struct SCENE active_scene;
};

extern struct SCENE_TREE scene_tree;

void set_scene_pointers( byte scene_id, void (*init) (void), void (*mainloop) (void) ) {

    scene_tree.scene[scene_id].init     = init;
    scene_tree.scene[scene_id].mainloop = mainloop;
}

// new scene SCENE_ID is run after exitting current one
void change_main_scene_to( byte SCENE_ID ) {

    scene_tree.active_scene.init      = scene_tree.scene[ SCENE_ID ].init;
    scene_tree.active_scene.mainloop  = scene_tree.scene[ SCENE_ID ].mainloop;

    scene_tree.active_scene_id = SCENE_ID;

}

// immediately run as subscene ( child )
void run_as_child( byte SCENE_ID ) {

    scene_tree.scene[ SCENE_ID ].mainloop();

}







