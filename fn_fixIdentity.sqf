params [
    "_unit",
    ["_insig", ""]
];
[
    {
        if (uniform _this in [
            'U_B_Combatuniform_mcam_tshirt_W',
            'WU_B_T_Soldier_AR_F',
            'WU_B_GEN_commander_F'
        ]) then {
            private _face = selectRandom [
                'max_faceWS8',
                'max_faceWS3',
                'max_faceWS4'
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
        [_this, ""] call BIS_fnc_setUnitinsignia;
        [_this, _insig] call BIS_fnc_setUnitinsignia;
    },
    _unit,
    1
] call CBA_fnc_waitandexecute;