
#include "macros.hpp"

WAIT_UNTIL_MISSION_STARTED();
waitUntil { IS_TRUE(OBJ_CONFIG_DONE) };

// 2020-07-08 TODO :: Retrieve objectives from active data store.
_allObjectives = [] call f_fnc_getAllObjectives;

{
    [_x] call f_fnc_drawObjectiveOnMap;

} forEach _allObjectives;
