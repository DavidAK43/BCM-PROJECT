/*
	file: fn_vehFlip.sqf
	author(s): Iceman77
	
	description:
	flip an overturned vehicle back upright (addaction condition permitting)
	
	usage:
	addaction (fn_clientInit.sqf)
*/

private ["_caller","_veh"];
_caller = _this select 1;
_veh = nearestObjects [_caller, ["landVehicle"], 5] select 0;
_veh setVectorUp [0,0,1];
_veh setPosATL [(getPosATL _veh) select 0, (getPosATL _veh) select 1, 0];  

nil
