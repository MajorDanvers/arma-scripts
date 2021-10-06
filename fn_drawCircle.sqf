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
format [
	"|%1|%2|loc_search|ELLIPSE|%3|0|%4|%5|1", 
	_name, 
	_pos, 
	[_rad, _rad], 
	_brush,
	_color
] call BIS_fnc_stringToMarker;