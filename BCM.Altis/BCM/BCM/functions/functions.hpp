class BCM
{
    class BCM_MAIN_FUNCTIONS
    {
        file = "BCM\BCM\functions";
        class sector               {};
		class vehRespawn           {};
		class vehFlip         	   {};
		class respawn              {};
		class campOwner            {};
		class rankRewards          {};
		class preInitVars          {preInit=1;};
		class ending               {postInit=1;};
		class AI          		   {postInit=1;};
		class bpCheck              {postInit=1;};
		class clientInit           {postInit = 1;};
		class serverInit           {postInit = 1;};
		class markers3D            {postInit = 1;};
		class bpSpawn              {postInit = 1;};
		class debug          	   {postInit = 1;};
	};
};  