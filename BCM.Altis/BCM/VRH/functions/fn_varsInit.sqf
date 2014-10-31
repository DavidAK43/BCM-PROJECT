/*
	file: fn_varsInit.sqf
	author(s): Iceman77
	
	description:
	- Store display IDD and control IDCs into local global variables 
	
	usage:
	postInit	
*/

if ( isDedicated ) exitWith {};
waitUntil { !( isNull player ) }; 

// VRH IDD
IDD_VRH_DISPLAY          	=   400200;
// BUTTONS
IDC_VRH_BUTTON_UNIFORM 	=	100300;
IDC_VRH_BUTTON_VEST 		=	100301;
IDC_VRH_BUTTON_BACKPACK	=	100302;
// LISTBOXES
IDC_VRH_LISTBOX_MAIN		=	200300;
// PROGRESS BARS
IDC_VRH_PROGRESS_UNIFORM	=	300300;
IDC_VRH_PROGRESS_VEST		=	300301;
IDC_VRH_PROGRESS_BACKPACK	=	300302;

nil
