
#include "macros.hpp"

WAIT_UNTIL_MISSION_STARTED();
waitUntil { IS_TRUE(OBJ_CONFIG_DONE) };
waitUntil { IS_TRUE(LIVE_SETS_READY) };

_drawObjective =
{
    params ["_name", "_obj"];
    [_obj] call f_fnc_drawObjectiveOnMap;
};

_objLookup = GET_LOOKUP_OBJECTIVES();
DICT_FOREACH(_objLookup,_drawObjective);
