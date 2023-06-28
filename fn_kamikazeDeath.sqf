if (!isServer) exitWith {_this remoteExec ['DNV_fnc_kamikazeDeath', 2]};
private _drone = _this # 0;
private _controller = (UAVControl _drone) # 0;
if (!isNull _controller) then {
    (createMine ["SatchelCharge_F", getPos _drone, [], .5]) setDamage 1;
};