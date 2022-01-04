/*
 * Author: majDanvers
 * findAvgPos
 *        Find a rough central point for a given group or array of objects
 *
 * Arguments:
 * 0: Group performing action, either array <ARRAY> of objects or group <GROUP>
 * (default: allPlayers)
 *
 * Return Value:
 * <ARRAY> rough center of the group or objects
 *
 * Example:
 * [allPlayers] call DNV_fnc_findAvgPos;
 *
*/
params [
	["_units", {alive _x} select allPlayers, [grpNull, []]]
];

if (_units isEqualType grpNull) then {_units = units _units};
private _centerPos = [0,0,0];
{
	_centerPos = _centerPos vectorAdd (getPos _x);
} forEach _units;

//-- Divide sums by count of players
_centerPos vectorMultiply (1 / count _units); // vectorDivide is not a command