
#include "macros.hpp"

params ["_persistedDb"];

_statesArray = _persistedDb select DB_INDEX_OBJECTIVE_STATES;

DICT_FROM_ARRAY_KEYED(_lookup,_statesArray,OBJSTATE_IDX_OBJNAME);

_lookup
