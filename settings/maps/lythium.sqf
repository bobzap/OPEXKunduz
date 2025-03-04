﻿if (worldName != "lythium") exitWith {};

OPEX_mapRadius = worldSize / 2;
OPEX_mapCenter = [OPEX_mapRadius, OPEX_mapRadius, 0];
OPEX_mapRegion = "middleEast";
OPEX_mapCountry = "STR_afghanistan";
OPEX_mapLocality = "STR_lythium";
OPEX_mapLocalityInside = "STR_lythiumIn";
OPEX_mapClimate = "continental";
OPEX_mapEnemy = "TALIB";
OPEX_mapNationalities = ["STR_afghanistan", "STR_afghanistan", "STR_afghanistan", "STR_afghanistan", "STR_afghanistan", "STR_pakistan", "STR_pakistan", "STR_iran", "STR_iraq", "STR_syria", "STR_saudiArabia"];
OPEX_mapLanguage = "arabic";
OPEX_mapWater = false;
OPEX_locations_safe = [];
OPEX_locations_isolated = [];
OPEX_locations_villages = [];
OPEX_locations_cities = [];
OPEX_locations_industrial = [];
OPEX_locations_military = [];