#include "macros.hpp"

params ["_objectives"];

_edits = [] call f_fnc_getEditedObjectiveStates;
DICT_FROM_ARRAY_KEYED(_editsDict,_edits,0);

_results = [];

{
    _name = _x select OBJ_IDX_NAME;
    _type = _x select OBJ_IDX_TYPE;

    _state = NEW_OBJECTIVE_STATE(_name);
    SET_OBJECTIVE_STATUS(_state,STATUS_NORMAL);

    switch (_type) do
    {
        case ("Strategic"):
        {
            SET_OBJECTIVE_OWNER(_state,OWNER_OPFOR);
        };

        default
        {
            SET_OBJECTIVE_OWNER(_state,OWNER_CIVILIAN);
        };

    };

    _edit = DICT_GET(_editsDict,_name);

    if !(_edit isEqualTo []) then
    {
        _state = [_state,_edit] call f_fnc_applyObjectiveStateEdits;
    };

    _results pushBack _state;

} forEach _objectives;

DICT_DELETE(_editsDict);


_results
