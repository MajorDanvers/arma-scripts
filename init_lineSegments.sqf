if (!isServer) exitWith {};
DNV_reinforcementPath = [[(getPos this) # 0, (getPos this) # 1]];
TEMP_currentNode = (synchronizedObjects this) # 0;
while {
	!isNil {(synchronizedObjects TEMP_currentNode) # 1}
} do {
	private _pos = getPos TEMP_currentNode;
	DNV_reinforcementPath pushBack [_pos # 0, _pos # 1];
	TEMP_currentNode = (synchronizedObjects TEMP_currentNode) # 1;
};
DNV_reinforcementPath pushBack (getPos TEMP_currentNode);
TEMP_currentNode = nil;