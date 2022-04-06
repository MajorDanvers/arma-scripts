params [
    "_unit",
    ["_insig", ""]
];
[
    {
        if (uniform _this in [
            'U_B_CombatUniform_mcam_W',
            'U_B_CombatUniform_mcam_tshirt_W',
            "WU_B_T_Soldier_AR_F",
            'WU_B_GEN_commander_F'
        ]) then {
            private _face = selectRandom [
                'max_faceWS8',
                'max_faceWS3',
                'max_faceWS4',
                'max_faceWS5',
                'max_faceWS1',
                'max_faceWS2',
                'max_faceWS6',
                'max_faceWS9'
            ];
            [_this, _face] remoteExec ['setFace'];
            [_this, 'CUP_D_Female01_EN'] remoteExec ['setspeaker'];
            private _name = format [
                "%1 %2",
                selectRandom ["Alex", "Jane", "Rachel", "Karen", "Carol", "Michelle"],
                selectRandom ["Smith", "Jones", "Kelly", "Johnson"]
            ];
            [_this, _name] remoteExec ['setName'];
        };
    },
    _unit,
    1
] call CBA_fnc_waitandexecute;
[
    {
        [_this # 0, ""] call BIS_fnc_setUnitInsignia;
        [_this # 0, _this # 1] call BIS_fnc_setUnitInsignia;
    },
    [_unit, _insig],
    1
] call CBA_fnc_waitandexecute;