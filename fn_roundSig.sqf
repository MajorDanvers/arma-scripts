params [
    ['_toRound', nil, [0]],
    ['_numDigits', 1, [0]]
];

private _wasNeg = false;
private _ordersDiff = 0;

if (_toRound < 0) then {
    _toRound = _toRound * -10;
    _wasNeg = true;
};

while {_toRound < (10 ^ (_numDigits - 1))} do {
    _toRound = _toRound * 10;
    _ordersDiff = _ordersDiff - 1;
};

_toRound = round _toRound;

while {_toRound > (10 ^ _numDigits)} do {
    _toRound = _toRound / 10;
    _ordersDiff = _ordersDiff + 1;
};

_toRound = round _toRound;

if (_wasNeg) then {_toRound = _toRound * -1; _ordersDiff = _ordersDiff - 1;};

_toRound * 10 ^ _ordersDiff;