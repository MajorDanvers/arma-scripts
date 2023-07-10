/*
	Returns the closest point on a series of line segments (given as an array of sequential points) to a given point.
	UNTESTED 2023-07-10
*/

params [
	["_position", [0,0,0], [[], objNull, grpNull]],
	["_pointSequence", nil, [[]]]
];

private _lengthSquared = {
	vectorMagnitudeSqr ([(_this # 0) # 0, (_this # 0) # 1] vectorDiff [(_this # 1) # 0, (_this # 1) # 1]);
};

/* shouldn't need this
private _twod_Diff = {
	params [
		"_v0",
		"_v1"
	];
	[(_v1 # 0) - (_v0 # 0), (_v1 # 1) - (_v0 # 1)];
};
*/

private _minDistance = -1;
private _closestPoint = [0,0];

for "_i" from 0 to (count _pointSequence - 1) do {
	private _l2 = [_pointSequence # _i, _pointSequence # (_i + 1)] call _lengthSquared;
	private _wv = (_pointSequence # (_i + 1)) vectorDiff (_pointSequence # _i);

	private _scalar = (0 max (1 min (
		(
			([[_position # 0, _position # 1], _pointSequence # _i] call _twod_Diff)
			vectorDotProduct
			_wv
		)
		/ _l2;
	)));
	private _closestPoint = _wv vectorMultiply _scalar;
	private _distance = _closestPoint vectorDistance _position;

	if (_distance < _minDistance || {_closestPoint == [0,0]}) then {
		_minDistance = _distance;
		_closestPoint = _closestPoint;
	};
};

[_closestPoint, _minDistance];