waitUntil { !isNull player };
_role = typeOf player;
if (_role in ["I_G_officer_F", "I_G_Soldier_SL_F"]) then {
	player addItem "ACRE_PRC148";
};
_role = nil;

_group = groupID group player;

_radioHash = createHashMapFromArray [
	["ASL", 2],
	["A1", 2],
	["A2", 2],
	["BSL", 3],
	["B1", 3],
	["B2", 3],
	["CSL", 4],
	["C1", 4],
	["C2", 4],
	["DSL", 5],
	["D1", 5],
	["D2", 5],
	["ESL", 6],
	["E1", 6],
	["E2", 6],
	["FSL", 7],
	["F1", 7],
	["F2", 7]
];
waitUntil { ([] call acre_api_fnc_isInitialized) };

_channel = _radioHash getOrDefault [_group, 1];

[(["ACRE_PRC343"] call acre_api_fnc_getRadioByType), _channel] call acre_api_fnc_setRadioChannel;