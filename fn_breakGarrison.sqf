/*
    breaks out of lambs garrison and hunts enemies
*/
params [
    '_groups',
    ['_objectives', objNull]
];
if isNil {_groups} exitWith {};
{ 
    if (isNil {_x}) then {continue};
    _x = [_x] call lambs_wp_fnc_taskReset; 
    private _whichObj =  [];
    private _areaCamp = [];
    if !isNil {_objectives} then {
        _whichObj = selectRandom _objectives; 
        _areaCamp = [100, 100, 0, true, -1];
    };
    private _cycle = selectRandom [23, 29, 31, 37, 41]; 
    [_x, 500, _cycle, _areaCamp, _whichObj, true, true, 0] spawn lambs_wp_fnc_taskHunt; 
} forEach _groups;