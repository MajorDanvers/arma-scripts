/*
	Author: majDanvers

	Description:
		Spawns a transport (or IFV) full of a given group that will unload at a
		given position, move to a second, and then rush opponents
		using LAMBS task.

	Parameter(s):
		0: SIDE of units
		1: Side or Group, crew
		2: CargoGroup
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
	"_cargoGroup",
	"_vehicle",
	"_startingPos",
	"_direction",
	"_unloadPos",
	["_sideOrGroup", nil],
	["_targetPos", _this # 4],
	["_unloadType", "GETOUT"]  // for IFVs: UNLOAD
];
if isNil {_sideOrGroup} then {_sideOrGroup = _side};
private _crewed = [_startingPos, _direction, _vehicle, _sideOrGroup] call BIS_fnc_spawnVehicle;
private _cargo = [_startingPos vectorAdd [10, 0, 0], _side, _cargoGroup] call BIS_fnc_spawnGroup;