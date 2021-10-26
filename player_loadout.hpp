/*
	Base Player Loadout for MJB ARMA
	Based on veerserif's revised loadout and SuperJam's revised mission templates
	Edited by NotherDuck on 2021-08-20
	Changenotes:
		- Removed all ACRE radios
		- Added tracers to Leader and AR roles
	Edited by Beagle on 2021-08-24
*/

// Weaponless Baseclass
class basetrooper 
{
	displayName = "Unarmed";
	// All Randomized.
	// Pants Beagle used - Blackhawk, Deep Recon, G99, Jeans, Tier 3, Triarius, 
	uniform[] = {
		"Tarkov_Uniforms_26",
		"Tarkov_Uniforms_30",
		"Tarkov_Uniforms_32",
		"Tarkov_Uniforms_36",
		"Tarkov_Uniforms_43",
		"Tarkov_Uniforms_44",
		"Tarkov_Uniforms_50",
		"Tarkov_Uniforms_54",
		//"Tarkov_Uniforms_56", white tex bug
		"Tarkov_Uniforms_60",
		"Tarkov_Uniforms_67",
		//"Tarkov_Uniforms_68", white tex bug
		"Tarkov_Uniforms_338",
		"Tarkov_Uniforms_342",
		"Tarkov_Uniforms_344",
		"Tarkov_Uniforms_348",
		"Tarkov_Uniforms_355",
		"Tarkov_Uniforms_356",
		"Tarkov_Uniforms_98",
		"Tarkov_Uniforms_102",
		"Tarkov_Uniforms_104",
		"Tarkov_Uniforms_108",
		"Tarkov_Uniforms_115",
		"Tarkov_Uniforms_116",
		"Tarkov_Uniforms_410",
		"Tarkov_Uniforms_414",
		"Tarkov_Uniforms_416",
		"Tarkov_Uniforms_420",
		"Tarkov_Uniforms_427",
		"Tarkov_Uniforms_428",
		"Tarkov_Uniforms_146",
		"Tarkov_Uniforms_150",
		"Tarkov_Uniforms_152",
		"Tarkov_Uniforms_163",
		"Tarkov_Uniforms_156",
		"Tarkov_Uniforms_164",
		"Tarkov_Uniforms_170",
		"Tarkov_Uniforms_174",
		"Tarkov_Uniforms_176",
		"Tarkov_Uniforms_180",
		"Tarkov_Uniforms_187",
		"Tarkov_Uniforms_188",
		"Tarkov_Uniforms_194",
		"Tarkov_Uniforms_198",
		"Tarkov_Uniforms_200",
		"Tarkov_Uniforms_204",
		"Tarkov_Uniforms_211",
		"Tarkov_Uniforms_212",
		"Tarkov_Uniforms_242",
		"Tarkov_Uniforms_246",
		"Tarkov_Uniforms_248",
		"Tarkov_Uniforms_252",
		"Tarkov_Uniforms_259",
		"Tarkov_Uniforms_260",
		"Tarkov_Uniforms_530",
		"Tarkov_Uniforms_534",
		"Tarkov_Uniforms_536",
		"Tarkov_Uniforms_540",
		"Tarkov_Uniforms_547",
		"Tarkov_Uniforms_548",
		"Tarkov_Uniforms_266",
		"Tarkov_Uniforms_272",
		"Tarkov_Uniforms_276",
		"Tarkov_Uniforms_270",
		"Tarkov_Uniforms_283",
		"Tarkov_Uniforms_284",
		"Tarkov_Uniforms_290",
		"Tarkov_Uniforms_294",
		"Tarkov_Uniforms_296",
		"Tarkov_Uniforms_300",
		"Tarkov_Uniforms_307",
		"Tarkov_Uniforms_308",
		"Tarkov_Uniforms_602",
		"Tarkov_Uniforms_606",
		"Tarkov_Uniforms_608",
		"Tarkov_Uniforms_612",
		"Tarkov_Uniforms_619",
		"Tarkov_Uniforms_620",
		"Tarkov_Uniforms_624"
	};
	vest[] = {
		"V_PlateCarrier2_blk"
	};
	backpack[] = {
			"B_Kitbag_tan",
		"B_Kitbag_sgg",
		"B_Kitbag_rgr",
		"CUP_B_USPack_Black",
		"CUP_B_GER_Pack_Flecktarn",
		"CUP_B_GER_Pack_Tropentarn",
		"CUP_O_RUS_Patrol_bag_Summer",
		"CUP_O_RUS_Patrol_bag_Desert",
		"CUP_O_RUS_Patrol_bag_BeigeDigital"
	};
	headgear[] = {
		"H_HelmetSpecB",
		"H_HelmetSpecB_blk",
		"H_HelmetSpecB_paint2",
		"H_HelmetSpecB_paint1",
		"H_HelmetSpecB_sand",
		"H_HelmetSpecB_snakeskin",
		"H_HelmetSpecB_wdl"
	};
	goggles[] = {};
	hmd[] = {
		"NVGoggles_OPFOR",
		"NVGoggles",
		"NVGoggles_INDEP",
		"NVGoggles_tna_F"
	};
	
