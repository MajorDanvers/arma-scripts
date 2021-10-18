/*
	Author: majDanvers

	Description:
		Counts the amount of alive players.

	Parameter(s):
		None
        
	Returns:
		Number

	Example:
		[opfor] call DNV_fnc_alivePlayers;
*/
{alive _x} count allPlayers;