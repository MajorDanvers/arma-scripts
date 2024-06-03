/*
	Author: majDanvers

	Description:
		Spawns a transport full of a given group that will unload at a
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
		Array – [Vehicle, Crew, Cargo]

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
	"_crewGroup",
	["_targetPos", _this # 5],
	["_variant", nil],
	["_returnPos", _this # 3],
	["_rushRadius", 1000]
];

_crewGroup = [
	_startingPos vectorAdd [10, 0, 0],
	_side,
	_crewGroup
] call BIS_fnc_spawnGroup;
_spawnedVehicle = createVehicle [_vehicle, _startingPos];
_spawnedVehicle setDir _direction;
{_x moveInAny _spawnedVehicle} forEach units _crewGroup;

if ! isNil {_variant} then {
	[
		_spawnedVehicle,
		_variant
	] call BIS_fnc_initVehicle;
};

clearItemCargoGlobal _spawnedVehicle;
clearMagazineCargoGlobal _spawnedVehicle;
clearWeaponCargoGlobal _spawnedVehicle;
clearBackpackCargoGlobal _spawnedVehicle;

_crewGroup deleteGroupWhenEmpty true;

// cargo time
_spawnedCargo = [
	_startingPos vectorAdd [0, 10, 0],
	_side,
	_cargoGroup
] call BIS_fnc_spawnGroup;
_spawnedCargo deleteGroupWhenEmpty true;

{
	_x moveInAny _spawnedVehicle;
} forEach (units _spawnedCargo);

// moving
_unloadWP = _crewGroup addWaypoint [
	_unloadPos,
	0	
];

_unloadWP setWaypointType "TR UNLOAD";
_unloadWP setWaypointBehaviour "CARELESS";

_unloadWP = _crewGroup addWaypoint [
	_returnPos,
	0	
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
			-1
		];
		_moveWP setWaypointStatements [
			"true",
			format ["[this] spawn lambs_wp_fnc_taskReset; [this, %1] call lambs_wp_fnc_taskRush;", _this # 2]
		];
	},
	[_spawnedCargo, _targetPos, _rushradius],
	1
] call CBA_fnc_waitAndExecute;

[_spawnedVehicle, _crewGroup, _spawnedCargo];
