/*
	file: fn_ending.sqf
	author(s): Iceman77
	
	description:
	- Monitor all sides tickets. Whenever one reaches 0, put them into losers array.
	After loser's array's count is 2, then exit the loop. Filter the winner, and broadcast messages
	
	usage:
	postInit	
*/

if ( !( isServer ) ) exitWith {};
	
[] spawn {

	LOSERARRAY = [];
	while  { count LOSERARRAY < 2 } do {
		if ( ( isNil "BCM_WESTLOST" ) && { ( [ west, 0 ] call BIS_fnc_respawnTickets <= 0 ) } ) then { 
			BCM_WESTLOST = 1;
			LOSERARRAY pushBack west; 
		};
		if ( ( isNil "BCM_EASTLOST" ) && { ( [ east, 0 ] call BIS_fnc_respawnTickets <= 0 ) } ) then { 
			BCM_EASTLOST = 1;
			LOSERARRAY pushBack east; 
		};
		if ( ( isNil "BCM_INDEPENDENTLOST" ) && { ( [ independent, 0 ] call BIS_fnc_respawnTickets <= 0 ) } ) then { 
			BCM_INDEPENDENTLOST = 1;
			LOSERARRAY pushBack independent; 
		};
		sleep 1;
	};

	sleep 1;

	{
		if ( !(_x in LOSERARRAY) ) exitWith {
			BCMWINNERSIDE = _x;
		};
	} forEach [ west, east, independent ];

	sleep 1;

	[ [ "winner", true, true ], "BIS_fnc_endMission", BCMWINNERSIDE ] call BIS_fnc_MP;

	{

		[ [ "loser", false, true ], "BIS_fnc_endMission", _x ] call BIS_fnc_MP;
		
	} forEach LOSERARRAY;

};

nil
