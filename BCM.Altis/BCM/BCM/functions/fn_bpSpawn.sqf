// SPAWN A CAMPING BACKPACK AT A RANDOM BUILDING POSITION AROUND AYONE OF THE GIVEN SECTOR MODULES PRESENT ON THE MAP

if ( !( isServer ) ) exitWith {};

private [ "_debug", "_houseArray", "_posArray", "_modules", "_positions", "_tentArray","_randTent", "_randPos", "_weaponHolder", "_mrk" ];

_debug = true;
_houseArray = [ ];
_posArray = [ ];

// credit to deadedentity for bringing the buildingPositions function to my attention
_modules = allMissionObjects "ModuleSector_F";
{
	_houseArray = nearestObjects [ _x, [ "House_F" ], 100 ];
	{
		_positions = [ _x ] call BIS_fnc_buildingPositions;
		if ( count _positions > 0 ) then {
			{
				_posArray pushBack _x;
			} forEach _positions;
		};
	} forEach _houseArray;
	
} forEach _modules;

_tentArray = [ "B_Respawn_TentDome_F", "B_Respawn_TentA_F" ];
_randTent = ( _tentArray select floor ( random ( count _tentArray ) ) );
_randPos = ( _posArray select floor ( random ( count _posArray ) ) ); 
_weaponHolder = createVehicle [ "WeaponHolderSimulated", _randPos, [], 0, "CAN_COLLIDE" ]; 
_weaponHolder addBackPackCargoGlobal [ _randTent, 1 ];

{
	if ( markerType _x == "mil_dot" ) then {
		deleteMarker _x;
	};
} forEach allmapMarkers;

if ( _debug ) then {

	{
		_mrk = createMarker [ format ["BCM_POS_M%1", _forEachIndex], _x ]; 
		_mrk setMarkerShape "ICON"; 
		_mrk setMarkerType "mil_dot"; 
		_mrk setmarkerColor "colorBLUE";
	} forEach _posArray;
	
	_mrk = createMarker ["BCM_ACTUAL_M", getPosATL _weaponHolder ]; 
	_mrk setMarkerShape "ICON"; 
	_mrk setMarkerType "mil_dot";
	_mrk setmarkerColor "colorRED";
	
};

/*
if ( isNil "BCMBPCHECK" ) then {
	_nul = []spawn BCM_fnc_bpCheck;
	BCMBPCHECK = true;
};
*/

nil
