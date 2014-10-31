/*
	Parent File: description.ext
*/

class Params 
{
	class TimeOfDay 
	{ // select 0
        title = "Time Of Day:";
        values[] = {6,12,18,21};
		default = 12;
        texts[] = {"Dawn","Noon","Dusk","Night"};
	};
	
	class Tickets 
	{// select 1
		title = "Starting Tickets:";
		values[] = {100,200,300,400,500,600,700,800,900,1000};
		default = 500; 
		texts[] = {"100","200","300","400","500","600","700","800","900","1000"};
	};
	
	class Timer 
	{// select 2
		title = "Mission Timer:";
		values[] = {1800,3600,7200};
		default = 3600; 
		texts[] = {"30min","1hr","2hr"};
	};
	
	class Markers 
	{// select 3
		title = "3D Side Markers:";
		values[] = {0,1};
		default = 1; 
		texts[] = {"OFF","ON"};
	};
	
	class MarkerRange 
	{// select 4
		title = "3D Side Markers Range:";
		values[] = {50,100,150,200,250,300,350,400,450,500,1000};
		default = 300; 
		texts[] = {"50m","100m","150m","200m","250m","300m","350m","400m","450m","500m","1000m"};
	};
	
	class Fatigue 
	{// select 5
		title = "Fatigue:";
		values[] = {0,1};
		default = 1; 
		texts[] = {"OFF","ON"};
	};
	
};