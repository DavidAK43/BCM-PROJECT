/*
	file: fn_bpSpawn.sqf
	author(s): Iceman77
	
	description:
	- SPAWN A CAMPING BACKPACK OR UAV TERMINALAT A RANDOM BUILDING POSITION AROUND AYONE OF THE GIVEN SECTOR MODULES PRESENT ON THE MAP
	
	- parameters:
		_this select 0 : <STRING>
						- "BCMTERMINAL" to spawn a random uav terminal
						- "BCMSPAWNPACK" to spawn a random camp pack
	usage:
	_nul=["BCMTERMINAL"] call BCM_fnc_bpSpawn;
*/

if ( !( isServer ) ) exitWith {};

private [ "_debug", "_houseArray", "_posArray", "_modules", "_positions", "_tentArray","_randTent", "_randPos", "_weaponHolder", "_mrk" ];

_type = [_this, 0, "BCMTERMINAL",["BCMSPAWNPACK","BCMTERMINAL"]] call BIS_fnc_param;
_debug = [_this, 1, false, [true]] call BIS_fnc_param;
_houseArray = [ ];
_posArray = [ ];

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

_randPos = ( _posArray select floor ( random ( count _posArray ) ) ); 

if (_type == "BCMSPAWNPACK") then {
	_tentArray = [ "B_Respawn_TentDome_F", "B_Respawn_TentA_F" ];
	_randTent = ( _tentArray select floor ( random ( count _tentArray ) ) );
	_weaponHolder = createVehicle [ "WeaponHolderSimulated", _randPos, [], 0, "CAN_COLLIDE" ]; 
	_weaponHolder addBackPackCargoGlobal [ _randTent, 1 ];
} else {
	_weaponHolder = createVehicle ["Item_B_UavTerminal", _randPos, [], 0, "CAN_COLLIDE"];
};

if ( _debug ) then {

	private ["_mrkType","_mrkColor","_mrkColorItem"];

	if (_type == "BCMTERMINAL") then {
		_mrkType = "mil_dot";
		_mrkColor = "colorBlack";
		_mrkColorItem = "colorRed";
	} else {
		_mrkType = "mil_box";
		_mrkColor = "colorBlue";
		_mrkColorItem = "colorGreen";
	};
	
	{
		if ( markerType _x == _mrkType ) then {
			deleteMarker _x;
		};
	} forEach allmapMarkers;

	{
		_mrk = createMarker [ format ["BCM_POS_M%1", random 1000], _x ]; 
		_mrk setMarkerShape "ICON"; 
		_mrk setMarkerType _mrkType; 
		_mrk setmarkerColor _mrkColor;
		_mrk setMarkerSize [0.5,0.5];
	} forEach _posArray;
	
	_mrk = createMarker [format ["BCM_ACTUAL_M%1", random 1000], getPosATL _weaponHolder ]; 
	_mrk setMarkerShape "ICON"; 
	_mrk setMarkerType _mrkType;
	_mrk setmarkerColor _mrkColorItem;
	_mrk setMarkerSize [0.75,0.75];
	
};

nil
