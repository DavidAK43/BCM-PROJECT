// DEFINE CONTROLS IDC'S
#define IDD_LWSH_MAIN_DISPLAY   			600210
#define IDC_LWSH_BG_PICTURE_HEALTH 			700310
#define IDC_LWSH_BG_PICTURE_FATIGUE 		700311
#define IDC_LWSH_BG_PROGRESS_HEALTH 		700312
#define IDC_LWSH_BG_PROGRESS_FATIGUE 		700313
#define IDC_LWSH_PROGRESS_HEALTH 			800410
#define IDC_LWSH_PROGRESS_FATIGUE 			800411
#define IDC_LWSH_PICTURE_HEALTH 			900510
#define IDC_LWSH_PICTURE_FATIGUE 			900511

// DISPLAY
class LWSH_HUD
{
	idd = IDD_LWSH_MAIN_DISPLAY; 
	duration = 1e+1000; 
	fadeIn = 0; 
	fadeOut = 0; 
	onLoad = "uiNamespace setVariable ['LWSH_Display', _this select 0];"; 
	
	// CONTROLS
	controls[]=
	{
		LWSH_BG_PICTURE_HEALTH,
		LWSH_BG_PICTURE_FATIGUE,
		LWSH_BG_PROGRESS_HEALTH,
		LWSH_BG_PROGRESS_FATIGUE,
		LWSH_PROGRESS_HEALTH,
		LWSH_PROGRESS_FATIGUE,
		LWSH_PICTURE_HEALTH,
		LWSH_PICTURE_FATIGUE	
	};
	
	// BACKGROUNDS
	class LWSH_BG_PICTURE_HEALTH : IGUIBack
	{
		idc = IDC_LWSH_BG_PICTURE_HEALTH;
		x = 0.00210458 * safezoneW + safezoneX;
		y = 0.932317 * safezoneH + safezoneY;
		w = 0.0212813 * safezoneW;
		h = 0.0330891 * safezoneH;
	};
	class LWSH_BG_PICTURE_FATIGUE : IGUIBack
	{
		idc = IDC_LWSH_BG_PICTURE_FATIGUE;
		x = 0.00171973 * safezoneW + safezoneX;
		y = 0.966336 * safezoneH + safezoneY;
		w = 0.0212813 * safezoneW;
		h = 0.0330891 * safezoneH;
	};
	class LWSH_BG_PROGRESS_HEALTH : IGUIBack
	{
		idc = IDC_LWSH_BG_PROGRESS_HEALTH;
		colorBackground[] = {1,0,0,1};
		x = 0.0243951 * safezoneW + safezoneX;
		y = 0.935644 * safezoneH + safezoneY;
		w = 0.1 * safezoneW;
		h = 0.025 * safezoneH;
	};
	class LWSH_BG_PROGRESS_FATIGUE : IGUIBack
	{
		idc = IDC_LWSH_BG_PROGRESS_FATIGUE;
		colorBackground[] = {1,0,0,1};
		x = 0.0243952 * safezoneW + safezoneX;
		y = 0.970297 * safezoneH + safezoneY;
		w = 0.1 * safezoneW;
		h = 0.025 * safezoneH;
	};
	
	// PROGRESS BARS
	class LWSH_PROGRESS_HEALTH : RscProgress
	{
		text = "";
		idc = IDC_LWSH_PROGRESS_HEALTH;
		texture = "#(argb,8,8,3)color(0,1,0,0.75)";
		x = 0.0243951 * safezoneW + safezoneX;
		y = 0.935644 * safezoneH + safezoneY;
		w = 0.1 * safezoneW;
		h = 0.025 * safezoneH;
	};
	class LWSH_PROGRESS_FATIGUE : RscProgress
	{
		text = "";
		idc = IDC_LWSH_PROGRESS_FATIGUE;
		texture = "#(argb,8,8,3)color(0,0,1,0.75)";
		x = 0.0243952 * safezoneW + safezoneX;
		y = 0.970297 * safezoneH + safezoneY;
		w = 0.1 * safezoneW;
		h = 0.025 * safezoneH;
	};

	// PICTURES
	class LWSH_PICTURE_HEALTH : RscPicture
	{
		text = "\a3\ui_f\data\gui\cfg\hints\Injury_ca.paa";
		idc = IDC_LWSH_PICTURE_HEALTH;
		x = 0.00210458 * safezoneW + safezoneX;
		y = 0.932317 * safezoneH + safezoneY;
		w = 0.0212813 * safezoneW;
		h = 0.0330891 * safezoneH;
	};
	class LWSH_PICTURE_FATIGUE : RscPicture
	{
		text = "\a3\ui_f\data\gui\cfg\hints\Fatigue_ca.paa";
		idc = IDC_LWSH_PICTURE_FATIGUE;
		x = 0.00171973 * safezoneW + safezoneX;
		y = 0.966336 * safezoneH + safezoneY;
		w = 0.0212813 * safezoneW;
		h = 0.0330891 * safezoneH;
	};
};
