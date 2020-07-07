
#include "macros.hpp"

_newDatabase = [];
_newDatabase set [DB_INDEX_VERSION,DATABASE_VERSION];

_objectives = [] call f_fnc_getAllObjectives;
_newDatabase set [DB_INDEX_OBJECTIVES,_objectives];

_objectiveStates = [_objectives] call f_fnc_buildFreshObjectiveStates;
_newDatabase set [DB_INDEX_OBJECTIVE_STATES,_objectiveStates];


_newDatabase