	//All Randomized. Add Primary Weapon and attachments.
	//Leave Empty to remove all. {"Default"} for using original items the character start with.
	primaryWeapon[] = {};
	scope[] = {};
	bipod[] = {};
	attachment[] = {};
	silencer[] = {};
	
	// *WARNING* secondaryAttachments[] arrays are NOT randomized.
	secondaryWeapon[] = {};
	secondaryAttachments[] = {};
	sidearmWeapon[] = {"CUP_hgun_Glock17_blk"};
	sidearmAttachments[] = {};
	
	// These are added to the uniform or vest first - overflow goes to backpack if there's any.
	magazines[] = {};
	items[] = {
		"diw_armor_plates_main_plate",
		"greenmag_item_speedloader",
	};	
	// These are added directly into their respective slots
	linkedItems[] = {
		"ItemWatch",
		"ItemMap",
		"ItemCompass",
		"ItemGPS"
	};
	
	// These are put directly into the backpack.
	backpackItems[] = {};
	
	// This is executed after the unit init is complete. Argument: _this = _unit.
	code = "";
};


class r : basetrooper
{
	displayName = "Rifletrooper";
	primaryWeapon[] = {
		"CUP_arifle_ACR_blk_556",
		"CUP_arifle_HK416_Black",
		"CUP_arifle_M16A4_Grip"
	};
	scope[] = {
		"CUP_optic_AC11704_Black",
		"CUP_optic_CompM2_low",
		"CUP_optic_HoloBlack"
	};
	bipod[] = {
	};
	attachment[] = {
	};
	silencer[] = {
		"CUP_muzzle_snds_M16"	
	};
	magazines[] += {
		LIST_2("HandGrenade"),
		LIST_2("SmokeShell"),
		"CUP_17Rnd_9x19_glock17",
		LIST_7("CUP_30Rnd_556x45_Emag")
	};
	items[] += {
		LIST_2("FirstAidKit")
	};
	backpackItems[] = {
		LIST_7("diw_armor_plates_main_plate"),
		LIST_2("greenmag_ammo_556x45_basic_60Rnd"),
		LIST_2("FirstAidKit")
	};
	
};

class mrta : r
{
	displayName = "Mortar";
	primaryWeapon[] = {
		"CUP_arifle_G36CA3_grip",
		"CUP_arifle_XM8_Compact_Rail"
	};
	attachment[] = {
	};
	magazines[] = {
		LIST_5("CUP_30Rnd_556x45_XM8"),
		"CUP_17Rnd_9x19_glock17"
	};
	backpack[] = {"B_Mortar_01_support_F"};
	backpackItems[] = {};
	items[] += {
		"ACE_MapTools",
		"ACE_artilleryTable"
	};
};

class mrtl : mrta
{
	displayName = "Mortar Lead";
	backpack[] = {"B_Mortar_01_weapon_F"};
};


class ar : basetrooper
{
	displayName = "Machinegun";
	primaryWeapon[] = {
		"CUP_lmg_minimi_railed"
	};
	scope[] = {
		"CUP_optic_AC11704_Black"
	};
	silencer[] = {
		"CUP_muzzle_snds_M16"	
	};
	magazines[] =
	{
		LIST_4("CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249"),
		"CUP_17Rnd_9x19_glock17"
	};
	items[] += {
		LIST_2("FirstAidKit")
	};
	backpackItems[] += {
		LIST_5("diw_armor_plates_main_plate"),
		LIST_4("FirstAidKit")
	};
};

