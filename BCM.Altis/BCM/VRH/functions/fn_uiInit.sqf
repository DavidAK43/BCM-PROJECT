/*
	file: fn_uiInit.sqf
	author(s): Iceman77
	
	description:
	- create the ui and call functions that populate the ListBox, disable buttons, and set progress bars 
	
	usage:
	addAction
*/

createDialog "VRH_Dialog";

waitUntil { !( isNull ( findDisplay IDD_VRH_DISPLAY ) ) };
_nul=[ IDC_VRH_LISTBOX_MAIN ] call VRH_fnc_lbPop;
_nul=call VRH_fnc_pBar;

{

	if ( ( _x select 0 ) == "" ) then { ctrlEnable [ ( _x select 1 ), false ]; }; 
	
} forEach [ [ uniform player, IDC_VRH_BUTTON_UNIFORM ], [ vest player, IDC_VRH_BUTTON_VEST ], [ backPack player, IDC_VRH_BUTTON_BACKPACK ] ];

nil
