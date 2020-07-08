
#include "macros.hpp"

params ["_objective"];

_name = _objective select OBJ_IDX_NAME;
_dims = _objective select OBJ_IDX_DIMENSIONS;
_pos = _objective select OBJ_IDX_POSITION;

_state = [_name] call f_fnc_liveSet_getObjectiveState;
_owner = _state select OBJSTATE_IDX_OWNER;

_ellipseArea = pi * (_dims select 0) * (_dims select 1);
_radius = sqrt (_ellipseArea / pi);

_colour = switch (_owner) do
{
    case (OWNER_OPFOR): {"ColorEAST"};
    case (OWNER_BLUFOR): {"ColorWEST"};
    case (OWNER_CIVILIAN): {"ColorCivilian"};
    case (OWNER_NONE): {"ColorGrey"};
    case (OWNER_UNDEFINED): {"ColorBlack"};
};


_marker = createMarker [OBJECTIVE_MARKER(_name), _pos];
_marker setMarkerShape "ELLIPSE";
_marker setMarkerBrush "SolidBorder";
_marker setMarkerSize [_radius, _radius];
_marker setMarkerColor _colour;
