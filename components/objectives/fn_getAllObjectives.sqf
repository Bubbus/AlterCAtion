#include "macros.hpp"

_locations = [] call f_fnc_getTerrainLocations;
_excludes = [] call f_fnc_getExcludedLocations;
_additions = [] call f_fnc_getAddedLocations;
_edits = [] call f_fnc_getEditedLocations;

DICT_FROM_ARRAY(_excludesSet,_excludes);
DICT_FROM_ARRAY_KEYED(_editsDict,_edits,0);

_locationsProcessed = [];

{
    _name = _x select 0;

    if !(DICT_CONTAINS(_excludesSet,_name)) then
    {
        _edit = DICT_GET(_editsDict,_name);

        if !(_edit isEqualTo []) then
        {
            _x = [_x,_edit] call f_fnc_applyLocationEdits;
        };

        _locationsProcessed pushBack _x;

    };

} forEach _locations;


{
    _locationsProcessed pushBack _x;

} forEach _additions;


DICT_DELETE(_excludesSet);
DICT_DELETE(_editsDict);


_locationsProcessed
