/*
	file: fn_markers3D.sqf
	author(s): Iceman77
	
	description:
	- Adds oneachFrame stacked EH that renders 3D markers on players, corpses, ammo dumps, and the mobile respawn camp pack 
	
	usage:
	postInit	
*/

if ( isDedicated ) exitWith {};
waitUntil { ! ( isNull player ) && ( player == player ) };

if ( ( paramsArray select 3 ) == 1) then { 

BCMAMMOBOXARRAY = allMissionObjects "Land_Pallet_MilBoxes_F";

	["BCM3DIcons", "onEachFrame", { 

		{
			if ( ( player distance _x < ( paramsArray select 4 ) ) && { ( _x != player ) } ) then {
			
				private [ "_visPos" ];
				_visPos = visiblePosition _x;
				_visPos set [ 2, ( ( getPosATL _x ) select 2 ) + 3 ];
			
				switch ( side _x ) do {
				
					case West:{ 
						if ( _x in units ( group player ) ) then {
							drawIcon3D [ "\a3\ui_f\data\map\Markers\NATO\b_inf.paa", [ 0, 1, 0, 0.75 ], _visPos, 1, 1, 0, ( name _x ), 0, 0.03 ];
						} else {
							if ( ( side _x ) == ( side player ) ) then {
								drawIcon3D [ "\a3\ui_f\data\map\Markers\NATO\b_inf.paa", [ 0, 0, 1, 0.5 ], _visPos, 1, 1, 0, ( name _x ), 0, 0.03 ];
							} else {
								if ( player knowsAbout _x >= 4 ) then {
									drawIcon3D [ "\A3\ui_f\data\map\markers\military\warning_CA.paa", [ 1, 0, 0, 0.5 ], _visPos, 0.5, 0.5, 0, ( name _x ), 0, 0.03 ];
								};
							};
						};
					};
					case East:{ 
						if ( _x in units ( group player ) ) then {
							drawIcon3D [ "\a3\ui_f\data\map\Markers\NATO\o_inf.paa", [ 0, 1, 0, 0.75  ], _visPos, 1, 1, 0, ( name _x ), 0, 0.03 ];
						} else {
							if ( ( side _x ) == ( side player ) ) then {
								drawIcon3D [ "\a3\ui_f\data\map\Markers\NATO\o_inf.paa", [ 1, 0, 0, 0.5 ], _visPos, 1, 1, 0, ( name _x ), 0, 0.03 ];
							} else {
								if ( player knowsAbout _x >= 4 ) then {
									drawIcon3D [ "\A3\ui_f\data\map\markers\military\warning_CA.paa", [ 1, 0, 0, 0.5 ], _visPos, 0.5, 0.5, 0, ( name _x ), 0, 0.03 ];
								};
							};
						}; 
					};
					case Independent:{ 
						if ( _x in units ( group player ) ) then {
							drawIcon3D [ "\a3\ui_f\data\map\Markers\NATO\n_inf.paa", [ 0, 1, 0, 0.75 ], _visPos, 1, 1, 0, ( name _x ), 0, 0.03 ];
						} else {
							if ( ( side _x ) == ( side player ) ) then {
								drawIcon3D [ "\a3\ui_f\data\map\Markers\NATO\n_inf.paa", [ 1, 1, 0, 0.5 ], _visPos, 1, 1, 0, ( name _x ), 0, 0.03 ];
							} else {
								if ( player knowsAbout _x >= 4 ) then {
									drawIcon3D [ "\A3\ui_f\data\map\markers\military\warning_CA.paa", [ 1, 0, 0, 0.5 ], _visPos, 0.5, 0.5, 0, ( name _x ), 0, 0.03 ];
								};
							};
						};  
					};
					default { 
						if ( _x in units ( group player ) ) then {
								drawIcon3D [ "\a3\ui_f\data\map\Markers\NATO\b_inf.paa", [ 0, 1, 0, 0.75 ], _visPos, 1, 1, 0, ( name _x ), 0, 0.03 ];
						} else {
							if ( ( side _x ) == ( side player ) ) then {
								drawIcon3D [ "\a3\ui_f\data\map\Markers\NATO\b_inf.paa", [ 0, 0, 1, 0.5 ], _visPos, 1, 1, 0, ( name _x ), 0, 0.03 ];
							} else {
								if ( player knowsAbout _x >= 4 ) then {
									drawIcon3D [ "\A3\ui_f\data\map\markers\military\warning_CA.paa", [ 1, 0, 0, 0.5 ], _visPos, 0.5, 0.5, 0, ( name _x ), 0, 0.03 ];
								};
							};
						};  
					};	
				};				
			};	
		} forEach allUnits; 

		{ 
			if ( player distance _x < 150 && { ( vehicle _x ) == _x && { ( player knowsAbout _x >= 4 ) && { ( _x isKindOf "CAManBase" ) } } } ) then {
				private [ "_visPos" ];
				_visPos = getPosATL _x;
				_visPos set [ 2, ( ( getPosATL _x ) select 2 ) + 2 ];
				drawIcon3D [ "\a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa", [ 1, 0, 0, 0.75 ], _visPos, 0.75, 0.75, 0, "Dead", 0, 0.03 ];
			};
		} forEach allDeadMen;	
		
		{
			if ( player distance _x < 50 ) then {
				private [ "_visPos" ];
				_visPos = getPosATL _x;
				_visPos set [ 2, ( ( getPosATL _x ) select 2 ) + 3 ];
				drawIcon3D [ "\a3\ui_f\data\gui\cfg\hints\Firemode_ca.paa", [ 1,1,1, 0.75 ], _visPos, 0.5, 0.5, 0, "Ammo", 0, 0.03 ];
			};
		} forEach BCMAMMOBOXARRAY;
		
		{
			if ( player distance _x < 10 ) then {
				private [ "_visPos" ];
				_visPos = getPosATL _x;
				_visPos set [ 2, ( ( getPosATL _x ) select 2 ) + 1 ];
				drawIcon3D [ "\a3\ui_f\data\gui\cfg\hints\Gear_ca.paa", [ 1,1,1, 0.75 ], _visPos, 0.5, 0.5, 45, "UAV Packs", 0, 0.03 ];
			};
		} forEach [BCMNATOTABLE,BCMCSATTABLE,BCMINDEPTABLE];
		
		if ( ( getBackPackCargo ( nearestObjects [ player, [ "WeaponHolderSimulated", "groundWeaponHolder" ], 8 ] select 0 ) select 0 ) select 0 in [ "B_Respawn_TentDome_F", "B_Respawn_TentA_F" ] ) then {
			private [ "_visPos" ];
			_visPos = getPosATL ( nearestObjects [ player, [ "WeaponHolderSimulated","groundWeaponHolder" ], 8 ] select 0 );
			_visPos set [ 2, ( getPosATL ( nearestObjects [ player, [ "WeaponHolderSimulated", "groundWeaponHolder" ], 8 ] select 0 ) select 2 ) + 1 ];
			drawIcon3D [ "\a3\ui_f\data\gui\cfg\hints\ActionMenu_ca.paa", [ 0,1,0, 0.75 ], _visPos, 0.5, 0.5, 45, "Mobile Respawn Camp", 0, 0.025 ];
		};
		
		if ( ( getitemCargo ( nearestObjects [ player, [ "WeaponHolderSimulated", "groundWeaponHolder" ], 8 ] select 0 ) select 0 ) select 0 in [ "B_UavTerminal","O_UavTerminal","I_UavTerminal" ] ) then {
			private [ "_visPos" ];
			_visPos = getPosATL ( nearestObjects [ player, [ "WeaponHolderSimulated","groundWeaponHolder" ], 8 ] select 0 );
			_visPos set [ 2, ( getPosATL ( nearestObjects [ player, [ "WeaponHolderSimulated", "groundWeaponHolder" ], 8 ] select 0 ) select 2 ) + 1 ];
			drawIcon3D [ "\a3\ui_f\data\gui\cfg\hints\UAVBasic_ca.paa", [ 0,1,0, 0.75 ], _visPos, 0.5, 0.5, 45, "UAV Terminal", 0, 0.025 ];
		};
		
		if (count (nearestObjects [ player, [ "Item_B_UavTerminal","Item_O_UavTerminal","Item_I_UavTerminal"  ], 8 ]) > 0) then {
			private [ "_visPos" ];
			_visPos = getPosATL (nearestObjects [ player, [ "Item_B_UavTerminal","Item_O_UavTerminal","Item_I_UavTerminal"  ], 8 ] select 0);
			//_visPos set [ 2, getPosATL (nearestObjects [ player, [ "Item_B_UavTerminal","Item_O_UavTerminal","Item_I_UavTerminal" ], 8 ] select 0) select 2 + 1 ];
			drawIcon3D [ "\a3\ui_f\data\gui\cfg\hints\UAVBasic_ca.paa", [ 1,1,1, 0.75 ], _visPos, 1, 1, 45, "UAV Terminal", 0, 0.025 ];
		};
		
		if ( ( paramsArray select 5 ) == 0 ) then { 
			player setFatigue 0; 
		};

	}] call BIS_fnc_addStackedEventHandler;
	
};

nil
