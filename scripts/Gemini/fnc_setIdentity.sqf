﻿// =========================================================================================================
// GETTING ARGUMENTS
// =========================================================================================================

	private _unit = param [0, objNull, [objNull]];

// =========================================================================================================
// CHECKING REQUEST
// =========================================================================================================

	waitUntil {!isNil "OPEX_friendly_identities"};
	if (count OPEX_friendly_identities == 0) exitWith {};

	if (!local _unit) exitWith {
    [_unit] remoteExec ["Gemini_fnc_setIdentity", _unit]; };

// =========================================================================================================
// SETTING UNIT'S IDENTITY
// =========================================================================================================

	private _identity = selectRandom OPEX_friendly_identities;
	[_unit, _identity] remoteExec ["setIdentity", 0, _unit];

	[_unit] call Gemini_fnc_setSpeaker;