/*
    Creates a random group using given values & weights
    returns: array
*/

params [
    "_commanderType",
    "_groupSize",
    "_valuesAndWeights"
];

private _toSpawn = [_commanderType];
for "_i" from 2 to (_groupSize) do {
    _toSpawn pushBack (selectRandomWeighted _valuesAndWeights);
};
_toSpawn;