class aar : r
{
	displayName = "Machinegun Ammo Bearer";
	backpack[] = {
		"B_Carryall_taiga_F",
		"B_Carryall_eaf_F",
		"B_Carryall_oli"
	};
	backpackItems[] = {
		"greenmag_ammo_556x45_basic_60Rnd",
		LIST_3("greenmag_beltlinked_556x45_basic_200"),
		LIST_6("diw_armor_plates_main_plate")		
	};
};

class sniper : basetrooper 
{
	displayName = "Sniper";
	primaryWeapon[] =
	{
		"CUP_srifle_AWM_wdl"
	};
	scope[] = {
		"optic_LRPS"
	};
	bipod[] = {
		"CUP_bipod_VLTOR_Modpod_black"
	};
	linkedItems[] += {
		"Rangefinder"
	};
	magazines[] = {
		LIST_2("SmokeShellBlue"),
		"CUP_17Rnd_9x19_glock17",
		LIST_2("CUP_5Rnd_86x70_L115A1")
	};
	items[] = {
		"greenmag_item_speedloader",
		LIST_3("FirstAidKit")
	};
	backpackItems[] = {
		LIST_6("diw_armor_plates_main_plate"),
		LIST_2("greenmag_ammo_338_basic_60Rnd"),
		LIST_5("FirstAidKit")
	};
};

class spotter : r 
{
	displayName = "Spotter";
	primaryWeapon[] =
	{
		"CUP_srifle_M14_DMR"
	};
	scope[] = {"optic_DMS"};
	bipod[] = {"CUP_bipod_Harris_1A2_L_BLK"};
	magazines[] = {
		LIST_2("SmokeShellBlue"),
		"CUP_17Rnd_9x19_glock17",
		LIST_6("CUP_20Rnd_762x51_DMR")
	};
	items[] = {
		"greenmag_item_speedloader",
		LIST_2("FirstAidKit"),
	};
	linkedItems[] += {
		"Rangefinder"
	};
};

class tl : r
{
	displayName = "Team Leader";
	primaryWeapon[] = {
		"CUP_arifle_ACRC_EGLM_blk_556",
		"CUP_arifle_M4A1_GL_carryhandle"
	};
	bipod[] = {};
	magazines[] = {
	LIST_2("HandGrenade"),
	LIST_2("SmokeShellBlue"),
	"CUP_17Rnd_9x19_glock17",
	LIST_7("CUP_30Rnd_556x45_Emag")
	};
	linkedItems[] += {
		"Rangefinder",
	};
	backpackItems[] = {
		LIST_2("FirstAidKit"),
		LIST_2("greenmag_ammo_556x45_basic_60Rnd"),
		LIST_5("diw_armor_plates_main_plate"),
		LIST_5("1Rnd_HE_Grenade_shell"),
		LIST_2("1Rnd_Smoke_Grenade_shell"),
		LIST_2("1Rnd_SmokeRed_Grenade_shell"),
		LIST_3("SmokeShell"),
		LIST_3("SmokeShellBlue")
	};
};

class sl : tl
{
	displayName = "Squad Leader";
	items[] = {
		"diw_armor_plates_main_plate",
		"greenmag_item_speedloader",
	};
};

class cls : r
{
	displayName = "Medic";
	traits[] = {
		"medic"
	};
	backpack[] = {
		"B_Carryall_oucamo"
	};
	backpackItems[] =
	{
		LIST_6("diw_armor_plates_main_plate"),
		"greenmag_ammo_556x45_basic_60Rnd",
		"Medikit",
		LIST_2("SmokeShell"),
		LIST_2("SmokeShellBlue"),
		LIST_1("SmokeShellPurple"),
	};
};

class lat : r
{
	displayName = "Trooper (Light Anti-tank)";
	secondaryWeapon[] = {
		"CUP_launch_M136"
	};
	backpackItems[] = {
		LIST_4("diw_armor_plates_main_plate"),
		LIST_2("greenmag_ammo_556x45_basic_60Rnd"),
		LIST_2("FirstAidKit")
	};
};

class mat : r
{
	displayName = "Antitank Trooper";
	secondaryWeapon[] = {
		"launch_MRAWS_green_F"
	};
	backpack[] = {
		"B_Carryall_cbr"
	};
	backpackItems[] =
	{
		LIST_2("MRAWS_HEAT_F"),
		LIST_5("diw_armor_plates_main_plate"),
		LIST_2("greenmag_ammo_556x45_basic_60Rnd")
	};
};

