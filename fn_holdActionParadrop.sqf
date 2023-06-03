params ["_target","_caller","_id","_args"];

hint "Careful!\nYou will paradrop on your next map click.";

localNamespace setVariable [
    'DNV_mapTeleport', 
    addMissionEventHandler [
        "MapSingleClick",
        {
            params ["_units", "_pos", "_alt", "_shift"];
            private _teleportPos = _pos vectorAdd [0, 0, 250];
            _teleportPos = _teleportPos vectorAdd ([random 70, random 360, random [-15, 0, 15]] call CBA_fnc_polar2vect);
            [player, _teleportPos] call tmf_teleport_fnc_paraDrop;
            removeMissionEventHandler [
                "MapSingleClick",
                localNamespace getVariable 'DNV_mapTeleport';
            ];
        }
    ]
];

openMap [true, false];

