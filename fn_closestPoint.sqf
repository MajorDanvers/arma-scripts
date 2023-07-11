/*
	Returns the closest point on a series of line segments (given as an array of sequential points) to a given point.
	UNTESTED 2023-07-10
*/

params [
	["_position", [0,0,0], [[], objNull, grpNull]],
	["_pointSequence", nil, [[]]]
];

/* shouldn't need this
private _twod_Diff = {
	params [
		"_v0",
		"_v1"
	];
	[(_v1 # 0) - (_v0 # 0), (_v1 # 1) - (_v0 # 1)];
};
*/

if (_position isEqualType grpNull) then {
	_position = leader _position;
};

if (_position isEqualType objNull) then {
	_position = getPos _position;
};

private _minDistance = -1;
private _closestPoint = [0,0];

for "_i" from 0 to (count _pointSequence - 1) do {
	private _l2 = vectorMagnitudeSqr (_pointSequence # _i vectorDiff _pointSequence);
	private _wv = (_pointSequence # (_i + 1)) vectorDiff (_pointSequence # _i);

	private _scalar = (0 max (1 min ( // clamped to 0 .. 1 to exclude points not on segment
		(
            ([_position # 0, _position # 1] vectorDiff (_pointSequence # _i))
			vectorDotProduct
			_wv
		)
		/ _l2
	)));
	private _closestPoint = (_pointSequence # _i) vectorAdd (_wv vectorMultiply _scalar);
	private _distance = _closestPoint vectorDistance _position;

	if (_distance < _minDistance || {_closestPoint # 0 == 0 && _closestPoint # 1 == 0}) then {
		_minDistance = _distance;
		_closestPoint = _closestPoint;
	};
};

[_closestPoint, _minDistance];