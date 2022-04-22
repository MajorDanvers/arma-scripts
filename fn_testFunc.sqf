/*
    0: code
    1: expected result
    2: description
*/

params [
    [_tests, nil, [[]]]
];

{
    private _res = call (_x # 0);
    systemChat format ["Test %1 (%2): %3 (%4)", _foreachIndex + 1, _x # 2, _res == _x # 1, _res];
} forEach _tests;