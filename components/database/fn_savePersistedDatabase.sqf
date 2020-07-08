
#include "macros.hpp"

params ["_persistedDb"];

profileNamespace setVariable [DATABASE_VAR, _persistedDb];

saveProfileNamespace;
