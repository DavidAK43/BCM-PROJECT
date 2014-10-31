/*
	- loop ran on AI. Checking for nearby vehicles and assigning a waypoint at a random sector (module) every couple minutes.	 
*/

[] spawn { // NEW THREAD TO WORK WITH POSTINIT SCHEDULING (TRYING TO KEEP ROOT MISSION DIRECTORY CLEAN AS POSSIBLE) 

	waitUntil { time > 0 };
	
	private ["_modules","_grp","_waypoints","_vehicles","_atkPos"];
	
	// ------------- Store the sector modules 
	_modules = allMissionObjects "ModuleSector_F";	
	
	// ---------- Start main loop to control Ai waypoints 
	while { true } do {
		
		
		{ // ------------------ forEach allGroups
			
		
			_grp = _x;
			
			// -------- Store & Delete the group's current waypoints 
			_waypoints = waypoints _grp;
			{ 
				deleteWaypoint [ _grp, _foreachIndex ];
			} forEach _waypoints;
			
			// --------------- Select a random module and store it's position. Store nearby vehicles.
			_module = ( _modules select floor random count _modules );
			_atkPos = getPos _module;
			_vehicles = nearestObjects [ ( leader _grp ), [ "landVehicle", "Air" ], 100 ]; 
			
			// ---------------- If there were some nearby vehicles and the group leader isn't in a vehicle then...
			if ( count _vehicles > 0 && { vehicle ( leader _grp ) == ( leader _grp ) } ) then { 
				private [ "_veh", "_vehPos" ];
				
				// ...Store the closest vehicle and it's position
				_veh = ( _vehicles select 0 );
				_vehPos = getPos _veh;
				
				// ------------ If the vehicle is empty and can move then...
				if ( count ( crew _veh ) == 0 && { ( canMove _veh ) } ) then {
					private ["_wp1","_wp2"];
					
					// ...Assign the following waypoints
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
				} else { // ------------ The vehicle was occupied or couldn't move so...			
					private ["_wp1"];

					// ... Just give a simple move waypoint
					_wp1 = _grp addWaypoint [ _atkPos, 0];
					_wp1 setWaypointType "MOVE";
					_wp1 setWaypointBehaviour "AWARE"; 
					_wp1 setWaypointSpeed "FULL";
					_wp1 setWaypointCombatMode "RED";					
				};				
			} else { // There were no nearby vehicles so...
				private ["_wp1"];

				// ... just give a simple move waypoint
				_wp1 = _grp addWaypoint [ _atkPos, 0];
				_wp1 setWaypointType "MOVE";
				_wp1 setWaypointBehaviour "AWARE"; 
				_wp1 setWaypointSpeed "FULL";
				_wp1 setWaypointCombatMode "RED";				
			}; 
			
			
			
		} forEach allGroups; // ----------------- END FOREACH
		
	  sleep 60 + random 120; 
	  
	}; // -------------- LOOP END
	
		
		
}; // END THREAD

nil

