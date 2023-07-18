/*
	Returns first intersection of circle and line segment path
	Untested 2023-07-18
*/
params [
	["_center", nil, [objNull, grpNull, []]],
	["_radius", 100, [0]],
	["_path", nil, [[]]]
];

// parameterization of line segment w + k(v-w), 0 <= k <= 1
private [
	"_mult",
	"_w",
	"_v"
];
for "_i" from 0 to (count _path - 2) do {
	private [
		"_a",
		"_b",
		"_c",
		"_k",
		"_discriminant"
	];
	// this is all solving a quadratic
	_w = _path # _i;
	_v = _path # (_i + 1);
	_a = (_v # 0 - _w # 0) ^ 2 + (_v # 1 - _w # 1) ^ 2
	_b =	(_w # 0) * (_v # 0 + _center # 0 - _w # 0) - 
			(_w # 1) * (_w # 1 - _center # 1 - _v # 1) - 
			(_v # 0) * (_center # 0) - 
			(_v # 1) * (_center # 1);
	_c = (_w # 0) ^ 2 + (_center # 0) ^ 2 - _radius ^ 2 + (_w # 1) ^ 2 + (_center # 1) ^ 2 - _w # 0 * _center # 0 - _w # 1 * _center # 1;
	_discriminant = _b ^ 2 - 4 * _a * _c;
	if (_discriminant >= 0) then {
		_k = (sqr _discriminant - _b) / (2 * _a);
		if (_k > 0) then {
			if (_k < 1) exitWith {_mult = _k};
			_k = (- _b - sqr _discriminant) / (2 * _a);
			_mult = _k;
		};
	};
	if (!isNil {_mult}) exitWith {};
};

if (isNil {_mult}) exitWith {nil};
_w vectorAdd ((_v vectorDiff _w) vectorMultiply _mult);