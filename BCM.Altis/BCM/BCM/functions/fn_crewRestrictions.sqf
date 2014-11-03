if ((paramsArray select 6) == 0) exitWith {};

private ["_vehicle","_position","_unit","_sideVehicle","_sideUnit"];

_vehicle = _this select 0;
_position = _this select 1;
_unit = _this select 2;

_sideVehicle = getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "side");
_sideUnit = getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "side");

if (_sideVehicle == 3) exitWith {};

if ( _sideVehicle != _sideUnit ) exitWith {
	_unit action ["Eject", _vehicle];
	[
		"BCM_GENERIC_RED_MSG",
		[
			"Side Restrictions", 
			format ["You can't use %1 vehicles !!!", [_sideVehicle] call BIS_fnc_sideName] ,
			"\A3\ui_f\data\map\markers\military\warning_CA.paa",
			""
		]
	] call BIS_fnc_showNotification;	
	nil
};

if (isNil "BCMDRIVINGMSG" && {(_vehicle isKindOf "Car")}) then {
	[["Vehicle","Driving"], 60, nil, 60, nil, true, nil, true, true] call BIS_fnc_advHint;
	BCMDRIVINGMSG = 1;
};
if (isNil "BCMCOUNTERMEASURESMSG" && {(_vehicle isKindOf "Car")}) then {
	[["Vehicle","Countermeasures"], 60, nil, 60, nil, true, nil, true, true] call BIS_fnc_advHint;
	BCMCOUNTERMEASURESMSG = 1;
};
if (isNil "BCMARMORMSG" && {(_vehicle isKindOf "Car")}) then {
	[["Guide","armor"], 60, nil, 60, nil, true, nil, true, true] call BIS_fnc_advHint;
	BCMARMORMSG = 1;
};

nil
