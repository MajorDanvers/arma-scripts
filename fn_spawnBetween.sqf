/*
*/
params [
	"_markerName",
	"_dist",
	"_side",
	"_groups"
];

_players = allPlayers; // idk if race conditions happen but w/e
private _centerPos = [0,0,0];
{
	_centerPos = _centerPos vectorAdd (getPos _x);
} forEach _players;

//-- Divide sums by count of players
_centerPos = _centerPos vectorMultiply (1 / count _players); // vectorDivide is not a command

private _spawnPos =  (getMarkerPos _markerName) vectorDiff _centerPos; // relative position from player group
_spawnPos = (vectorNormalized _spawnPos) vectorMultiply _dist; // scale to dist
_spawnPos = _centerPos vectorAdd _spawnPos; // add to centerPos

private _blockerGroups = [];
{
	_blockerGroups pushBack ([
		_spawnPos,
		_side,
		_x
	] call BIS_fnc_spawnGroup);
} forEach _groups;
{
	_x deleteGroupWhenEmpty true;
	_x addWaypoint [_centerPos, 25];
} forEach _blockerGroups;
_blockerGroups;