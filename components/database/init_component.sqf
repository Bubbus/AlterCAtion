#include "macros.hpp"

_persistedDb = [] call f_fnc_loadPersistedDatabase;

if (_persistedDb isEqualTo []) then
{
    _persistedDb = [] call f_fnc_buildNewDatabase;
    [_persistedDb] call f_fnc_savePersistedDatabase;
};

LIVE_SETS_READY = false;

_objectives = [_persistedDb] call f_fnc_getObjectivesLookupFromPersistedDb;
SET_LOOKUP_OBJECTIVES(_objectives);

_objStates = [_persistedDb] call f_fnc_getObjectiveStatesLookupFromPersistedDb;
SET_LOOKUP_OBJECTIVESTATES(_objStates);

LIVE_SETS_READY = true;
