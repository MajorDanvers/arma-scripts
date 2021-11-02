/*
	Author: majDanvers

	Description:
		Spawns a transport (or IFV) full of a given group that will unload at a
		given position, move to a second, and then rush opponents
		using LAMBS task.

	Parameter(s):
		0: SIDE of units
		1: Units to spawn - One of:
			Array - list of character types
			Number - amount of characters to spawn
			Config - CfgGroups entry
		2: String – Vehicle type class name
		3: Position - where the vehicle spawns. n.b. it will spawn facing north
		4: Number - Direction // TODO
		4: Position - where it will unload.
		5: Position (Optional) - where the group will move to after unloading.
		6: String (Optional) (WAYPOINT TYPE) - can use "UNLOAD" here to keep
			crew in the vehicle (for IFVs et. al)
			Or "MOVE" if you want to spawn a tank with this function, I guess
	Returns:
		Array – [Vehicle, Group]

	Example:
		[
			west,
			[
				"B_Soldier_TL_F", 
				"B_Soldier_F", 
				"B_Soldier_F", 
				"B_Soldier_F"
			],
			"B_LSV_01_unarmed_F", 
			[2000,7000,0], 
			[3000,8000,0], 
			[3000,8100,0] 
		] spawn DNV_fnc_spawnTransport; 
*/
params [
	"_side",
	"_group",
	"_vehicle",
	"_startingPos",
	"_unloadPos",
	["_targetPos", _this # 4],
	["_unloadType", "GETOUT"]  // for IFVs: UNLOAD
];
private _veh = _vehicle createVehicle _startingPos;
private _grp = [_startingPos, _side, _group] call BIS_fnc_spawnGroup;
{_x moveInAny _veh} forEach (units _grp);
private _wp = _grp addWaypoint [_unloadPos, 1];
_wp setWaypointType _unloadType;
_wp setWaypointBehaviour "CARELESS";
if (_unloadType == "GETOUT") then {
	// attempt to prevent get-in get-out FSM loops
	_wp setWaypointStatements ["true", "this leaveVehicle assignedVehicle (leader this);"];
};

_wp = _grp addWaypoint [_targetPos, 1];
_wp setWaypointBehaviour "AWARE";
_wp setWaypointStatements ["true", "[this, 500, 29] spawn lambs_wp_fnc_taskRush;"];
[_veh, _grp];