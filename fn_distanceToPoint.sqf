params [
	["_center", nil, [objNull, grpNull, []]],
	["_radius", 100, [0]],
	["_path", nil, [[]]]
];

([
	radius,
	vectDir plus or minus acos (Dp/radius)
] call CBA_fnc_polar2vect) vectorAdd [center];