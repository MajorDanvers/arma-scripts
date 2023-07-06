params [
	"_unit"
];
private _stdMag = (getArray (configfile >> "CfgWeapons" >> (primaryWeapon _unit) >> "magazines") # 0);
private _mags = 0;
while {[_unit, _stdMag, 1] call CBA_fnc_canAddItem && {_mags < 9}} do {
	_unit addMagazine _stdMag;
	_mags = _mags + 1;
};
reload _unit;