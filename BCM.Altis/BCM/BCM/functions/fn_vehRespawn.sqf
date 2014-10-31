/* ----------------------------------------------------------------------------------------------------

	File: fn_vehRespawn.sqf
		
	Author: Iceman77
		
	Description:
		- MODIFIED version of my LVR to accomodate dynamic vehicle spawning at sectors based on current owner's side
		- Monitor a vehicle and "respawn" it if it's destroyed or abandoned 
		- Can be used on multiple vehicles
		
	Parameter(s):
		- _this select 0: < OBJECT > 	- VEHICLE TO MONITOR.
		- _this select 1: < NUMBER > 	- ABANDONED DELAY IN SECONDS.
		- _this select 2: < NUMBER > 	- DESTROYED DELAY IN SECONDS.
		- _this select 3: < OBJECT > 	- SECTOR THE VEHICLE BELONGS TO.
		- _this select 4: < ARRAY >  	- ARRAY OF STRINGS. VEHICLE CLASSNAMES. UPON REFRESH, ONE WILL BE CREATED BASED ON WHO OWNS THE SECTOR.
										SELECT 0 - DEFAULT VEHICLE TYPE
										SELECT 1 - OPFOR VEHICLE TYPE
										SELECT 2 - BLUFOR VEHICLE TYPE
										SELECT 3 - INDEPENDENT VEHICLE TYPE
										e.g.:
										["defaultVehicleClassName","bluforVehicleclassName","opforVehicleClassName","independentVehicleClassName"]

	Usage Example (Vehicle init Line): _nul = [ this, 60, 60, sector1, [ typeOf this,"B_MRAP_01_hmg_F","O_MRAP_02_hmg_F","I_MRAP_03_hmg_F" ] ] spawn ICE_fnc_vehRespawn 
		
---------------------------------------------------------------------------------------------------- */

if ( ! ( isServer ) ) exitWith {};

private ["_veh","_abandonDelay","_destroyedDelay","_sector","_vehArray","_defaultVehicle","_bluforVehicle","_opforVehicle","_independentVehicle","_vehDir","_vehPos","_vehType","_abandoned","_dead"];

_veh 			= [ _this, 0, objNull, [ objNull ] ] call BIS_fnc_param; 
_abandonDelay 	= [ _this, 1, 60, [ 0 ] ] call BIS_fnc_param; 
_destroyedDelay 	= [ _this, 2, 60, [ 0 ] ] call BIS_fnc_param; 
_sector 			= [ _this, 3, objNull, [ objNull ] ] call BIS_fnc_param;
_vehArray 		= [ _this, 4, [ ], [ [ ] ] ] call BIS_fnc_param; 
_defaultVehicle 	= ( _vehArray select 0 );
_bluforVehicle 	= ( _vehArray select 1 );
_opforVehicle 	= ( _vehArray select 2 );
_indepVehicle 	= ( _vehArray select 3 );
_vehDir 			= getDir _veh; 
_vehPos 			= getPos _veh; 
_abandoned 		= false;
_dead 			= false;

while { true } Do {
	sleep 1;
	if ( ( alive _veh ) && { ( canMove _veh ) && { { ( alive _x ) } count ( crew _veh ) == 0 } } ) then {
		_abandoned = true;
		for "_i" from 0 to _abandonDelay do {  
			if ( { ( alive _x ) } count (crew _veh) > 0 || { !( alive _veh ) || { !( canMove _veh ) } } ) exitWith { 
				_abandoned = false; 
			};
			sleep 1;  		
		};
			
		if ( _abandoned ) then {
			deleteVehicle _veh;
			
			_vehType = switch ( _sector getVariable "owner" ) do {
				case West:{ _bluforVehicle; };
				case East:{ _opforVehicle; };
				case Independent:{ _indepVehicle; };
				default { _defaultVehicle; };
			};
			
			sleep 1;
			_veh = createVehicle [ _vehtype, _vehPos, [], 0, "CAN_COLLIDE" ];
			_veh setDir _vehDir;
			_veh setPos [ ( _vehPos select 0 ), (_vehPos select 1 ), 0 ];			
		};
	};

	if ( !( alive _veh ) || { !( canMove _veh ) } ) then {
		_dead = true;
		for "_i" from 0 to _destroyedDelay do {  
			if ( { ( alive _x ) } count ( crew _veh ) > 0 || { ( canMove _veh ) } ) exitWith { _dead = false; };
			sleep 1;  
		};
		
		if ( _dead ) then {
			deleteVehicle _veh;
			
			_vehType = switch ( _sector getVariable "owner" ) do {
				case West:{ _bluforVehicle; };
				case East:{ _opforVehicle; };
				case Independent:{ _indepVehicle; };
				default { _defaultVehicle; };
			};
			
			sleep 1;
			_veh = createVehicle [ _vehtype, _vehPos, [], 0, "CAN_COLLIDE" ];
			_veh setDir _vehDir;
			_veh setPos [ ( _vehPos select 0 ), (_vehPos select 1 ), 0 ];			
		};
		
	};
	
};

nil
