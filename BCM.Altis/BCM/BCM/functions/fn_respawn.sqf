/*
	file: fn_respawn.sqf
	author(s): Iceman77
	
	description:
	- Triggered via the respawn EH (added in fn_clientInit.sqf)  
	- delete the old unit's corpse upon respawn.
	- re-add actions and sync modules (if applicable)
	
	usage:
	player addEventHandler [ "respawn", "_this call BCM_fnc_respawm"];
*/

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

_newUnit addAction [
	"<t color='#0099FF'>VIRTUAL REARMING HUB</t>", 
	{ _nul=call VRH_fnc_uiInit; },
	[],
	6,
	true,
	true,
	"",
	"{ cursorTarget isKindOf _x } count [ 'ReammoBox_F','Land_Pallet_MilBoxes_F' ] > 0 && { _target distance cursorTarget <= 5 }"
];  
	
if ( ( typeOf _newUnit ) in ["B_officer_F","O_officer_F","I_officer_F"] ) then {
	_newUnit synchronizeObjectsAdd [ BCMSUPPORTMODULE ];
};

nil



