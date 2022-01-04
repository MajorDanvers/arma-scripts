// spawn tank
params [
    "_side",
    "_vehicleType",
    "_spawnPos",
    "_direction",
    "_movePosArr",
    ["_disposition", "SAFE"],
    ["_variant", nil]
];

private _spawnedTank = [_spawnPos, _direction, _vehicleType, _side] call BIS_fnc_spawnVehicle;

private _veh = _spawnedTank # 0;
private _grp = _spawnedTank # 2;

if !(isNil {_variant;}) then {
    [
        _veh,
        _variant, 
        true
    ] call BIS_fnc_initVehicle;
};

_veh allowCrewInImmobile true;
_grp setBehaviour _disposition;

{
    _grp addWaypoint [_x, -1];
} forEach _movePosArr;
_spawnedTank;