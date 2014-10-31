/*
	file: fn_pBar.sqf
	author(s): Iceman77
	
	description:
	- Set the progress bars accordingly with the player's container's loads
	
	usage:
	_nul=call VRH_fnc_pBar;	
*/

{

	(   ( findDisplay IDD_VRH_DISPLAY ) displayCtrl ( _x select 0 )   ) progressSetPosition ( _x select 1 );
	
} foreach [ [ IDC_VRH_PROGRESS_UNIFORM, loadUniform player ], [ IDC_VRH_PROGRESS_VEST, loadVest player ], [ IDC_VRH_PROGRESS_BACKPACK, loadBackPack player ] ];

nil
