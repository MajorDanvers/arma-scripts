/*
	ProvideHorizon fixes
*/
params [
	"_units",
	"_gearHash"
];

{
	private _role = _gearHash get (typeOf _x);
	[_x, "ENEMY_LOADOUT", _role] spawn tmf_assigngear_fnc_assignGear;
	_x spawn DNV_fnc_fixIdentity;
} forEach _units;