class amat : r
{
	displayName = "Antitank ammo bearer";
	magazines[] += {
		LIST_4("CUP_30Rnd_556x45_Emag")
	};
	items[] = {
		"greenmag_item_speedloader",
		LIST_2("FirstAidKit"),
	};
	backpack[] = {
		"B_Carryall_taiga_F",
		"B_Carryall_eaf_F",
		"B_Carryall_oli"
	};
	backpackItems[] =
	{
		LIST_4("diw_armor_plates_main_plate"),
		LIST_3("MRAWS_HEAT_F"),
	};
};

class hat : mat
{
	displayName = "Heavy Antitank Trooper";
	secondaryWeapon[] = {
		"launch_I_Titan_short_F",
		"launch_B_Titan_short_F"
	};
	items[] = {
		"greenmag_item_speedloader",
		LIST_3("FirstAidKit")
	};
	backpack[] = {
		"B_Bergen_mcamo_F",
		"B_Bergen_dgtl_F"
	};
	backpackItems[] =
	{
		LIST_3("Titan_AT"),
		LIST_4("diw_armor_plates_main_plate"),
		LIST_2("greenmag_ammo_556x45_basic_60Rnd")
	};
	linkedItems[] += {
		"Rangefinder"
	};
};

class ahat : hat
{
	displayName = "Heavy Antitank ammo bearer";
	secondaryWeapon[] = {};
};

class sfsl : sl 
{
	displayName = "SF Team Leader";
	goggles[] = {};
	vest[] = {
		"CUP_V_B_Ciras_Black2"
		//"rhsusf_plateframe_teamleader"
		//"rhsusf_mbav_mg"
	};
	backpack[] = {
		"B_Carryall_cbr"
	};
	sidearmWeapon[] = {
		"CUP_hgun_Mk23"
	};
	items[] += {
		LIST_3("ACE_CableTie"),
		LIST_2("ACE_IR_Strobe_Item")
	};
	magazines[] = {
		LIST_7("CUP_30Rnd_556x45_Emag"),
		LIST_4("ACE_CTS9"),
		LIST_2("HandGrenade"),
		"CUP_17Rnd_9x19_glock17"
	};
	backpackItems[] +={
		LIST_3("1Rnd_HE_Grenade_Shell")
	};
	linkedItems[] += {
		"Rangefinder"
	};
};

class sfdmr : spotter
{
	displayName = "SF Marksman";
	vest[] = {
		"CUP_V_B_Ciras_Black"
	};
};

class sfmed : cls
{
	displayName = "SF Medic";
	goggles[] = {};
	vest[] = {
		"CUP_V_B_Ciras_Black"
		//"rhsusf_plateframe_medic"
		//"rhsusf_mbav_mg"
	};
	backpack[] = {
		"B_Carryall_oucamo"
	};
	items[] += {
		LIST_3("ACE_CableTie"),
		LIST_2("ACE_IR_Strobe_Item")
	};
	magazines[] += {
		LIST_2("ACE_CTS9")
	};
	backpackItems[] =
	{
	LIST_6("diw_armor_plates_main_plate"),
	LIST_2("greenmag_ammo_762x51_basic_60Rnd"),
	"FirstAidKit",
	"Medikit"
	};
	linkedItems[] += {
		"Rangefinder"
	};
};

class sfmat : mat
{
	displayName = "SF Antitank trooper";
	goggles[] = {};
	vest[] = {
		"CUP_V_B_Ciras_Black2"
		//"rhsusf_plateframe_rifleman"
		//"rhsusf_mbav_mg"
	};
	backpack[] = {
		"B_Carryall_cbr"
	};
	items[] += {
	"greenmag_ammo_9x19_basic_60Rnd",
	LIST_3("ACE_CableTie"),
	LIST_2("ACE_IR_Strobe_Item")
	};
	magazines[] = {
		LIST_7("CUP_30Rnd_556x45_Emag"),
		LIST_2("ACE_CTS9"),
		LIST_2("SmokeShellBlue"),
		LIST_1("HandGrenade"),
		"CUP_17Rnd_9x19_glock17"
	};
	backpackItems[] += {};
	linkedItems[] += {
		"Rangefinder"
	};
};

