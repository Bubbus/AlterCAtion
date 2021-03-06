// CA respawn system with wave respawns

#include "macros.hpp"

params ["_unit", "_corpse"];

DEBUG_PRINT_LOG("[RespawnWaves] Player respawning...")

CLIENT_ONLY;
LOCAL_ONLY(_unit);

#include "..\parts\tryTeleport.sqf"
#include "..\parts\applyOldLoadout.sqf"




_doRespawn =
{
    params ["_unit", "_corpse", "_isJip"];
    [_unit, _corpse] spawn _applyOldLoadout;
    [false] call ace_spectator_fnc_setSpectator;

    if ((_isJip and IS_TRUE(f_var_JIPTeleport)) or ((!_isJip) and IS_TRUE(f_var_RespawnTeleport))) then
    {
        player setVariable ["f_var_mayTeleportToGroup", true, true];
    };

    #include "..\parts\zeusAdditions_onRespawn.sqf"

};




if (time < 30) exitWith
{
    DEBUG_PRINT_LOG("[RespawnWaves] Time < 30, skipping respawn wave...")
    [_unit, _corpse, false] call _doRespawn;
}; // Apply a grace period at mission start.




// MAKE SURE THE PLAYER INITIALIZES PROPERLY
WAIT_UNTIL_PLAYER_EXISTS();

_hasBeenKilled = missionNamespace getVariable ["f_var_playerHasBeenKilled", false];
f_var_playerHasBeenKilled = false;

DEBUG_FORMAT1_LOG("[RespawnWaves] Player has been killed?: %1",_hasBeenKilled)




// Join in progress and instant respawn handling
if (!_hasBeenKilled) exitWith
{
    DEBUG_PRINT_LOG("[RespawnWaves] Player was not killed, handling as JIP...")
    [_unit, _corpse, true] call _doRespawn;

};




if (_hasBeenKilled) then
{
    DEBUG_PRINT_LOG("[RespawnWaves] Player was killed, adding to respawn wave...")

    [_unit, false] call f_fnc_activatePlayer;

    _side = side _unit;
    _groupVar = toLower format ["f_group_spectators_%1", _side];
    _tempGroup = missionNamespace getVariable [_groupVar, grpNull];

    DEBUG_FORMAT1_LOG("[RespawnWaves] Joining player to spectator group: %1",_tempGroup)

    [_unit] joinSilent _tempGroup;

    [_unit, _corpse] spawn _applyOldLoadout;

    // Wait for respawn to happen
    _waveInfo = false;

    waitUntil
    {
        sleep 0.5;

        _waveInfo = GET_RESPAWN_WAVE(_side);

        if (_waveInfo isEqualTo []) exitWith {false};
        if (((count _waveInfo) > 0) and {(_waveInfo select 0) isEqualTo true}) exitWith { true };

		false

    };

    DEBUG_PRINT_LOG("[RespawnWaves] Respawn wave enabled, teleporting...")

    // Try spawning at designated location, or fallback to base location.
    _spawnAt = _waveInfo select 1;
    _joinGroup = _waveInfo select 2;

    if ((typeName _joinGroup isEqualTo typeName grpNull) and {!isNull _joinGroup}) then
    {
        DEBUG_FORMAT1_LOG("[RespawnWaves] Joining player to respawn group: %1",_joinGroup)
        [_unit] joinSilent _joinGroup;
    }
    else
    {
        DEBUG_PRINT_LOG("[RespawnWaves] Respawn group was absent, joining player to empty group.")
        [_unit] joinSilent grpNull;
    };

    if ((_spawnAt isEqualTo []) or {(typeName _spawnAt isEqualTo typeName objNull) and {isNull _spawnAt}}) then
    {
        DEBUG_PRINT_LOG("[RespawnWaves] Respawn wave did not include a position or entity, using respawn marker pos.")
        _spawnAt = RESPAWN_MARKER_POS(_side);
    };

    _tpHandle = [_spawnAt] spawn _tryTeleport;

    waitUntil { scriptDone _tpHandle };
    [_unit, true] call f_fnc_activatePlayer;
    [false] call ace_spectator_fnc_setSpectator;

    #include "..\parts\zeusAdditions_onRespawn.sqf"

    // [_unit] call f_fnc_paradropUnit;

    DEBUG_PRINT_LOG("[RespawnWaves] All done.")

}
