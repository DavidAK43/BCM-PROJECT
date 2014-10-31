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

player addAction [
	"<t color='#0099FF'>VIRTUAL REARMING HUB</t>", 
	{ call VRH_fnc_uiInit; },
	[],
	6,
	true,
	true,
	"",
	"{ cursorTarget isKindOf _x } count [ 'ReammoBox_F','Land_Pallet_MilBoxes_F' ] > 0 && { _target distance cursorTarget <= 5 }"
];  

player addEventHandler ["Respawn", {
	( _this select 0 ) addAction [
		"<t color='#0099FF'>VIRTUAL REARMING HUB</t>", 
		{ call VRH_fnc_uiInit; },
		[],
		6,
		true,
		true,
		"",
		"{ cursorTarget isKindOf _x } count [ 'ReammoBox_F','Land_Pallet_MilBoxes_F' ] > 0 && { _target distance cursorTarget <= 5 }"
	];  
}];  

if ( true ) exitWith {};