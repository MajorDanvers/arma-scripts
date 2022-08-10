/*

*/
params [
    "_pos",
    "_lineSegment"
];

private _AB = (_lineSegment # 1) vectorDiff (_lineSegment # 0);
private _dpABAP = () vectorDotProduct ();
private _dpABBP = () vectorDotProduct ();