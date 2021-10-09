/*
	group to spawn (2 of),
	vector to offset by,
	radius of hunt waypoints ?
	how often to spawn patrols
*/
params [
	"_side",
	"_group",
	"_offset",
	"_spawnRate"
];
while { true } do {
	_players = allPlayers; // idk if race conditions happen but w/e
	private _centerPos = [0,0,0];
	{
		_centerPos = _centerPos vectorAdd (getPos _x);
	} forEach _players;

	//-- Divide sums by count of players
	_centerPos = _centerPos vectorMultiply (1 / count _players); // vectorDivide is not a command
	
	private _spawnPos = _centerPos vectorAdd _offset;
	
	for "_i" from 1 to 2 do {
		_nuG = [
			[_spawnPos # 0, _spawnPos # 1, 0],
			_side,
			_group
		] call BIS_fnc_spawnGroup;
		_nuG deleteGroupWhenEmpty true;
		[_nuG, ((vectorMagnitude _offset) + 50), 17] spawn lambs_wp_fnc_taskRush;
	};
	sleep _spawnRate;
};
