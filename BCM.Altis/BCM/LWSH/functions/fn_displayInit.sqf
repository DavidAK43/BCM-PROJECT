[] spawn { // TO WORK WITH POSTINIT
	if ( isDedicated ) exitWith {};
	waitUntil {!( isnull ( findDisplay 46 ) ) };
	(findDisplay 46) displayAddEventHandler ["KeyDown","(_this select 1) call LWSH_fnc_keyDown; false"];  
};

nil
