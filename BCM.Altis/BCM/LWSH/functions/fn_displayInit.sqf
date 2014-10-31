/*
	file: fn_displayInit.sqf
	author(s): Iceman77
	
	description:
	- add display EH to monitor key presses	 
	
	usage:
	postInit	
*/

[] spawn { 
	if ( isDedicated ) exitWith {};
	waitUntil {!( isnull ( findDisplay 46 ) ) };
	(findDisplay 46) displayAddEventHandler ["KeyDown","(_this select 1) call LWSH_fnc_keyDown; false"];  
};

nil
