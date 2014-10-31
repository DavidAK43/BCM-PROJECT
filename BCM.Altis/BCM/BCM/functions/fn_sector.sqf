/* 
	Author: 
		Iceman77
		
	Parent File: 
		Sector Module Expression Line
		
	Description: 
		- Function called every time sector ownership changes. 
		- New spawn position and additional tickets to the capturing side.
		- Sets custom marker colors
	
	Parameters:
		- select 0: <object> - Module ( automatically passed to the arguments from the module )
		- select 1: <side> - Owner Side ( automatically passed to the arguments from the module )
		- select 2 <side> - Previous Owner's Side ( automatically passed to the arguments from the module )
		- select 3 <number> - Points awarded to the capturing side
		
	Usage: (Sector Module Expression Line)
		[(_this select 0), (_this select 1), (_this select 2), 15] call BCM_fnc_sector
 */
 
if ( !( isServer ) ) exitWith {};

private ["_module", "_ownerSide", "_prevOwnerSide", "_sector", "_points","_ownerColor","_marker"];

_module 			= [ _this, 0, objNull, [ objNull ] ] call BIS_fnc_param;
_ownerSide 		= [ _this, 1, west, [ sideunknown ] ] call BIS_fnc_param;
_prevOwnerSide 	= [ _this, 2, east, [ sideunknown ] ] call BIS_fnc_param; 
_points 			= [ _this, 3, 10, [ -1 ] ] call BIS_fnc_param;

{
	if ( ( ( markerPos _x ) distance _module < 50 ) && { ( ( markerType _x ) == "EMPTY" ) } ) exitWith {
		_marker = _x;
	};
} forEach allMapMarkers;

if ( _ownerSide in [ west, east, independent ] ) then {
	[ _ownerSide, _marker ] call BIS_fnc_addRespawnPosition;
	[ _ownerSide, _points ] call BIS_fnc_respawnTickets;
	[ [ "BCM_TICKETS_AWARDED_MSG" , [ format [ "%1", _points ] ] ], "BIS_fnc_showNotification", _ownerSide ] call BIS_fnc_MP;	
};

if ( _prevOwnerSide in [ west, east, independent ] ) then {
	_respawnPositionsPreviousOwner = [ _prevOwnerSide, false ] call BIS_fnc_getRespawnPositions;	
	{
		if ( _marker == _x ) exitWith {
			[ _prevOwnerSide, _forEachIndex ] call BIS_fnc_removeRespawnPosition;
		};
	} forEach _respawnPositionsPreviousOwner;		
};

nil
