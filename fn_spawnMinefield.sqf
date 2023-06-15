/*
	Author: majDanvers

	Description:
		Spawns a ring of mines around a given position of a given depth.
        Requires DNV_fnc_poisson.

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
    ["_mineType", "APERSmine", [""]]
];

_innerRadius = _innerRadius / _outerRadius;
private _fullPoissonAmount = ceil (_mineAmount / (1 - _innerRadius * _innerRadius));
private _innerIndex = ceil (_fullPoissonAmount - _mineAmount);
_mineAmount = _mineAmount + _innerIndex;

if (_centerPosition # 2 > 0) then {
    _centerPosition = [_centerPosition # 0, _centerPosition # 1, 0];
};

for "_i" from _innerIndex to _mineAmount do
{
    private _minePos = [_i, _mineAmount] call DNV_fnc_poisson;
    _minePos = [_minePos # 0, _minePos # 1 * 57.2957795, 0] call CBA_fnc_polar2vect;
    _minePos = _centerPosition vectorAdd (_minePos vectorMultiply _outerRadius);
    createMine [_mineType, _minePos, [], 0];
};