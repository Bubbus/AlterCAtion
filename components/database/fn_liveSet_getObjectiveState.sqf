
#include "macros.hpp"

params ["_objName"];

if !(IS_TRUE(LIVE_SETS_READY)) throw "Live sets are not yet ready to use.";

_stateLookup = GET_LOOKUP_OBJECTIVESTATES();
_result = DICT_GET(_stateLookup,_objName);

_result
