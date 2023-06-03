/*
    Utility function for waypoint statements in spawnIFV
*/

if (!isServer) exitWith {};

private _group = _this getVariable ["DNV_groupToSpawn", nil];
private _target = _this getVariable ["DNV_rushTarget", nil];
private _size = -0.5 * (sizeOf typeOf _this) - 1;

private _spawnedCargo = [
    (getPos _this) vectorAdd ((vectorDir _this) vectorMultiply _size),
    side _this,
    _group
] call BIS_fnc_spawnGroup;
_spawnedCargo deleteGroupWhenEmpty true;

[
    {
        _moveWP = (_this # 0) addWaypoint [
            _this # 1,
            -1
        ];
        _moveWP setWaypointStatements [
            'true',
            '[this] spawn lambs_wp_fnc_taskReset; [this, 1000] spawn lambs_wp_fnc_taskRush;'
        ];
    },
    [_spawnedCargo, _target],
    5
] call CBA_fnc_waitAndExecute;