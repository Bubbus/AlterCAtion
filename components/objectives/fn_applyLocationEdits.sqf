#include "macros.hpp"

params ["_baseEntry", "_edit"];

_result = NEW_LOCATION();
_defaults = NEW_LOCATION();

{
    if (_x isEqualTo (_defaults select _forEachIndex)) then
    {
        _result set [_forEachIndex, (_baseEntry select _forEachIndex)];
    }
    else
    {
        _result set [_forEachIndex, _x];
    };

} forEach _edit;


_result
