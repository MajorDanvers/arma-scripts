/*
	Returns the closest point on a series of line segments (given as an array of sequential points) to a given point.
	MINIMALLY TESTED 2023-07-12
*/

params [
	["_position", [0,0,0], [[], objNull, grpNull]],
	["_pointSequence", nil, [[]]]
];

if (_position isEqualType grpNull) then {
	_position = leader _position;
};

if (_position isEqualType objNull) then {
	_position = getPos _position;
};

private _minDistance = 1000000;
private _closestPoint = [0,0];

for "_i" from 0 to (count _pointSequence - 2) do {
	private _l2 = vectorMagnitudeSqr (_pointSequence # _i vectorDiff _pointSequence # (_i + 1)); // correct
	private _wv = (_pointSequence # (_i + 1)) vectorDiff (_pointSequence # _i);

	private _scalar = (0 max (1 min ( // clamped to 0 .. 1 to exclude points not on segment
		(
            ([_position # 0, _position # 1] vectorDiff (_pointSequence # _i))
			vectorDotProduct
			_wv
		)
		/ _l2
	)));
	private _thisSegmentClosest = (_pointSequence # _i) vectorAdd (_wv vectorMultiply _scalar); // correct to this point
	private _distance = _thisSegmentClosest vectorDistance _position;

	if (_distance < _minDistance) then {
		_minDistance = _distance;
		_closestPoint = _thisSegmentClosest;
	};
};

[_closestPoint, _minDistance];