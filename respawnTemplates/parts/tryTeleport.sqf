_tryTeleport =
{
    params ["_goto"];

    _onTeleportFailure =
    {
        DEBUG_FORMAT1_LOG("[RespawnWaves] Failed to teleport to location, defaulting to location of %1.",RESPAWN_MARKER_POS((side player)))
        _basePos = RESPAWN_MARKER_POS((side player));
        [player, _basePos] spawn f_fnc_teleportPlayer;
    };

    DEBUG_FORMAT1_LOG("[RespawnWaves] Attempting to teleport to %1.",_goto)
    _teleHandle = [player, _goto, _onTeleportFailure] spawn f_fnc_teleportPlayer;

    waitUntil { sleep 0.1; scriptDone _teleHandle };

};
