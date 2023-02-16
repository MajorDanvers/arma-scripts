/*
	Author: majDanvers

	Description:
		Spawns an IFV full of a given group that will unload at a
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
	["_targetPos", nil],
	["_variant", nil]
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

if isNil {_targetPos} then {
	_targetPos = _this # 5;
};

_crewGroup deleteGroupWhenEmpty true;

// moving
_unloadWP = _crewGroup addWaypoint [
	_unloadPos,
	-1
];

if (isNil DNV_fnc_spawnBehind) then {
    DNV_fnc_spawnBehind = {
        if (!isServer) exitWith {};

        private _group = _this getVariable ["DNV_groupToSpawn", nil];
        private _target = _this getVariable ["DNV_rushTarget", nil];
        
        private _spawnedCargo = [
            (getPos (vehicle this)) vectorAdd ((vectorDir (vehicle this)) vectorMultiply -1),
            side this,
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
    };
};

_unloadWP setWaypointBehaviour "CARELESS";
_unloadWP setWaypointStatements [
	"true",
	"(vehicle this) call DNV_fnc_spawnBehind;"
];

_unloadWP = _crewGroup addWaypoint [
	_targetPos,
	-1
];
_unloadWP setWaypointStatements [
	"true",
	"[this] spawn lambs_wp_fnc_taskReset; [this, 1000] spawn lambs_wp_fnc_taskRush;"
];
_unloadWP setWaypointBehaviour "SAFE";

[_spawnedVehicle, _crewGroup];