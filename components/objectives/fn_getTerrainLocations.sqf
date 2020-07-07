// Get all locations on the map, based upon the approach in HaM.
// Outputs in format [[name, type, display name, center location, [dimensions]], ...]

#include "macros.hpp"

params [["_objTypes", ["NameVillage", "NameCity", "NameCityCapital", "NameLocal", "Airport", "Strategic"], []]];

_locations = configFile >> "CfgWorlds" >> worldName >> "Names";

_objLocations = [];

for "_i" from 0 to (count _locations - 1) do
{
	_x = _locations select _i;

	if ((getText (_x >> "type")) in _objTypes) then
	{
		_objLocations pushBack _x;
	};

};


_objectives = [];

{
	_radiusX = getNumber (_x >> "RadiusA");
	_radiusY = getNumber (_x >> "RadiusB");

	_dims = [_radiusX, _radiusY];
	_pos = getArray (_x >> "position");
	_displayName = getText (_x >> "name");
	_type = getText (_x >> "type");
	_name = configName _x;

	_objectives pushBack [_name, _type, _displayName, _pos, _dims];

} forEach _objLocations;


_objectives
