#include "macros.hpp"

if !(IS_TRUE(OBJ_CONFIG_DONE)) throw "Objective config has not been finalized.";
if !(EXISTS(OBJ_EDITS)) throw "Objective edits not yet loaded.";

OBJ_EDITS
