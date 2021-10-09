private _crate = _this # 0;

clearItemCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
_crate allowDamage false;
{
	_crate addItemCargoGlobal [_x # 0, _x # 1];
} forEach supplyCrateContents;

for "_x" from 1 to 6 do {
	_supplyLight = "ACE_G_Chemlight_HiWhite" createVehicle (position _crate);
	_supplyLight attachTo [_crate, [-0.05,0,0.44]];
	_supplySmoke = "SmokeShellGreen" createVehicle (position _crate);
	_supplySmoke attachTo [_crate, [0.05,0,0.44]];
	sleep 50;
};