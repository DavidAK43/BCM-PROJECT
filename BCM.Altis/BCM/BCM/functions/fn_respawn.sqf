private ["_newUnit","_oldUnit"];

_newUnit = _this select 0;
_oldUnit = _this select 1;
	
deleteVehicle _oldUnit;

if ( ( typeOf _newUnit ) in ["B_officer_F","O_officer_F","I_officer_F"] ) then {
	_newUnit synchronizeObjectsAdd [ BCMSUPPORTMODULE ];
};

nil



