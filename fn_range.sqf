/*
	Author: majDanvers

	Description:
		Takes in two things capable of running distance on and returns an array
			describing a randomized search annulus with a given area.

	Parameter(s):
		0: Object, Position or Location
		1: Object, Position or Location
		2: Number – (Optional, default 10^6) The area of the search ring in m^2
		3: Number – (Optional, default 0) The maximum distance the target will
					 be outside the search band, in meters

	Returns:
		Array

	Examples:
		<example>
*/
_this params [
	"_detector",
	"_target", // n.b.: technically, these two can be in either order
	["_searchSize", 1000000],
	["_maxOutside", 0]
];
private _rad = _target distance _detector; // todo: params type checking

_rad = random [_rad - _maxOutside, _rad, _rad + _maxOutside];

// (outer r^2 - inner r^2) for all annuli with area searchSize
private _SS_OVER_PI = _searchSize / pi;

/*
	maximum positive error such that an annulus centered on _maxPos + _roll
	with area _searchSize m^2 will contain _target
 */
private _maxPos =
	0.5 * (sqrt (_rad ^ 2 + _SS_OVER_PI) - _rad);
;

// similarly
private _maxNeg =
	// minimum distance estimate is 0
	if (_rad < sqrt _SS_OVER_PI) then {_rad;} else
	{
		0.5 * (_rad - sqrt (_rad ^ 2 - _SS_OVER_PI));
	};
;

private _rolledEstimate = random (_maxNeg + _maxPos) - _maxNeg + _rad;

// the minimum range (search area is a circle, i.e. inner radius = 0)
private _tooClose = sqrt (_SS_OVER_PI);
if (_rolledEstimate <= _tooClose) then
{
	//return
	[0, _tooClose];
}
else
{
	private _inv = 1 / _rolledEstimate;
	// return
	[
		_rolledEstimate - _SS_OVER_PI * .25 * _inv, // inner rad
		_SS_OVER_PI * .25 * _inv + _rolledEstimate  // outer rad
	];
};