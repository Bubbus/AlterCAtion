#include "macros.hpp"

[] spawn
{
	waitUntil
	{
		sleep 1;
		_display = (uiNamespace getVariable "RscDiary");
		!( (isNull _display) or {isNull (_display displayCtrl 51)} )
	};


	if (isNil 'f_var_squadMarkersDrawHandlerId_RscDiary') then
	{
		DEBUG_PRINT_LOG("[SquadMarkers] Creating handler.")

		f_var_squadMarkersDrawHandlerId_RscDiary = ((uiNamespace getVariable "RscDiary") displayCtrl 51) ctrlAddEventHandler
		[
			"Draw",
			"_this call f_fnc_drawSquadMarkers"
		];

	};

};


[] spawn
{
	waitUntil
	{
		sleep 1;
		_display = (uiNamespace getVariable "RscCustomInfoMiniMap");
		!( (isNull _display) or {isNull (_display displayCtrl 101)} )
	};


	if (isNil 'f_var_squadMarkersDrawHandlerId_RscCustomInfoMiniMap') then
	{
		DEBUG_PRINT_LOG("[SquadMarkers] Creating handler.")

		f_var_squadMarkersDrawHandlerId_RscCustomInfoMiniMap = ((uiNamespace getVariable "RscCustomInfoMiniMap") displayCtrl 101) ctrlAddEventHandler
		[
			"Draw",
			"_this call f_fnc_drawSquadMarkers"
		];

	};

};
