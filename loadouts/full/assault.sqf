// ----------------------------------------------------------------------
// GETTING UNIT
// ----------------------------------------------------------------------

	params ["_unit"];

// ----------------------------------------------------------------------
// REMOVING DEFAULT LOADOUT
// ----------------------------------------------------------------------

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;
	removeAllContainers _unit;

// ----------------------------------------------------------------------
// ADDING CLOTHES
// ----------------------------------------------------------------------

	// UNIFORM
	_unit forceAddUniform (selectRandom OPEX_friendly_specialUniforms);
	[_unit] spawn Gemini_fnc_setUnitInsigna;

	// VEST
	_unit addVest (selectRandom OPEX_friendly_specialVests);

	// HEADGEAR
	_unit addHeadgear (selectRandom OPEX_friendly_commonHelmets);

	// BACKPACK
	/*
	_unit addBackpackGlobal (selectRandom OPEX_friendly_mediumBackpacks); waitUntil {!isNull backpackContainer _unit};
	clearAllItemsFromBackpack _unit;
	clearItemCargoGlobal (unitBackpack _unit);
	*/

	// GLASSES
	if (random 1 > 0.5) then {_unit addGoggles (selectRandom OPEX_friendly_balaclavas)};

// ----------------------------------------------------------------------
// ADDING RIFLE
// ----------------------------------------------------------------------

	// RIFLE
	_rifle = selectRandom (OPEX_friendly_compactRifles + OPEX_friendly_shotguns);
	[_unit, _rifle] call Gemini_fnc_addLoadedWeapon;

	// ADDITIONAL MAGAZINES
	_rifleMagazine = (getArray (configfile >> "CfgWeapons" >> _rifle >> "magazines")) select 0;
	for "_i" from 1 to 5 do {_unit addItemToVest _rifleMagazine};

	// OPTIC
	_compatibleRifleOptics = ([_rifle, 0] call Gemini_fnc_getWeaponAccessories) select {_x in OPEX_friendly_closeCombatOptics};
	if (count _compatibleRifleOptics > 0) then {_unit addPrimaryWeaponItem (selectRandom _compatibleRifleOptics)};

	// FLASHLIGHT
	_compatibleRifleFlashlights = ([_rifle, 1] call Gemini_fnc_getWeaponAccessories) select {_x in OPEX_friendly_flashlights};
	if (count _compatibleRifleFlashlights > 0) then {_unit addPrimaryWeaponItem (selectRandom _compatibleRifleFlashlights)};

	// POINTER
	_compatibleRiflePointers = ([_rifle, 1] call Gemini_fnc_getWeaponAccessories) select {_x in OPEX_friendly_pointers};
	if (count _compatibleRiflePointers > 0) then {_unit addItemToVest (selectRandom _compatibleRiflePointers)};

	// SILENCER
	_compatibleRifleSilencers = ([_rifle, 2] call Gemini_fnc_getWeaponAccessories) select {_x in OPEX_friendly_rifleSilencers};
	if (count _compatibleRifleSilencers > 0) then {_unit addItemToVest (selectRandom _compatibleRifleSilencers)};

// ----------------------------------------------------------------------
// ADDING HANDGUN
// ----------------------------------------------------------------------

	// HANDGUN
	_handgun = selectRandom OPEX_friendly_specialHandguns;
	[_unit, _handgun] call Gemini_fnc_addLoadedWeapon;

	// ADDITIONAL MAGAZINES
	_handgunMagazine = (getArray (configfile >> "CfgWeapons" >> _handgun >> "magazines")) select 0;
	for "_i" from 1 to 1 do {_unit addItemToVest _handgunMagazine};

// ----------------------------------------------------------------------
// ADDING NVG / BINOCULAR / RADIO / MAP / COMPASS / GPS / WATCH
// ----------------------------------------------------------------------

	// NVG
	if ((random 1 > 0.5) && (OPEX_sunHeight < 0)) then {_unit linkItem (selectRandom OPEX_friendly_NVGs)} else {_unit addItemToVest (selectRandom OPEX_friendly_NVGs)};

	// RADIO
	_unit linkItem (selectRandom OPEX_friendly_radiosShortDistance);

	// MAP
	_unit linkItem "ItemMap";

	// COMPASS
	_unit linkItem "ItemCompass";

	// GPS
	_unit linkItem "ItemGPS";

	// WATCH
	_unit linkItem "ItemWatch";

// ----------------------------------------------------------------------
// ADDING OTHER STUFF
// ----------------------------------------------------------------------

	// MEDICAL
	for "_i" from 1 to 1 do {_unit addItemToVest OPEX_medical_firstAidKit};

	// EARPLUGS
	if (count OPEX_friendly_earplugs > 0) then {_unit addItemToUniform (selectRandom OPEX_friendly_earplugs)};

	// CABLE TIES
	for "_i" from 1 to 3 do {_unit addItemToUniform (selectRandom OPEX_cableTies)};

	// GRENADES
	if (count OPEX_friendly_stunGrenades > 0) then {for "_i" from 1 to 3 do {_unit addItemToVest (selectRandom OPEX_friendly_stunGrenades)}};
	for "_i" from 1 to 1 do {_unit addItemToVest (selectRandom OPEX_friendly_handGrenades)};
	for "_i" from 1 to 1 do {_unit addItemToVest (selectRandom OPEX_friendly_smokeGrenades_white)};

	// CHEMLIGHTS
	for "_i" from 1 to 1 do {_unit addItemToUniform (selectRandom OPEX_friendly_chemlights)};

// ----------------------------------------------------------------------
// SETTING SKILLS
// ----------------------------------------------------------------------

	_unit setSkill ["aimingSpeed", 1];
	_unit setSkill ["reloadSpeed", 1];
	_unit setSkill ["courage", 1];
	_unit setSkill ["spotTime", 1];
	_unit setSkill ["endurance", 0.2];
	_unit setSkill ["spotDistance", 0.2];