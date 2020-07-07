#include "macros.hpp"

if !(IS_TRUE(OBJ_CONFIG_DONE)) throw "Objective config has not been finalized.";
if !(EXISTS(OBJ_STATE_EDITS)) throw "Objective state edits not yet loaded.";

OBJ_STATE_EDITS
