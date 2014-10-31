private ["_newUnit","_oldUnit"];

_newUnit = _this select 0;
_oldUnit = _this select 1;
	
deleteVehicle _oldUnit;

_newUnit addAction [
	"Flip Vehicle", 
	{_nul=call BCM_fnc_vehFlip;}, 
	[], 
	0, 
	false, 
	true, 
	"", 
	"_this == (vehicle _target) && {(count nearestObjects [_target, ['landVehicle'], 5]) > 0 && {(vectorUp cursorTarget) select 2 < 0}}"
];

if ( ( typeOf _newUnit ) in ["B_officer_F","O_officer_F","I_officer_F"] ) then {
	_newUnit synchronizeObjectsAdd [ BCMSUPPORTMODULE ];
};

nil



