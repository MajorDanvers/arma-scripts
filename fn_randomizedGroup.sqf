/*
    Spawns a random group using given values & weights
    returns: group
*/

params [
    "_commanderType",
    "_groupSize",
    "_valuesAndWeights",
    "_position",
    "_side"
];

private _toSpawn = [_commanderType];
for "_i" from 2 to (_groupSize) do {
    _toSpawn pushBack (selectRandomWeighted _valuesAndWeights);
};
[
    _position,
    _side,
    _toSpawn
] call BIS_fnc_spawnGroup;