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

private [ "_unit", "_container", "_item", "_sideCaller", "_side", "_message" ];

_unit = _this select 0;
_container = _this select 1;
_item = _this select 2;
_sideCaller = [ side _unit ] call bis_fnc_sideName;

if ( isNil "BCM_CAMP_SIDE" ) then { 
	player setVariable ["BCM_CAMP_SIDE", "", true ]; 
};

if ( _item in [ "B_Respawn_TentDome_F", "B_Respawn_TentA_F" ] && { ( player getVariable "BCM_CAMP_SIDE" ) != _sideCaller } ) then {
	player setVariable [ "BCM_CAMP_SIDE", _sideCaller, true ]; 		
	{
		_side = [ _x ] call bis_fnc_sideName;
		_message = if ( _side != _sideCaller ) then {"BCM_GENERIC_RED_MSG";} else {"BCM_GENERIC_GREEN_MSG";};
		[[_message, ["Mobile Re-spawn Camp", format ["%1 has taken control over the mobile respawn camp", _sideCaller], "\A3\ui_f\data\map\markers\nato\respawn_inf_ca.paa",""]],"BIS_fnc_showNotification", _x ] call BIS_fnc_MP;
	} forEach [ WEST, EAST, INDEPENDENT ];
};

nil

