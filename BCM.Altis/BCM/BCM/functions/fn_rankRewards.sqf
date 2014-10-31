/*
	file: fn_rankRewards.sqf
	author(s): Iceman77
	
	description:
	- Called after the player's rank is set (in fn_clientInit.sqf loop)  
	- checks against the player's rankID and grants appropriate laodouts
	
	usage:
	_nul=call BCM_fnc_rankRewards;	
*/

switch ( rankID player ) do {
	case 1:{
		switch ( BCMSIDEPLAYER ) do {
			case WEST:{{[ player, format ["W%1", _x]] call BIS_fnc_addRespawnInventory;} forEach [3,4];};
			case EAST:{{[ player, format ["E%1", _x]] call BIS_fnc_addRespawnInventory;} forEach [3,4];};
			case INDEPENDENT:{{[ player, format ["I%1", _x]] call BIS_fnc_addRespawnInventory;} forEach [3,4];};
		};
	};
	case 2:{
		switch ( BCMSIDEPLAYER ) do {
			case WEST:{{[ player, format ["W%1", _x]] call BIS_fnc_addRespawnInventory;} forEach [5,6];};
			case EAST:{{[ player, format ["E%1", _x]] call BIS_fnc_addRespawnInventory;} forEach [5,6];};
			case INDEPENDENT:{{[ player, format ["I%1", _x]] call BIS_fnc_addRespawnInventory;} forEach [5,6];};
		};
	};
	case 3:{
		switch ( BCMSIDEPLAYER ) do {
			case WEST:{{[ player, format ["W%1", _x]] call BIS_fnc_addRespawnInventory;} forEach [7,8];};
			case EAST:{{[ player, format ["E%1", _x]] call BIS_fnc_addRespawnInventory;} forEach [7,8];};
			case independent:{{[ player, format ["I%1", _x]] call BIS_fnc_addRespawnInventory;} forEach [7,8];};
		};
	};
	case 4:{
		switch ( BCMSIDEPLAYER ) do {
			case WEST:{{[ player, format ["W%1", _x]] call BIS_fnc_addRespawnInventory;} forEach [9,10];};
			case EAST:{{[ player, format ["E%1", _x]] call BIS_fnc_addRespawnInventory;} forEach [9,10];};
			case independent:{{[ player, format ["I%1", _x]] call BIS_fnc_addRespawnInventory;} forEach [9,10];};
		};
	};
	case 5:{
		switch ( BCMSIDEPLAYER ) do {
			case WEST:{{[ player, format ["W%1", _x]] call BIS_fnc_addRespawnInventory;} forEach [11,12];};
			case EAST:{{[ player, format ["E%1", _x]] call BIS_fnc_addRespawnInventory;} forEach [11,12];};
			case independent:{{[ player, format ["I%1", _x]] call BIS_fnc_addRespawnInventory;} forEach [11,12];};
		};
	};
	case 6:{
		switch ( BCMSIDEPLAYER ) do {
			case WEST:{{[ player, format ["W%1", _x]] call BIS_fnc_addRespawnInventory;} forEach [13,14];};
			case EAST:{{[ player, format ["E%1", _x]] call BIS_fnc_addRespawnInventory;} forEach [13,14];};
			case independent:{{[ player, format ["I%1", _x]] call BIS_fnc_addRespawnInventory;} forEach [13,14];};
		};
	};
	case 7:{
		switch ( BCMSIDEPLAYER ) do {
			case WEST:{{[ player, format ["W%1", _x]] call BIS_fnc_addRespawnInventory;} forEach [15,16];};
			case EAST:{{[ player, format ["E%1", _x]] call BIS_fnc_addRespawnInventory;} forEach [15,16];};
			case independent:{{[ player, format ["I%1", _x]] call BIS_fnc_addRespawnInventory;} forEach [15,16];};
		};
	};
};

nil
