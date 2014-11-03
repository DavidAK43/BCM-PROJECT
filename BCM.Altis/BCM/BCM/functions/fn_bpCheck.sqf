/*
	file: fn_bpCheck.sqf
	author(s): Iceman77
	
	description:
	- Monitor for a null camp pack or tent on the ground and in all units current backpacks
	- If no camp oir camp pack exists, then rerun the script that randomly creates the backpack
	
	usage:
	postInit
*/

if ( !( isServer ) ) exitWith {};

[] spawn { 

	private ["_WHGRND","_WHSIMS"];
	
	while { true } do {

		missionNameSpace setVariable ["BCMCAMPACTIVE", false];
		missionNameSpace setVariable ["BCMTERMINALACTIVE", false]; 
		
		{	
			if ( count allMissionObjects _x > 0 ) exitWith { 
				missionNameSpace setVariable ["BCMCAMPACTIVE", true]; 
			};
		} forEach ["Land_TentDome_F","Land_TentA_F"];

		{
			private ["_unit"];
			_unit = _x;
			
			if ( ( alive _unit ) && { ( backPack _unit ) in ["B_Respawn_TentA_F","B_Respawn_TentDome_F"] } ) exitWith {
				missionNameSpace setVariable ["BCMCAMPACTIVE", true];
			};
			
			{
				private ["_item"];
				_item = _x;
				if (_item in ["B_UavTerminal","O_UavTerminal","I_UavTerminal"]) exitWith {
					missionNameSpace setVariable ["BCMTERMINALACTIVE", true]; 
				};
			} forEach (assignedItems _unit) + (backPackItems _unit) + (vestItems _unit) + (uniformItems _unit);
		} forEach allUnits;
		
		_WHSIMS = allMissionObjects "weaponHolderSimulated";
		_WHGRND = allMissionObjects "groundWeaponHolder";
		_terminals = allMissionObjects "Item_B_UavTerminal" + allMissionObjects "Item_O_UavTerminal" + allMissionObjects "Item_I_UavTerminal";
		if (count _terminals > 0) then {
			missionNameSpace setVariable ["BCMTERMINALACTIVE", true]; 
		};
		
		{
			if ( getBackpackCargo _x select 0 select 0 in ["B_Respawn_TentA_F","B_Respawn_TentDome_F"] ) exitWith {
				missionNameSpace setVariable ["BCMCAMPACTIVE", true]; 
			};
			if ( getItemCargo _x select 0 select 0 in ["B_UavTerminal","O_UavTerminal","I_UavTerminal"] ) exitWith {
				missionNameSpace setVariable ["BCMTERMINALACTIVE", true]; 
			};
		} forEach _WHGRND + _WHSIMS ;
		
		if ( !( missionNameSpace getVariable "BCMCAMPACTIVE" ) ) then {
			_nul=["BCMSPAWNPACK", true] call BCM_fnc_bpSpawn;	
			[ 
				[ 
					"BCM_GENERIC_PROFILECOLOR_MSG" , 
					[ 
						"Mobile Re-spawn Camp", 
						"The mobile respawn camp has been reset", 
						"\A3\ui_f\data\map\markers\nato\respawn_inf_ca.paa", 
						"" 
					] 
				], 
				"BIS_fnc_showNotification" 
			] call BIS_fnc_MP;	
			
			private ["_placeHolder"];
			{
				if (true) exitWith {
					_placeHolder = _x;
				};
			} forEach allUnits;
			_placeHolder setVariable ["BCMCAMPOWNER", sideUnknown, true];
			
		};
		
		if ( !( missionNameSpace getVariable "BCMTERMINALACTIVE" ) ) then {
			_nul=["BCMTERMINAL", true] call BCM_fnc_bpSpawn;	
			[ 
				[ 
					"BCM_GENERIC_PROFILECOLOR_MSG" , 
					[ 
						"UAV Terminal", 
						"The UAV terminal has been reset", 
						"\a3\ui_f\data\gui\cfg\hints\UAVBasic_ca.paa", 
						"" 
					] 
				], 
				"BIS_fnc_showNotification" 
			] call BIS_fnc_MP;	
			
			private ["_placeHolder"];
			{
				if (true) exitWith {
					_placeHolder = _x;
				};
			} forEach allUnits;
			_placeHolder setVariable ["BCMTERMINALOWNER", sideUnknown, true];
		};		
		
		sleep 300;
	};
	
	
};

nil
