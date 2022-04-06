/*
	Author: majDanvers

	Description:
		Draws a (local) circle on the map with a given radius & center.

	Parameter(s):
		0: String – marker name
		1: Position – marker center
		2: Number – circle radius, in meters
		3: Number – (Optional, default -1) Marker side for MP
		4: Object – (Optional, default objNull) Marker creator for MP
		5: String – (Optional, default "Default") Color from CfgMarkerColors
		6: String – (Optional, default "Border") Brush from CfgMarkerBrushes

	Returns:
		String – markerName

	Examples:
		<example>
*/
params [
	"_name",
	"_pos",
	"_rad",
	["_side", -1],
	["_creator", objNull],
	["_color", "Default"],
	["_brush", "Border"]
];

[
	_name,
	_pos,
	"ELLIPSE",
	[_rad, _rad],
	"PERSIST",
	"_BRUSH:",
	_brush,
	"COLOR:",
	_color
] call CBA_fnc_createMarker;