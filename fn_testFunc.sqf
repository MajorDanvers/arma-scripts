/*
    0: code
    1: expected result
    2: description
*/

/*
[
    [
        {true},
        true,
        'forgot to send params'
    ]
]
*/

{
    private _res = call (_x # 0);
    
    // stupid way of dealing with arrays fix later
    if (_x # 1 isEqualType []) then {
        _x set [1, format ["%1", _x # 1]];
    };
    if (_res isEqualType []) then {
        _res = format ["%1", _res];
    };
    
    systemChat format ["Test %1 (%2): %3 (%4)", _foreachIndex + 1, _x # 2, _res == _x # 1, _res];
} forEach _this;