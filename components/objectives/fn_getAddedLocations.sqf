#include "macros.hpp"

if !(IS_TRUE(OBJ_CONFIG_DONE)) throw "Objective config has not been finalized.";
if !(EXISTS(OBJ_ADDITIONS)) throw "Objective additions not yet loaded.";

OBJ_ADDITIONS
