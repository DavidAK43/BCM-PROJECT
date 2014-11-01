/*
	file: fn_AI.sqf
	author(s): Iceman77
	
	description:
	- Loop Ran on allGroups. Checking for nearby vehicles and assigning a waypoint at a random sector (module) every couple minutes.	 
	
	usage:
	postInit	
*/

[] spawn {

	waitUntil { time > 0 };
	
	private ["_modules","_waypoints","_vehicles","_atkPos"];
 
	_modules = allMissionObjects "ModuleSector_F";	
	
	while { true } do {
		
		sleep 5;
		
		{ 
			private ["_grp"];
			_grp = _x;
			
				_waypoints = waypoints _grp;
				{ 
					deleteWaypoint [ _grp, _foreachIndex ];
				} forEach _waypoints;
				
				_module = ( _modules select floor random count _modules );
				_atkPos = getPos _module;
				_vehicles = nearestObjects [ ( leader _grp ), [ "landVehicle", "Air" ], 100 ]; 
				
				if ( count _vehicles > 0 ) then { 
					private [ "_veh", "_vehPos" ];
					
					_veh = ( _vehicles select 0 );
					_vehPos = getPos _veh;
					
					if ((canMove _veh) && {(speed _veh < 1)}) then {
						private ["_wp1","_wp2"];
						
						_wp1 = _grp  addWaypoint [ _vehPos, 0 ];
						_wp1 setWaypointType "GETIN NEAREST";
						_wp1 setWaypointBehaviour "AWARE"; 
						_wp1 setWaypointSpeed "FULL";
						_wp1 setWaypointCombatMode "RED";
						
						_wp2 = _grp addWaypoint [ _atkPos, 1];
						_wp2 setWaypointType "MOVE";
						_wp2 setWaypointBehaviour "AWARE"; 
						_wp2 setWaypointSpeed "FULL";
						_wp2 setWaypointCombatMode "RED";					
					} else {		
						private ["_wp1"];

						_wp1 = _grp addWaypoint [ _atkPos, 0];
						_wp1 setWaypointType "MOVE";
						_wp1 setWaypointBehaviour "AWARE"; 
						_wp1 setWaypointSpeed "FULL";
						_wp1 setWaypointCombatMode "RED";					
					};				
				} else {
					private ["_wp1"];

					_wp1 = _grp addWaypoint [ _atkPos, 0];
					_wp1 setWaypointType "MOVE";
					_wp1 setWaypointBehaviour "AWARE"; 
					_wp1 setWaypointSpeed "FULL";
					_wp1 setWaypointCombatMode "RED";				
				}; 
			
		} forEach allGroups; 
		
	  sleep 60 + random 120; 
	  
	}; 
	
	
		
}; 

nil

