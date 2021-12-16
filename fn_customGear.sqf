/*
	ProvideHorizon fixes
*/
params [
	"_units",
	"_gearHash",
	["_loadout", "ENEMY_LOADOUT"],
	["_fixWS", false]
];

if (_units isEqualType grpNull) then { _units = units _units; };

{
	private _role = _gearHash get (typeOf _x);
	[_x, _loadout, _role] spawn tmf_assigngear_fnc_assignGear;
	if _fixWS then {_x spawn DNV_fnc_fixIdentity};
} forEach _units;