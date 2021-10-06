/*
	array of possible spawn points (triggers),
	array of group(s) that can spawn there,
	radius of hunt waypoints ?
	how often to spawn patrols
*/
params [
	"_spawns",
	"_posGroups",
	"_huntDist",
	"_patrolRate"
];
while { true } do {
	// max two patrols per spawn
	private _i = 0;
	while {(independent countSide allUnits) < 64 && _i < 2} do {
		private _trg = selectRandom _spawns;
		private _nuGroup = [
			getPosASL _trg, 
			independent, 
			selectRandom _posGroups
		] call BIS_fnc_spawnGroup;
		_i = _i + 1;
		[_nuGroup, _huntDist, 29] spawn lambs_wp_fnc_taskHunt;
	};
	
	sleep _patrolRate;
};
