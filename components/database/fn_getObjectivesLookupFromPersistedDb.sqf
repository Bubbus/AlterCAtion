
#include "macros.hpp"

params ["_persistedDb"];

_objsArray = _persistedDb select DB_INDEX_OBJECTIVES;

DICT_FROM_ARRAY_KEYED(_lookup,_objsArray,OBJ_IDX_NAME);

_lookup
