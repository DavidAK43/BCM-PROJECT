/*
	file: fn_campOwner.sqf
	author(s): Iceman77
	
	description:
	- Triggered via the take EH (added in fn_clientInit.sqf)  
	- If the item taken is a camp spawn pack, and if the side of the unit that grabbed the pack isn't already in control of the respawn camp pack, 
	then a new side has taken control of the pack so notify all clients that this change has been made.
	
	usage:
	player addEventHandler [ "take", "_this call BCM_fnc_campOwner"];
*/

private [ "_unit", "_container", "_item", "_sideCaller","_message" ];

_unit = _this select 0;
_container = _this select 1;
_item = _this select 2;
_sideCaller = side _unit;

if ( _item in [ "B_Respawn_TentDome_F", "B_Respawn_TentA_F" ] ) then {

	[["Tactics","RespawnCamps"], 60, nil, 60, nil, true, nil, true, true] call BIS_fnc_advHint;
	
	private ["_side"];
	
	_side = player getVariable ["BCMCAMPOWNER", sideUnknown];
	
	if ( _side != _sideCaller ) then {
		player setVariable [ "BCMCAMPOWNER", _sideCaller, true ];
		{
			_message = if ( _x != _sideCaller ) then {"BCM_GENERIC_RED_MSG";} else {"BCM_GENERIC_GREEN_MSG";};
			[
				[
					_message,
					[
						"Mobile Re-spawn Camp", 
						format ["%1 has taken control over the mobile respawn camp", _sideCaller],
						"\A3\ui_f\data\map\markers\nato\respawn_inf_ca.paa",
						""
					]
				],
				"BIS_fnc_showNotification", 
				_x 
			] call BIS_fnc_MP;
		
		} forEach [ WEST, EAST, INDEPENDENT ];
		
		[ _sideCaller, 50 ] call BIS_fnc_respawnTickets;	
			
		[ 
			[ 
				"BCM_TICKETS_AWARDED_MSG" , 
				[ "50" ] 
			], 
			"BIS_fnc_showNotification", 
			_sideCaller
		] call BIS_fnc_MP;
		
		
	};
	
} else {

	if ( _item in ["B_UavTerminal","O_UavTerminal","I_UavTerminal"] ) then {
	
		[["UAV","Terminal"], 60, nil, 60, nil, true, nil, true, true] call BIS_fnc_advHint;
		
		_newItem = switch _sideCaller do {
			case west:{"B_UavTerminal";};
			case east:{"O_UavTerminal";};
			case independent:{"I_UavTerminal";};
		};
			
		_unit addWeaponGlobal _newItem;	
		
		private ["_side"];
		_side = player getVariable ["BCMTERMINALOWNER", sideUnknown];
		
		if ( _side != _sideCaller ) then {
			player setVariable ["BCMTERMINALOWNER", _sideCaller, true];
			{
				_message = if ( _x != _sideCaller ) then {"BCM_GENERIC_RED_MSG";} else {"BCM_GENERIC_GREEN_MSG";};
				[
					[
						_message, 
						[
							"UAV Terminal", 
							format ["%1 has taken control over the UAV Terminal", _sideCaller], 
							"\a3\ui_f\data\gui\cfg\hints\UAVBasic_ca.paa",
							""
						]
					],
					"BIS_fnc_showNotification", 
					_x 
				] call BIS_fnc_MP;
			} forEach [ WEST, EAST, INDEPENDENT ];
			
			[ _sideCaller, 50 ] call BIS_fnc_respawnTickets;	
			
			[ 
				[ 
					"BCM_TICKETS_AWARDED_MSG" , 
					[ "50" ] 
				], 
				"BIS_fnc_showNotification", 
				_sideCaller
			] call BIS_fnc_MP;
			
		};
		
	};
	
};

nil

