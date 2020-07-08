
#define DATABASE_VERSION "dev"
#define DATABASE_VAR (format ["f_db_%1", worldName])

#define GET_DATABASE() (profileNamespace getVariable [DATABASE_VAR, []])
#define DATABASE_EXISTS() (!(GET_DATABASE() isEqualTo []))

#define DB_INDEX_VERSION 0
#define DB_INDEX_OBJECTIVES 1
#define DB_INDEX_OBJECTIVE_STATES 2

#define LIVE_SETS_READY G_VAR(db_livesets_done)

#define GET_LOOKUP_OBJECTIVES()      missionNamespace getVariable [(DATABASE_VAR + "_objectives"), []]
#define GET_LOOKUP_OBJECTIVESTATES() missionNamespace getVariable [(DATABASE_VAR + "_objectiveStates"), []]

#define SET_LOOKUP_OBJECTIVES(LOOKUP)      missionNamespace setVariable [(DATABASE_VAR + "_objectives"), LOOKUP]
#define SET_LOOKUP_OBJECTIVESTATES(LOOKUP) missionNamespace setVariable [(DATABASE_VAR + "_objectiveStates"), LOOKUP]
