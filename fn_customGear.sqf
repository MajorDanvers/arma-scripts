/*
	ProvideHorizon fixes
*/
params [
	"_units",
	"_gearHash",
	["_loadout", "ENEMY_LOADOUT"]
];

{
	private _role = _gearHash get (typeOf _x);
	[_x, _loadout, _role] spawn tmf_assigngear_fnc_assignGear;
	_x spawn DNV_fnc_fixIdentity;
} forEach _units;