
#include "macros.hpp"

params ["_objName"];

if !(IS_TRUE(LIVE_SETS_READY)) throw "Live sets are not yet ready to use.";

_objLookup = GET_LOOKUP_OBJECTIVES();
_result = DICT_GET(_objLookup,_objName);

_result
