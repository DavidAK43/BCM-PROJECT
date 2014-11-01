/*
	file: fn_serverInit.sqf
	author(s): Iceman77
	
	description:
	- set the date, add eventhandlers to ai units
	
	usage:
	postInit
*/

if ( !( isServer ) ) exitWith {};

setDate [2035, 7, 6, (paramsArray select 0), 0];

{
	if ( !( isPlayer _x ) ) then {
		_x addEventhandler ["respawn", {_this spawn BCM_fnc_respawn; }];
		_x addEventHandler ["take", { _this call BCM_fnc_campOwner; }];
	};
} forEach playableUnits;

_nul=["BCMSPAWNPACK", true] call BCM_fnc_bpSpawn;
_nul=["BCMTERMINAL", true] call BCM_fnc_bpSpawn;

nil
