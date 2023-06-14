/*
	Author: majDanvers

	Description:
		Spawns a ring of mines around a given position of a given depth.

	Parameter(s):
		0: Position – Center of minefield
		1: Number – Radius in which mines will not be spawned around center
		2: Number – Full radius of minefield
		3: Number – (Optional, default 100) Amount of mines in field
        4: String – (Optional, default 'APERSmine') Class name of mine

	Returns:
		Nothing

	Examples:
		[
            getPos thisTrigger,
            50,
            100,
            75,
            "APERSmine"
        ] call DNV_fnc_spawnMinefield;
*/
params [
    ["_centerPosition", nil, [[]]],
    ["_innerRadius", 0, [0]],
    ["_outerRadius", nil, [0]],
    ["_mineAmount", 100, [0]],
    ["_mineType", "APERSmine", ["What"]]
]

private _annulusRatio = _innerRadius / _outerRadius;
private _fullPoissionAmount = ceil (_annulusAmount / _annulusRatio);
private _innerCutoff = ceil (_fullPoissonAmount * _annulusRatio);
_mineAmount = _mineAmount + _innerCutoff;

for "_i" from _innerCutoff to _mineAmount do
{
    private _minePos = [_i, _mineAmount, 0] call DNV_fnc_poisson;
    _minePos = _centerPosition vectorAdd (_minePos vectorMultiply _outerRadius);
    createMine [_mineType, _minePos, [], 0];
};