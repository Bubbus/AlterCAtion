#include "macros.hpp"

if !(IS_TRUE(OBJ_CONFIG_DONE)) throw "Objective config has not been finalized.";
if !(EXISTS(OBJ_EXCLUDES)) throw "Objective exclusions not yet loaded.";

OBJ_EXCLUDES
