
#include "macros.hpp"

params ["_objective"];

// 2020-07-08 TODO :: Pull state from active data store.
_state = NEW_OBJECTIVE_STATE((_objective select 0));

_name = _objective select OBJ_IDX_NAME;
_dims = _objective select OBJ_IDX_DIMENSIONS;
_pos = _objective select OBJ_IDX_POSITION;

_ellipseArea = pi * (_dims select 0) * (_dims select 1);
_radius = sqrt (_ellipseArea / pi);

_marker = createMarker [format ["ObjMarker_%1", _name], _pos];
_marker setMarkerShape "ELLIPSE";
_marker setMarkerBrush "SolidBorder";
_marker setMarkerSize [_radius, _radius];

// 2020-07-08 TODO :: Ensure marker can be looked up.
