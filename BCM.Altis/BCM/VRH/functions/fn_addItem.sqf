private [ "_listBox", "_container", "_index", "_className" ];

_listBox = [ _this, 0, 0, [0] ] call BIS_fnc_param;
_container = [ _this, 1, "", [""] ] call BIS_fnc_param;
_index = lbCurSel _listBox;
_className = lbData [ _listBox, _index ];

call compile format ["
	if ( player canAddItemTo%1 _className ) then {
		player addItemTo%1 _className;
		hintSilent 'Added %2 to your %1';		
	} else {
		hint 'No room in your %1 for a %2';
	};
", _container, _className ];

call VRH_fnc_pBar;

if ( true ) exitWith {};