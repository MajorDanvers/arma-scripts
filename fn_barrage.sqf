params [
    ["_CENTER_MASS", []],
    ["_ARTY_TYPE", "CUP_B_RM70_CZ"],
    ["_SPAWN", [0, 0, 0]],
    ["_PRECISION", 1],
    ["_DELAY", 1],
    ["_LABEL", "RANDOM"]
];

private _flarePos = _CENTER_MASS vectorAdd [0, 0, 220];
private _flare = createVehicle ["CUP_F_40mm_Star_Red", _flarePos, [], 0, "none"];

_flare setVelocity [wind select 0, wind select 1, 30];

private _arty1 = _ARTY_TYPE createVehicle _SPAWN;
private _arty2 = _ARTY_TYPE createVehicle (_SPAWN vectorAdd [10, 0, 0]);
private _arty3 = _ARTY_TYPE createVehicle (_SPAWN vectorAdd [-10, 0, 0]);

private _setDir = vectorNormalized (_CENTER_MASS vectorDiff _SPAWN);

{_x setVectorDir _setDir} forEach [_arty1, _arty2, _arty3];

{
    private _gunners = [
        (_SPAWN vectorAdd [0, 10, 0]),
        east,
        3
    ] call BIS_fnc_spawnGroup;
    (units _gunners) # 0 moveInAny _x;
    (units _gunners) # 1 moveInAny _x;
    (units _gunners) # 2 moveInAny _x;
} forEach [_arty1, _arty2, _arty3];

{
    [
        {
            params ["_shot", "_delay"];
            [_shot # 1, _shot # 0, "", 50, 12, [10 * _delay, 12 * _delay]] spawn BIS_fnc_fireSupport;
        },
        [_x, _DELAY],
        20
    ] call CBA_fnc_waitAndExecute;
} forEach [
    [_CENTER_MASS vectorAdd ([random [0, 25 * _PRECISION, 50 * _PRECISION], random 120,0] call CBA_fnc_polar2vect), _arty1],
    [_CENTER_MASS vectorAdd ([random [0, 25 * _PRECISION, 50 * _PRECISION], 120 + random 120,0] call CBA_fnc_polar2vect), _arty2],
    [_CENTER_MASS vectorAdd ([random [0, 25 * _PRECISION, 50 * _PRECISION], 240 + random 120,0] call CBA_fnc_polar2vect), _arty3]
];

if (_LABEL isEqualTo "RANDOM") then {
    _LABEL = format ["marker_%1", random 2048];
};

[
    {
        params ["_a1", "_a2", "_a3", "_marker"];
        {_a1 deleteVehicleCrew _x} forEach crew _a1;
        {_a2 deleteVehicleCrew _x} forEach crew _a2;
        {_a3 deleteVehicleCrew _x} forEach crew _a3;
        {deleteVehicle _x} forEach [_a1, _a2, _a3];
        deleteMarker _marker;
    },
    [_arty1, _arty2, _arty3, _LABEL],
    150
] call CBA_fnc_waitAndExecute;

[_LABEL, _CENTER_MASS, "ELLIPSE", [100, 100], "GLOBAL", "COLOR:", "ColorRed", "BRUSH:", "DiagGrid"] call CBA_fnc_createMarker;