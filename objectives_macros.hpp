
#define OBJECTIVES_CACHE G_ARR(objectives)

#define OBJ_EXCLUDES    G_ARR(objectives_excludes)
#define OBJ_ADDITIONS   G_ARR(objectives_additions)
#define OBJ_EDITS       G_ARR(objectives_edits)

#define BEGIN_OBJECTIVES\
    OBJ_EXCLUDES = [];\
    OBJ_ADDITIONS = [];\
    OBJ_EDITS = []

#define OBJ_CONFIG_DONE G_VAR(objectives_config_done)
#define FINALIZE_OBJECTIVES OBJ_CONFIG_DONE = true

#define NEW_LOCATION() ["","",[],[]]
#define CREATE_LOCATION(NAME) [NAME,"",[],[]]

#define SET_LOCATION_NAME(ENTRY,NAME)            ENTRY set [0, NAME]
#define SET_LOCATION_POSITION(ENTRY,POS_X,POS_Y) ENTRY set [2, [POS_X, POS_Y]]
#define SET_LOCATION_TYPE(ENTRY,TYPE)            ENTRY set [1, TYPE]
#define SET_LOCATION_RADIUS(ENTRY,RADIUS)        ENTRY set [3, [RADIUS, RADIUS]]

#define EXCLUDE_LOCATION(NAME)  OBJ_EXCLUDES pushBack NAME
#define ADD_LOCATION(ENTRY)     OBJ_ADDITIONS pushBack ENTRY
#define EDIT_LOCATION(ENTRY)    OBJ_EDITS pushBack ENTRY
