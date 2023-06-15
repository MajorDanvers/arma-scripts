/*
	Author: majDanvers

	Description:
		TBD

	Parameter(s):
		0: Number
		1: Number
		2: Number

	Returns:
		Position

	Examples:
		TBD
*/
params [
	["_sampleIndex", 0, [0]],
	["_samplesCount", 5, [0]],
	["_offset", 0, [0]]
];

private _radius = sqrt (_sampleIndex / _samplesCount);

private _theta = (_sampleIndex * 2.39996323 + _offset) mod 6.28318530718; // golden angle

[_radius, _theta];