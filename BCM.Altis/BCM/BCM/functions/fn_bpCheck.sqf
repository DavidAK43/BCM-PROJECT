if ( !( isServer ) ) exitWith {};

[] spawn { 
	private ["_WHGRND","_WHSIMS","_delay"];

	while { true } do {

		missionNameSpace setVariable ["BCMCAMPACTIVE", false];

		{	
			if ( count allMissionObjects _x > 0 ) exitWith { 
				missionNameSpace setVariable ["BCMCAMPACTIVE", true]; 
			};
		} forEach ["Land_TentDome_F","Land_TentA_F"];

		{
			if ( ( alive _x ) && { ( backPack _x ) in ["B_Respawn_TentA_F","B_Respawn_TentDome_F"] } ) exitWith {
				missionNameSpace setVariable ["BCMCAMPACTIVE", true];
			};
		} forEach allUnits;

		_WHSIMS = allMissionObjects "weaponHolderSimulated";
		_WHGRND = allMissionObjects "groundWeaponHolder";

		{
			if ( getBackpackCargo _x select 0 select 0 in ["B_Respawn_TentA_F","B_Respawn_TentDome_F"] ) exitWith {
				missionNameSpace setVariable ["BCMCAMPACTIVE", true]; 
			};
		} forEach _WHGRND + _WHSIMS ;
		
		if ( !( missionNameSpace getVariable "BCMCAMPACTIVE" ) ) then {
			_nul=call BCM_fnc_bpSpawn;	
			[ [ "BCM_GENERIC_PROFILECOLOR_MSG" , [ "Mobile Re-spawn Camp", "The mobile respawn camp has been reset", "\A3\ui_f\data\map\markers\nato\respawn_inf_ca.paa", "" ] ], "BIS_fnc_showNotification" ] call BIS_fnc_MP;	
		};
		
		sleep 60;
	};
};

nil
