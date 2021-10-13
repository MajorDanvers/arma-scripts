/*
	Author: majDanvers

	Description:
		Takes in an array of triggers and spawns a garrison in their areas
		using BIS_fnc_spawnGroup & LAMBS Garrison waypoint.

	Parameter(s):
		0: ARRAY of trigger objects
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
	Returns:
		Groups

	Example:
		[
			[garrisonArea1, garrisonArea2, garrisonArea3],
			east,
			14
		] call DNV_fnc_spawnGarrison;
*/
params [
	"_triggers",
	"_side",  
	"_garrisonGroup",
	["_freeType", -1],
	["_range", 100],
	["_teleport", true],
	["_spawnPos", nil]
];
private _retGroups = [];
{
	private _trgPos = getPos _x;
	if (isNil "_spawnPos") then {
		_spawnPos = getPos _x;
	};
	private _nuGroup = [	
		_spawnPos, 
		_side, 
		_garrisonGroup
	] call BIS_fnc_spawnGroup;
	_retGroups pushBack _nuGroup;
	[
		_nuGroup, 
		_trgPos, 
		_range,
		triggerArea _x, 
		_teleport, 
		false, 
		_freeType, 
		true
	] call lambs_wp_fnc_taskGarrison;
	_nuGroup deleteGroupWhenEmpty true;
	deleteVehicle _x;
} forEach _triggers;

_retGroups;