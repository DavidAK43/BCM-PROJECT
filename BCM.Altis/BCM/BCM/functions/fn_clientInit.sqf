/*
	file: fn_clientInit.sqf
	author(s): Iceman77
	
	description:
	- add actions and eventhandlers to clients. Remove all initial respawn templates (for re-joining players so there's no duplicate templates)
	and add new ones. Monitor the player's score to dictate ranks and available loadouts.
	
	usage:
	postInit
*/

if ( isDedicated ) exitWith {};

[] spawn {


	waitUntil { ! ( isNull player ) && ( time > 0 ) };
	
    player addAction [
        "Flip Vehicle", 
        {_nul=call BCM_fnc_vehFlip;},
        [], 
        0, 
        false, 
        true, 
        "", 
        "_this == (vehicle _target) && {(count nearestObjects [_target, ['landVehicle'], 5]) > 0 && {(vectorUp cursorTarget) select 2 < 0}}"
    ];
	
	player addAction [
		"<t color='#0099FF'>VIRTUAL REARMING HUB</t>", 
		{ _nul=call VRH_fnc_uiInit; },
		[],
		6,
		true,
		true,
		"",
		"{ cursorTarget isKindOf _x } count [ 'ReammoBox_F','Land_Pallet_MilBoxes_F' ] > 0 && { _target distance cursorTarget <= 5 }"
	];  
	
	{
		player removeAllEventHandlers _x;
	} forEach [ "respawn", "take" ];

	player addEventhandler [ "respawn", "_this call BCM_fnc_respawn" ];
	player addEventHandler [ "take", "_this call BCM_fnc_campOwner"];
	//setDate [2035, 7, 6, (paramsArray select 0), 0];
	
	_kits = [player, true] call BIS_fnc_getRespawnInventories;
	{
		[player, _forEachIndex] call BIS_fnc_removeRespawnInventory;
	} forEach _kits;
	
	private ["_letter"];

	switch ( side player ) do {
		case WEST:{_letter = 'W';};
		case EAST:{_letter = 'E';};
		case INDEPENDENT:{_letter = 'I';};
	};

	for "_i" from 1 to 2 do {
		[ player, format [_letter + "%1", _i]] call BIS_fnc_addRespawnInventory;
	};
	
	{
		_x setMarkercolor ( getMarkercolor _x );
	} foreach allMapMarkers;
	
	private ["_s"];
	
	_s = 0;
	
	for "_i" from 1 to count (configfile >> "CfgRanks") do {
	
		_s = _s + 10;
		
		waitUntil { score player >= _s };
			_rank = getText ( configfile >> "CfgRanks" >> str _i >> "displayName" );
			_picture = getText ( configfile >> "CfgRanks" >> str _i >> "texture" );
			player setRank _rank;
			_nul=call BCM_fnc_rankRewards;	
			
		if ( isNull ( findDisplay 58 ) ) then {
			[ 
				"BCM_GENERIC_PROFILECOLOR_MSG", 
				[ 
					"RANK UP", 
					format [ "You've ranked up to %1. New kits are available.", _rank], 
					_picture, 
					"" 
				] 	
			] call BIS_fnc_showNotification;
		};
	};	
};

nil

