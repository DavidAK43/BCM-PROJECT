#include "macros.hpp"

class VRH_Dialog 
{
	idd = IDD_VRH_DISPLAY;
	
	controls[]=
	{
		VRH_BG_MAIN,
		VRH_text_topStrip,
		VRH_main_LB,
		VRH_Progress_uniform,
		VRH_Progress_vest,
		VRH_Progress_backPack,
		VRH_btn_uni,
		VRH_btn_vest,
		VRH_btn_bp,
		VRH_btn_exit	
	}; 
	
	// BACKGROUNDS
	class VRH_BG_MAIN: IGUIBack
	{
		idc = -1;
		x = 0.4 * safezoneW + safezoneX;
		y = 0.4 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.15 * safezoneH;
	};

	// TEXTS
	class VRH_text_topStrip: RscText
	{
		idc = -1;
		colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",0.85};
		text = "VRH";
		x = 0.4 * safezoneW + safezoneX;
		y = 0.372 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.025 * safezoneH;
	};
	
	// BUTTONS
	class VRH_btn_uni: RscButton
	{
		idc = IDC_VRH_BUTTON_UNIFORM;
		text = "Add To Uniform";
		x = 0.4 * safezoneW + safezoneX;
		y = 0.5525 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.025 * safezoneH;
		action = "[ IDC_VRH_LISTBOX_MAIN, 'Uniform' ] call VRH_fnc_addItem;";
	};
	class VRH_btn_vest: RscButton
	{
		idc = IDC_VRH_BUTTON_VEST;
		text = "Add To Vest";
		x = 0.4 * safezoneW + safezoneX;
		y = 0.5800 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.025 * safezoneH;
		action = "[ IDC_VRH_LISTBOX_MAIN, 'Vest'] call VRH_fnc_addItem;";
	};
	class VRH_btn_bp: RscButton
	{
		idc = IDC_VRH_BUTTON_BACKPACK;
		text = "Add to BackPack";
		x = 0.4 * safezoneW + safezoneX;
		y = 0.606 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.025 * safezoneH;
		action = "[ IDC_VRH_LISTBOX_MAIN, 'BackPack'] call VRH_fnc_addItem;";
	};
	class VRH_btn_exit: RscButton
	{
		idc = -1;
		text = "X";
		colorBackground[] = {0,0,0,0};
		x = 0.575 * safezoneW + safezoneX;
		y = 0.372 * safezoneH + safezoneY;
		w = 0.025 * safezoneW;
		h = 0.025 * safezoneH;
		action = "closeDialog 0;";
	};
	
	// LISTBOXES
	class VRH_main_LB: RscListBox
	{
		idc = IDC_VRH_LISTBOX_MAIN;
		x = 0.405 * safezoneW + safezoneX;
		y = 0.405 * safezoneH + safezoneY;
		w = 0.18775 * safezoneW;
		h = 0.1375 * safezoneH;
	};
	
	// PROGRESS BARS
	class VRH_Progress_uniform: RscProgress 
	{ 
		idc = IDC_VRH_PROGRESS_UNIFORM;
		x = 0.4 * safezoneW + safezoneX;
		y = 0.5525 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.025 * safezoneH;
	}; 
	class VRH_Progress_vest: RscProgress 
	{ 
		idc = IDC_VRH_PROGRESS_VEST; 
		x = 0.4 * safezoneW + safezoneX;
		y = 0.5800 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.025 * safezoneH;
	}; 
	class VRH_Progress_backPack: RscProgress 
	{ 
		idc = IDC_VRH_PROGRESS_BACKPACK;
		x = 0.4 * safezoneW + safezoneX;
		y = 0.606 * safezoneH + safezoneY;
		w = 0.2 * safezoneW;
		h = 0.025 * safezoneH;
	}; 
}; 
