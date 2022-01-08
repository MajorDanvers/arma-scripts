/*
    Slowly regenerates bleedout timer, faster when closer to death
    2 minutes to regen last down to second last
    15 minutes to regen first down
*/
#define malus diw_armor_plates_main_bleedOutTimeMalus
#define bleedout diw_armor_plates_main_bleedOutTime
#define subtraction diw_armor_plates_main_bleedOutTimeSubtraction
#define coeff 1
if (isNil {malus}) then {
    [
        {
            !isNil {malus} && {!(player getVariable ["diw_armor_plates_main_unconscious",false])}
        },
        DNV_fnc_regenBleedout
    ] call CBA_fnc_waitUntilAndExecute;
}
else {
    private _nextRegen = (bleedout - malus - subtraction) / coeff; // d(malus)/d(time) = 1/60 when malus = 0
    [
        {
            if (!(player getVariable ["diw_armor_plates_main_unconscious",false])) then {
                malus = malus - 1;
                if (malus <= (-1 * subtraction)) then {malus = nil};
            };
            call DNV_fnc_regenBleedout;
        },
        nil,
        _nextRegen
    ] call CBA_fnc_waitAndExecute;
};

