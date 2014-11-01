{
	private ["_uavPack","_packPos","_weaponHolder"];
	_uavPack = _x select 0;
	_packPos = _x select 1;
	_weaponHolder = createVehicle [ "WeaponHolderSimulated", _packPos, [], 0, "CAN_COLLIDE" ]; 
	_weaponHolder addBackPackCargoGlobal [ _uavPack, 1 ];
	[_weaponHolder, _uavPack, _packPos] spawn {
		private ["_WH","_UP","_PP"];
		_WH = _this select 0;
		_UP = _this select 1;
		_PP = _this select 2;
		
		while { true } do {	
			waitUntil { count backpackCargo _WH == 0 };
			sleep 60;
			deleteVehicle _WH;
			_WH = createVehicle [ "WeaponHolderSimulated", _PP, [], 0, "CAN_COLLIDE" ]; 
			_WH addBackPackCargoGlobal [ _UP, 1 ];
		};
	};
} forEach [
	["B_UAV_01_backpack_F", getPos BCMNATOTABLE],
	["O_UAV_01_backpack_F", getPos BCMCSATTABLE],
	["I_UAV_01_backpack_F", getPos BCMINDEPTABLE]
];
