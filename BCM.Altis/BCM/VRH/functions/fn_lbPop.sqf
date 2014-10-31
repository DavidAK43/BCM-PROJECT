/*
	file: fn_lbPop.sqf
	author(s): Iceman77
	
	description:
	- draw useful ammunition from the config and populate the list box with the items.
	
	usage:
	_nul=[ IDC_VRH_LISTBOX_MAIN ] call VRH_fnc_lbPop;	
*/

private [ "_listBox", "_specialArray", "_muzzle", "_magArray", "_displayName", "_picture", "_index", "_loops" ];

_listBox = [ _this, 0, -1, [-1] ] call BIS_fnc_param;
lbClear _listBox;
_magArray = [];

{
	
	_magArray = if ( ( count getArray (configfile >> "CfgWeapons" >> _x >> "muzzles") ) > 1 ) then {
		_muzzle = getArray ( configfile >> "CfgWeapons" >> _x >> "muzzles" ) select 1;
		_magArray + getArray ( configfile >> "cfgWeapons" >> _x >> "magazines" ) + getArray ( configfile >> "CfgWeapons" >> _x >> _muzzle >> "magazines" );
	} else {
		_magArray + getArray ( configfile >> "cfgWeapons" >> _x >> "magazines" );
	};
			   
	if ( _forEachIndex == 2  ) then { 
		_specialArray = [
			"HandGrenade",
			"MiniGrenade",
			"SmokeShell",
			"SmokeShellBlue",
			"SmokeShellGreen", 
			"SmokeShellOrange",
			"SmokeShellRed",
			"SmokeShellYellow",
			"SmokeShellPurple",
			"Chemlight_red",
			"Chemlight_blue",
			"Chemlight_green",
			"Chemlight_yellow",
			"Laserbatteries",
			"ClaymoreDirectionalMine_Remote_Mag",
			"DemoCharge_Remote_Mag",
			"ATMine_Range_Mag",
			"APERSBoundingMine_Range_Mag",
			"APERSMine_Range_Mag",
			"APERSTripMine_Wire_Mag"
		];	
		
		{	
			_magArray pushback _x;			
		} forEach _specialArray;
		
		//reverse _magArray;
	}; 	

	
} forEach [ handGunWeapon player, primaryWeapon player, secondaryWeapon player ];

{
	_displayName = getText ( configFile >> "cfgMagazines" >> _x >> "displayName" );
	_picture = getText ( configFile >> "cfgMagazines" >> _x >> "picture" );
	_index = lbAdd [ _listBox, _displayName ];
	lbSetData [ _listBox, _index, _x ];
	lbSetPicture [ _listBox, _index, _picture ]; 
	lbSetTooltip [ _listBox, _index, _displayName ];
} forEach _magArray;
	
lbSetCurSel [ _listBox, 0 ];

nil