class sfar : ar
{
	displayName = "SF Machinegunner";
	goggles[] = {};
	vest[] = {
		"CUP_V_B_Ciras_Black2"
		//"rhsusf_plateframe_machinegunner"
		//"rhsusf_mbav_mg"
	};
	backpack[] = {
		"B_Carryall_cbr"
	};
	items[] += {
		LIST_3("ACE_CableTie"),
		LIST_2("ACE_IR_Strobe_Item")
	};
	magazines[] += {
		LIST_2("ACE_CTS9")
	};
	linkedItems[] += {
		"Rangefinder"
	};
};

class ceng : basetrooper
{
	displayName = "Combat Engineer";
	headgear[] = {
		"H_HelmetSpecB_Sand"
	};
	backpack[] = {
		"B_Bergen_mcamo_F"
	};
	primaryWeapon[] =
	{
		"CUP_smg_MP5A5"
	};
	scope[] = {
		"CUP_optic_AC11704_Black"
	};
	attachment[] = {
		"CUP_acc_Flashlight_MP5"
	};
	silencer[] = {
		"CUP_muzzle_fh_MP5"
	};
	items[] = {
		"greenmag_item_speedloader",
		"ACE_Clacker",
		LIST_4("FirstAidKit")
	};
	magazines[] = {
		LIST_6("CUP_30Rnd_9x19_MP5"),
		LIST_2("ACE_M14"),
		LIST_2("SmokeShellBlue"),
		LIST_2("HandGrenade"),
		LIST_2("ACE_Chemlight_HiBlue"),
		LIST_2("ACE_Chemlight_HiYellow"),
		LIST_2("ACE_Chemlight_UltraHiOrange"),
		"CUP_17Rnd_9x19_glock17"
	};
	backpackItems[] =
	{
		LIST_4("diw_armor_plates_main_plate"),
		LIST_2("FirstAidKit"),
		LIST_2("greenmag_ammo_46x30_basic_60Rnd"),
		"ACE_Wirecutter",
		LIST_3("APERSTripMine_Wire_Mag"),
		LIST_2("DemoCharge_Remote_Mag"),
		LIST_2("ClaymoreDirectionalMine_Remote_Mag"),
		LIST_2("ACE_FlareTripMine_Mag"),
		"ATMine_Range_Mag",
		"SLAMDirectionalMine_Wire_Mag"
	};
	linkedItems[] += {
		"Rangefinder"
	};
};

class crew : basetrooper
{
	displayName = "Crew";
	uniform[] = {
		"Tarkov_Uniforms_32",
		"Tarkov_Uniforms_60",
		"Tarkov_Uniforms_200"
	};
	headgear[] = {
		"H_HelmetCrew_I"
	};
	backpack[] = {};
	primaryWeapon[] =
	{
		"CUP_smg_MP5A5"
	};
	scope[] = {
		"CUP_optic_AC11704_Black"
	};
	bipod[] = {};
	attachment[] = {};
	silencer[] = { "CUP_muzzle_fh_MP5" };
	items[] = {
		"greenmag_item_speedloader",
		LIST_2("FirstAidKit"),
	};
	magazines[] = {
		LIST_3("CUP_30Rnd_9x19_MP5"),
		LIST_2("SmokeShellBlue"),
	};
	backpackItems[] = {};
	linkedItems[] += {
		"Rangefinder"
	};
};

class helocrew : crew
{
	displayName = "Helo Crew";
	uniform[] = {
		"Tarkov_Uniforms_420",
		"Tarkov_Uniforms_342",
		"Tarkov_Uniforms_262",
		"Tarkov_Uniforms_499"
	};
	headgear[] = {
		"H_PilotHelmetHeli_B"
	};
};

class aircrew : basetrooper
{
	displayName = "Aircrew";
	uniform[] = {
		"U_I_pilotCoveralls"
	};
	headgear[] = {
		"H_PilotHelmetFighter_B"
	};
	hmd[] = {};
	vest[] = {};
	backpack[] = {};
	primaryWeapon[] ={};
	scope[] = {};
	bipod[] = {};
	attachment[] = {};
	silencer[] = {};
	sidearmWeapon[] = {
		"CUP_hgun_CZ75"
	};
	items[] = {
		LIST_1("ACE_IR_Strobe_Item"),
		LIST_1("FirstAidKit"),
		LIST_1("ACE_Chemlight_UltraHiOrange"),
	};
	magazines[] = {
		LIST_2("CUP_16Rnd_9x19_cz75"),
		"SmokeShellOrange"
	};
	backpackItems[] = {};
	linkedItems[] += {
		"Rangefinder"
	};
};