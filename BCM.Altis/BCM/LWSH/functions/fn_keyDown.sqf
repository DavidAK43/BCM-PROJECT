#define LWSHdisplay (uiNamespace getVariable "LWSH_Display") 

private [ "_keys" ];

_keys = actionKeys "User17";
if ( count _keys > 0 ) then {

	if ( _this in _keys ) then { 
		
		if ( isNull ( LWSHdisplay ) ) then {	
			[] spawn LWSH_fnc_monitor;
		} else { 
			( "LWSH_Layer" call BIS_fnc_rscLayer ) cutText [ "", "PLAIN" ];
		};
		
	};
	
} else { // NO KEYS ARE MAPPED TO USER 17 ACTION KEY

	// IF THE CAPS-LOCK KEY ( DEFAULT KEY ) WAS PRESSED THEN 
	if ( _this == 58 ) then {
		
		if ( isNull ( LWSHdisplay ) ) then {
			[] spawn LWSH_fnc_monitor;
		} else {
			( "LWSH_Layer" call BIS_fnc_rscLayer ) cutText [ "", "PLAIN" ];
		};
		
	};
	
};

nil
