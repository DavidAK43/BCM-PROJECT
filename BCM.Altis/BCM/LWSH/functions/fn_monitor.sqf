/*
	file: fn_monitor.sqf
	author(s): Iceman77
	
	description:
	- Monitors player's health and fatigue. Setting the progress bar controls and colors accordingly 
	
	usage:
	[] spawn LWSH_fnc_monitor;	
*/

[] spawn { 

	( "LWSH_Layer" call BIS_fnc_rscLayer ) cutRsc [ "LWSH_HUD","PLAIN" ];

	IDD_LWSH_MAIN_DISPLAY   		=	600210;
	IDC_LWSH_BG_PICTURE_HEALTH 	=	700310;
	IDC_LWSH_BG_PICTURE_FATIGUE 	=	700311;
	IDC_LWSH_BG_PROGRESS_HEALTH 	=	700312;
	IDC_LWSH_BG_PROGRESS_FATIGUE 	=	700313;
	IDC_LWSH_PROGRESS_HEALTH 		=	800410;
	IDC_LWSH_PROGRESS_FATIGUE 		=	800411;
	IDC_LWSH_PICTURE_HEALTH 		=	900510;
	IDC_LWSH_PICTURE_FATIGUE 		=	900511;

	#define LWSHdisplay (uiNamespace getVariable "LWSH_Display") 
	#define LWSHctrl(ctrl) ((uiNamespace getVariable "LWSH_Display") displayCtrl ctrl)

	waitUntil { ! ( isNull ( LWSHdisplay ) ) };
	
	while { ! ( isNull ( LWSHdisplay ) ) } do {	
	
		LWSHctrl(IDC_LWSH_PROGRESS_HEALTH) progressSetPosition ( 1 - ( damage player ) );
		LWSHctrl(IDC_LWSH_PROGRESS_FATIGUE) progressSetPosition ( 1 - ( getFatigue player ) );
		
		switch ( true ) do {
		
			case ( ( getDammage Player ) >= 0.75 ) : { 
				LWSHctrl(IDC_LWSH_BG_PICTURE_HEALTH) ctrlSetBackgroundColor [ 1, 0, 0, 0.75 ];
				LWSHctrl(IDC_LWSH_BG_PROGRESS_HEALTH) ctrlSetBackgroundColor [ 1, 0, 0, 0.75 ];			
			};
			case ( ( getDammage Player ) >= 0.5 ) : { 
				LWSHctrl(IDC_LWSH_BG_PICTURE_HEALTH) ctrlSetBackgroundColor [ 1, 0.645, 0, 0.75 ];
				LWSHctrl(IDC_LWSH_BG_PROGRESS_HEALTH) ctrlSetBackgroundColor [ 1, 0.645, 0, 0.75 ];			
			};
			case ( ( getDammage Player ) >= 0.25 ) : { 
				LWSHctrl(IDC_LWSH_BG_PICTURE_HEALTH) ctrlSetBackgroundColor [ 1, 1, 0, 0.75 ]; 
				LWSHctrl(IDC_LWSH_BG_PROGRESS_HEALTH) ctrlSetBackgroundColor [ 1, 1, 0, 0.75 ];
			}; 
			case ( ( getDammage Player ) < 0.25 ) : { 
				LWSHctrl(IDC_LWSH_BG_PICTURE_HEALTH) ctrlSetBackgroundColor [ 0, 0.75, 0, 0.75 ]; 
				LWSHctrl(IDC_LWSH_BG_PROGRESS_HEALTH) ctrlSetBackgroundColor [ 0.25, 0.25, 0.25, 0.5 ]; 
			}; 
				
		};
		
		switch ( true ) do {
		
			case ( ( getFatigue Player ) >= 0.60 ) : { 
				LWSHctrl(IDC_LWSH_BG_PICTURE_FATIGUE) ctrlSetBackgroundColor [ 1, 0, 0, 0.75 ]; 
				LWSHctrl(IDC_LWSH_BG_PROGRESS_FATIGUE) ctrlSetBackgroundColor [ 1, 0, 0, 0.75 ];
			};
			case ( ( getFatigue Player ) >= 0.40 ) : { 
				LWSHctrl(IDC_LWSH_BG_PICTURE_FATIGUE) ctrlSetBackgroundColor [ 1, 0.645, 0, 0.75 ];
				LWSHctrl(IDC_LWSH_BG_PROGRESS_FATIGUE) ctrlSetBackgroundColor [ 1, 0.645, 0, 0.75 ];		
			};
			case ( ( getFatigue Player ) >= 0.20 ) : { 
				LWSHctrl(IDC_LWSH_BG_PICTURE_FATIGUE) ctrlSetBackgroundColor [ 1, 1, 0, 0.75 ]; 
				LWSHctrl(IDC_LWSH_BG_PROGRESS_FATIGUE) ctrlSetBackgroundColor [ 1, 1, 0, 0.75 ];
			}; 
			case ( ( getFatigue Player ) < 0.20 ) : { 
				LWSHctrl(IDC_LWSH_BG_PICTURE_FATIGUE) ctrlSetBackgroundColor [ 0, 0, 1, 0.75 ]; 
				LWSHctrl(IDC_LWSH_BG_PROGRESS_FATIGUE) ctrlSetBackgroundColor [ 0.25, 0.25, 0.25, 0.5 ]; 
			}; 		
			
		};	
		
	  sleep 0.1;	
	  
	};
	
};

nil
