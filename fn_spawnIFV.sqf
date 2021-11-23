/*
	Author: majDanvers

	Description:
		Spawns a transport (or IFV) full of a given group that will unload at a
		given position, move to a second, and then rush opponents
		using LAMBS task.

	Parameter(s):
		0: SIDE of units
		1: Side or Group, cargo
		2: String – Vehicle type class name
		3: Position - where the vehicle spawns. n.b. it will spawn facing north
		4: Number - Direction
		5: Position - where it will unload.
		6: Crew group
		7: Position (Optional) - where the group will move to after unloading.
		8: Vehicle variant
		9: Optional, default starting position - Where the transport will return to
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
	"_cargoGroup",
	"_vehicle",
	"_startingPos",
	"_direction",
	"_unloadPos",
	["_crewGroup", nil],
	["_targetPos", _this # 5],
	["_variant", nil],
	["_returnPos", _this # 3]
];

if isNil {_crewGroup} then {_crewGroup = _side} else {
	_crewGroup = [
		_startingPos vectorAdd [10, 0, 0],
		_side,
		_crewGroup
	] call BIS_fnc_spawnGroup;
};
_spawnedVehicle = [
	_startingPos,
	_direction,
	_vehicle,
	_crewGroup
] call BIS_fnc_spawnVehicle;

if ! isNil {_variant} then {
	[
		_spawnedVehicle # 0,
		_variant
	] call BIS_fnc_initVehicle;
};

(_spawnedVehicle # 2) deleteGroupWhenEmpty true;

// {[_x, 'PBKAC_LOADOUT', 'pilot'] call tmf_assigngear_fnc_assignGear} forEach (units (_spawnedVehicle # 2));

// cargo time
_spawnedCargo = [
	_startingPos vectorAdd [0, 10, 0],
	_side,
	_cargoGroup
] call BIS_fnc_spawnGroup;
_spawnedCargo deleteGroupWhenEmpty true;

// [(units _spawnedCargo), pbkacRoles, 'PBKAC_LOADOUT'] call DNV_fnc_customGear;

{
	_x moveInCargo (_spawnedVehicle # 0);
} forEach (units _spawnedCargo);

// moving
_unloadWP = (_spawnedVehicle # 2) addWaypoint [
	_unloadPos,
	-1
];

_unloadWP setWaypointType "TR UNLOAD";
_unloadWP setWaypointBehaviour "CARELESS";

_unloadWP = (_spawnedVehicle # 2) addWaypoint [
	_returnPos,
	-1
];
_unloadWP setWaypointStatements [
	"true",
	"deleteVehicle vehicle this; {deleteVehicle _x} forEach (units (group this));"
];
_unloadWP setWaypointBehaviour "SAFE";

// cargo movers
[
	{
		_moveWP = (_this # 0) addWaypoint [
			_this # 1,
			0.5
		];
		_moveWP setWaypointStatements [
			"true",
			"[this, 1000] spawn lambs_wp_fnc_taskRush;"
		];
	},
	[_spawnedCargo, _targetPos],
	5
] call CBA_fnc_waitAndExecute;