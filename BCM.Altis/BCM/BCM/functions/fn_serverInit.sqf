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

/*
_id = addMissionEventHandler ["HandleDisconnect",{

	private ["_unit","_kits"];
	
	_unit = _this select 0;	
	{
		_unit removeAllEventHandlers _x;
	} forEach [ "respawn", "take" ];
	
	_unit addEventhandler ["respawn", {_this spawn BCM_fnc_respawn; }];
	_unit addEventHandler ["take", { _this call BCM_fnc_campOwner; }];
	
	_kits = [_unit, true] call BIS_fnc_getRespawnInventories;
	{
		[_unit, _forEachIndex] call BIS_fnc_removeRespawnInventory;
	} forEach _kits;
	
	true	
	
}];
*/

nil
