/*
*/
params [
	"_markerName",
	"_dist",
	"_side",
	"_groups"
];

private _avgPlayerPos = [0,0,0];
private _players = allPlayers;

{
	_avgPlayerPos vectorAdd (getPosASL _x);
} forEach _players;
_avgPlayerPos vectorMultiply (1 / (count _players));

private _spawnPos =  (getMarkerPos _markerName) vectorDiff _avgPlayerPos; // relative position from player group
_spawnPos = (vectorNormalized _spawnPos) vectorMultiply _dist; // scale to dist

private _blockerGroups = [];
{
	_blockerGroups pushBack [
		[_spawnPos # 0, _spawnPos # 1, 0],
		_side,
		_x
	] call BIS_fnc_spawnGroup;
	_x deleteGroupWhenEmpty true;
} forEach _groups;
_blockerGroups;