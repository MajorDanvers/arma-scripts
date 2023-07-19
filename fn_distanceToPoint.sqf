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
	scopeName 'path_loop';
	private [
		"_a",
		"_b",
		"_c",
		"_k",
		"_wc",
		"_wv",
		"_discriminant"
	];
	// this is all solving a quadratic
	_w = _path # _i;
	_v = _path # (_i + 1);
	_wv = _v vectorDiff _w;
	_wc = _w vectorDiff _center;
	_a = _wv vectorDotProduct _wv;
	_b = (_wv vectorDotProduct _wc) * 2;
	_c = (_wc vectorDotProduct _wc) - _radius ^ 2;
	_discriminant = _b ^ 2 - 4 * _a * _c;
	if (_discriminant >= 0) then {
		_k = (sqrt _discriminant - _b) / (2 * _a);
		if (_k > 0) then {
			if (_k < 1) then {breakOut 'path_loop'};
			_k = (- _b - sqrt _discriminant) / (2 * _a);
			_mult = _k;
		};
	};
	if (!isNil {_mult}) exitWith {};
};

if (isNil {_mult}) exitWith {nil};
_w vectorAdd ((_v vectorDiff _w) vectorMultiply _mult);