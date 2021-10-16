/*
	ProvideHorizon fixes
*/
params [
	"_units"
];

{
	private _role = "";
	switch typeOf _x do {
		case "CUP_I_PMC_Soldier_TL": {_role = "rh"};
		case "CUP_I_PMC_Medic": {_role = "cls"};
		case "CUP_I_PMC_Soldier_MG": {_role = "mg"};
		case "CUP_I_PMC_Contractor1": {_role = "r"};
		case "CUP_I_PMC_Soldier_GL_M16A2": {_role = "g"};
		case "CUP_I_PMC_Soldier_AT": {_role = "lat"};
		case "CUP_I_PMC_Engineer": {_role = "sg"};
		case "CUP_I_PMC_Soldier": {_role = "rh"};
		case "CUP_I_PMC_Sniper": {_role = "dmr"};
		case "CUP_I_PMC_Soldier_AA": {_role = "manpad"};
		case "CUP_I_PMC_Crew": {_role = "crew"};
	};
	[_x, "ENEMY_LOADOUT", _role] spawn tmf_assigngear_fnc_assignGear;
	_x spawn DNV_fnc_fixIdentity;
} forEach _units;