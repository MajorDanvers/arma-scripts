/*
	Author: majDanvers

	Description:
		Takes in an array of triggers and spawns a garrison in their areas
		using BIS_fnc_spawnGroup & LAMBS Garrison waypoint.

	Parameter(s):
		0: Trigger object
		1: Side – Group's side
		2: One of:
			Array - list of character types
			Number - amount of characters to spawn
			Config - CfgGroups entry
		3: (Optional, default -1) Number – Exit condition(s) that breaks a 
				Unit free (-2 Random, -1 All, 0 Hit, 1 Fired, 2 FiredNear)
		4: (Optional, default 100) Number – Range of tracking
		5: (Optional, default true) Boolean - Teleport to positions
		6: Position – Position to spawn group
		7: Bool - Whether to spawn a patrol
	Returns:
		Groups

	Example:
		_grps = [
			[garrisonArea1, garrisonArea2, garrisonArea3],
			east,
			14
		] call DNV_fnc_spawnGarrison;
*/
params [
	"_trigger",
	"_side",  
	"_garrisonGroup",
	["_freeType", -1],
	["_range", 100],
	["_teleport", true],
	["_spawnPos", nil],
	["_patrol", false]
];

private _retGroup = grpNull;
private _trgPos = getPos _trigger;

if (isNil "_spawnPos") then {
	_spawnPos = getPos _trigger;
};
private _retGroup = [	
	_spawnPos, 
	_side, 
	_garrisonGroup
] call BIS_fnc_spawnGroup;
[
	_retGroup, 
	_trgPos, 
	_range,
	triggerArea _trigger, 
	_teleport, 
	false, 
	_freeType, 
	_patrol
] call lambs_wp_fnc_taskGarrison;
_retGroup deleteGroupWhenEmpty true;
deleteVehicle _trigger;

_retGroup;