/**
	* Adds curated arsenal to player that disables itself under specified conditions.
	*
	* Faction: MJB ARMA default PMCs
	*
	* Usage - under initPlayerLocal.sqf
	* 0 = execVM 'loadouts\arsenal.sqf';
	* 
	* New framework update by NotherDuck
	* Formatting by veerserif
	*
	* v0.5 2021-08-20:
		- Removed ACRE Radios
		- Removed EFT Uniforms with Beltstaff Pants (White LOD Issue)
		- Added weapons and attachments requested in framework doc.
		- Gave all roles access to tracers where possible.
		- Moved DMRs (M14, SR-25, SVDS) and Shortdot to seperate role (_itemWeaponDMR).
		- Added LAT Equipment (_itemWeaponLAT).
	* v1.0 - 2021-08-21:
		- Fixed several typos with magazines and added some missing ones (150 rnd 7.62x54r Box)
		- Moved shotguns and smgs to seperate section (_itemWeaponCQB, still given to all classes with normal rifles)
		- Added section for high capacity rifle mags (_itemWeaponHighCapAmmo, given to SF)
	* v1.1 - 2021-08-26:
		- Added ACRE radios back to arsenal.
		- Removed CUP lasers.
		- Fixed some roles not having access to pistols.
		- Added NAPA drip hoodie.
	* v1.1a - 2021-08-31:
		- Removed heli coveralls from normal infantry roles.
		- Gave tank and air crews access to CQB weapons.
	* v1.2 - 2021-09-01:
		- Added carbine variants requested by VierLeger (VHS-K2, ACR-C, F2000 Tactical, Mk17 CQC, Mk18).
	* v1.2a - 2021-09-14:
		- Added the AK-104 and AK-74M.
		- Changed AK-105 variant to B-13 version (rail can be removed using CTRL+C by default to access dovetail sights)
		- Fixed LAT and HAT roles having access to binoculars.
	* v1.3 – 2021-10-08:
		- MJB Modlist reset version.
*/

private _rifles = [
	// 5.56
	"arifle_Mk20_plain_F",
	"CUP_arifle_G36A3_grip",
	"CUP_arifle_XM8_Railed",
	"CUP_arifle_ACR_blk_556",
	"CUP_arifle_HK416_Black",
	"CUP_Famas_F1_Rail",
	"CUP_arifle_M16A4_Grip",

	// 6.5
	/*
	"arifle_MX_Black_F",
	"arifle_Katiba_F",
	*/
	
	// 5.45
	"CUP_arifle_Fort222",
	"CUP_arifle_AK74M",
	"CUP_arifle_AK74M_railed",
	
	// 7.62x51
	"CUP_arifle_DSA_SA58_OSW_VFG",
	
	// 7.62x39
	"CUP_arifle_AKM",
	"CUP_arifle_AKM_railed"
];

private _carbines = [
	// 5.56
	"arifle_Mk20C_plain_F",
	"CUP_arifle_G36CA3_grip",
	"CUP_arifle_XM8_Compact_Rail",
	"CUP_arifle_ACRC_blk_556",
	"CUP_arifle_M4A1_SOMMOD_black",
	
	// 5.45
	"CUP_arifle_Fort224_Grippod",
	"CUP_arifle_AKS74U",
	"CUP_arifle_AKS74U_top_rail",
	
	// 7.62x39
	"CUP_arifle_OTS14_GROZA_762"
	
	// 6.5
	/*
	"arifle_MXC_Black_F",
	"arifle_Katiba_C_F"
	*/
];

private _underslung = [
	// 5.56
	"arifle_Mk20_GL_plain_F",
	"CUP_arifle_ACRC_EGLM_blk_556",
	"CUP_arifle_ACR_EGLM_blk_556",
	"CUP_arifle_M16A4_GL",
	"CUP_arifle_M4A1_GL_carryhandle",
	"CUP_arifle_G36A3_AG36",
	"CUP_arifle_XM8_Carbine_GL",
	"CUP_arifle_HK416_AGL_Black",
	
	// 5.45
	"CUP_arifle_AK74M_GL",
	"CUP_arifle_AK74M_GL_top_rail",
	
	// 7.62x39
	"CUP_arifle_AKM_GL",
	"CUP_arifle_AKM_GL_top_rail",
	"CUP_arifle_OTS14_GROZA_762_GL",
	
	// 7.62x51
	"CUP_arifle_DSA_SA58_OSW_M203",
	
	// 6.5
	/*
	"arifle_Katiba_GL_F",
	"arifle_MX_GL_Black_F",
	*/
	
	// NATO
	"1Rnd_HE_Grenade_shell",
	"ACE_40mm_Flare_white",
	"ACE_40mm_Flare_ir",
	"1Rnd_Smoke_Grenade_shell",
	"1Rnd_SmokeRed_Grenade_shell",
	"1Rnd_SmokeBlue_Grenade_shell",
	"1Rnd_SmokeGreen_Grenade_shell",
	
	// RUS
	"CUP_1Rnd_HE_GP25_M",
	"CUP_IlumFlareWhite_GP25_M",
	"CUP_1Rnd_SMOKE_GP25_M",
	"CUP_1Rnd_SmokeRed_GP25_M",
	"CUP_1Rnd_SmokeGreen_GP25_M"
];

private _rifleAmmo = [
	// 5.56
	// standard
	"CUP_30Rnd_556x45_Emag",
	"CUP_30Rnd_556x45_XM8",
	"CUP_25Rnd_556x45_Famas",
	// tracer
	"CUP_30Rnd_556x45_Emag_Tracer_Yellow",
	"CUP_30Rnd_TE1_Yellow_Tracer_556x45_XM8",
	"CUP_25Rnd_556x45_Famas_Tracer_Yellow",
	
	// 5.45
	// standard
	"CUP_30Rnd_545x39_Fort224_M",
	"CUP_30Rnd_545x39_AK74M_M",
	// tracer
	"CUP_30Rnd_TE1_White_Tracer_545x39_Fort224_M",
	"CUP_30Rnd_TE1_White_Tracer_545x39_AK74M_M",
	
	// 7.62x51
	// standard
	"CUP_20Rnd_762x51_FNFAL_M",
	// tracer
	"CUP_20Rnd_TE1_Red_Tracer_762x51_FNFAL_M",
	
	// 7.62x39
	// standard
	"CUP_30Rnd_762x39_AK47_bakelite_M",
	// tracer
	"CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_bakelite_M",
	
	/*
	// 6.5x39
	// standard
	"30Rnd_65x39_caseless_green",
	"30Rnd_65x39_caseless_black_mag",
	// tracer
	"30Rnd_65x39_caseless_green_mag_Tracer"
	*/
	
	// Greenmag
	"greenmag_ammo_556x45_basic_60Rnd",
	"greenmag_ammo_556x45_basic_30Rnd",
	"greenmag_ammo_762x39_basic_30Rnd",
	"greenmag_ammo_762x39_basic_60Rnd",
	// "greenmag_ammo_650x39_basic_30Rnd",
	// "greenmag_ammo_650x39_basic_60Rnd",
	"greenmag_ammo_762x51_basic_60Rnd",
	"greenmag_ammo_762x51_basic_30Rnd",
	"greenmag_ammo_545x39_basic_30Rnd",
	"greenmag_ammo_545x39_basic_60Rnd"
];

private _pistols = [
	"CUP_hgun_Browning_HP",
	"CUP_hgun_CZ75",
	"CUP_hgun_M17_Black",
	"CUP_hgun_Makarov",
	"CUP_hgun_Mk23",
	"CUP_hgun_TaurusTracker455",
	"CUP_hgun_Deagle",
	"CUP_hgun_M9A1",
	"CUP_hgun_Colt1911",
	"CUP_hgun_Glock17_blk",
	"CUP_hgun_TT",
	
	"CUP_13Rnd_9x19_Browning_HP",
	"CUP_16Rnd_9x19_cz75",
	"CUP_7Rnd_50AE_Deagle",
	"CUP_17Rnd_9x19_M17_Black",
	"CUP_8Rnd_9x18_Makarov_M",
	"CUP_12Rnd_45ACP_mk23",
	"CUP_6Rnd_45ACP_M",
	"CUP_15Rnd_9x19_M9",
	"CUP_7Rnd_45ACP_1911",
	"CUP_17Rnd_9x19_glock17",
	"CUP_8Rnd_762x25_TT",
	
	"CUP_acc_CZ_M3X",
	
	"greenmag_ammo_9x18_basic_30Rnd",
	"greenmag_ammo_9x19_basic_30Rnd",
	"greenmag_ammo_45ACP_basic_30Rnd",
	"greenmag_ammo_762x25_ball_30Rnd",
	"greenmag_ammo_50AE_ball_30Rnd"
];

private _machineGuns = [
	//7.62x54
	"CUP_lmg_Pecheneg_top_rail_B50_vfg",
	
	//5.56
	"CUP_lmg_minimi_railed",

	//7.62x51
	"CUP_lmg_M60E4",
	"CUP_lmg_MG3_rail",
	
	//mods
	"CUP_muzzle_snds_KZRZP_PK",
	"CUP_muzzle_mfsup_flashhider_pk_black"
];

private _magFedMGs = [
	//5.45
	"CUP_arifle_RPK74M",
	"CUP_arifle_RPK74M_railed",
	
	//7.62x39
	"CUP_arifle_RPK74",
	
	//5.56
	"CUP_arifle_L86A2",
	"CUP_arifle_MG36",
	
	"CUP_muzzle_snds_L85",
	
	//ammo
	"CUP_60Rnd_TE1_White_Tracer_545x39_AK74M_M",
	"CUP_60Rnd_556x45_SureFire_Tracer_Yellow",
	"CUP_100Rnd_TE1_Yellow_Tracer_556x45_BetaCMag",
	"CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M",
	"greenmag_ammo_545x39_basic_60Rnd",
	"greenmag_ammo_556x45_basic_60Rnd",
	"greenmag_ammo_762x39_basic_60Rnd"
];

private _mgAmmo = [
	//5.56
	"CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249",
	"CUP_100Rnd_TE4_Yellow_Tracer_556x45_M249",
	
	//7.62x51
	"CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",
	"CUP_120Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",
	
	//7.62x54
	"CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Red_M",
	
	"greenmag_beltlinked_556x45_basic_200",
	"greenmag_beltlinked_556x45_basic_100",
	"greenmag_beltlinked_556x45_basic_50",
	"greenmag_beltlinked_762x51_basic_200",
	"greenmag_beltlinked_762x51_basic_100",
	"greenmag_beltlinked_762x51_basic_50",
	"greenmag_beltlinked_762x54_basic_200",
	"greenmag_beltlinked_762x54_basic_100",
	"greenmag_beltlinked_762x54_basic_50",
	"greenmag_ammo_580x42_basic_60Rnd"
];

private _snipers = [
	"srifle_GM6_camo_F",
	"CUP_srifle_AS50",
	"CUP_srifle_CZ750",
	"CUP_srifle_AWM_wdl",
	"CUP_srifle_ksvk",
	"CUP_srifle_M107_Pristine",
	"CUP_srifle_M24_blk",
	
	"U_I_GhillieSuit",
	"U_O_GhillieSuit",
	"U_B_GhillieSuit",
	"CUP_U_O_RUS_Ghillie",
	"CUP_U_B_BAF_DDPM_GHILLIE",
	// "optic_AMS", // marksman dlc
	"optic_LRPS",
	"CUP_optic_LeupoldMk4_25x50_LRT_pip",
	"CUP_optic_SB_3_12x50_PMII",
	
	"CUP_10Rnd_127x99_M107",
	"CUP_5Rnd_127x99_as50_M",
	"CUP_10Rnd_762x51_CZ750",
	"CUP_5Rnd_86x70_L115A1",
	"CUP_5Rnd_127x108_KSVK_M",
	"CUP_5Rnd_762x51_M24",
	"greenmag_ammo_338_basic_60Rnd",
	
	"CUP_bipod_Harris_1A2_L_BLK",
	"CUP_muzzle_snds_AWM",
	"CUP_optic_PSO_3_open",
	"CUP_muzzle_mfsup_Suppressor_M107_Black",
	"CUP_Mxx_camo_half",
	"muzzle_snds_B",
	
	"ACE_ATragMX"
];

private _sharpshooters = [
	"CUP_srifle_SVD",
	"CUP_srifle_M14_DMR",
	"CUP_arifle_HK417_20",
	
	"optic_DMS",
	"CUP_optic_PSO_1",
	"CUP_optic_Elcan_SpecterDR_RMR_black",
	"CUP_optic_ACOG_TA01NSN_RMR_Black",
	"CUP_bipod_Harris_1A2_L_BLK",
	"CUP_SVD_camo_g",
	"CUP_muzzle_snds_KZRZP_SVD",
	
	"CUP_20Rnd_762x51_HK417",
	"CUP_20Rnd_762x51_DMR",
	"CUP_10Rnd_762x54_SVD_M",
	
	"greenmag_ammo_762x54_basic_30Rnd",
	"greenmag_ammo_762x51_basic_30Rnd",
	"greenmag_ammo_762x54_basic_60Rnd",
	"greenmag_ammo_762x51_basic_60Rnd",
	
	"ACE_ATragMX"
];

private _smgs = [
	"CUP_arifle_SR3M_Vikhr_VFG_top_rail",
	"CUP_smg_Mac10_rail",
	"CUP_smg_MP5A5",
	"CUP_smg_vityaz_vfg_top_rail",
	"CUP_smg_bizon",
	"CUP_smg_SA61",
	
	"CUP_30Rnd_9x39_SP5_VIKHR_M",
	"CUP_30Rnd_45ACP_MAC10_M",
	"CUP_30Rnd_9x19_MP5",
	"CUP_30Rnd_9x19_Vityaz",
	"CUP_64Rnd_9x19_Bizon_M",
	"CUP_20Rnd_B_765x17_Ball_M",
	
	"greenmag_ammo_46x30_basic_60Rnd",
	"greenmag_ammo_765x17_basic_60Rnd",
	"greenmag_ammo_9x39_basic_60Rnd",
	"greenmag_ammo_45ACP_basic_60Rnd",
	"greenmag_ammo_9x19_basic_60Rnd"
];

private _shotguns = [
	"CUP_sgun_M1014_vfg",
	"CUP_sgun_Saiga12k_top_rail",
	"CUP_sgun_SPAS12",
	
	"6Rnd_12Gauge_Pellets",
	"CUP_5Rnd_B_Saiga12_Buck_00",
	"CUP_12Rnd_B_Saiga12_Buck_00",
	"CUP_8Rnd_12Gauge_Pellets_No00_Buck"
];

private _baseItems = [
	// uniforms
	"U_I_E_Uniform_01_sweater_F",
	"U_I_L_Uniform_01_deserter_F",
	"U_BG_Guerrilla_6_1",
	"U_BG_Guerilla1_1",
	"U_BG_Guerilla1_2_F",
	"U_BG_leader",
	"U_I_L_Uniform_01_tshirt_olive_F",
	"U_C_IDAP_Man_casual_F",
	"U_B_T_Soldier_F",
	"U_B_T_Soldier_AR_F",
	"U_B_CombatUniform_mcam_wdl_f",
	"U_B_CombatUniform_tshirt_mcam_wdL_f",
	"CUP_U_O_RUS_Ratnik_Winter",
	
	"WU_B_GEN_Soldier_F",
	"WU_B_T_Soldier_F",
	"WU_B_T_Soldier_AR_F",
	"U_B_CombatUniform_mcam_tshirt_W",
	"U_B_CombatUniform_mcam_W",
	"WU_B_GEN_Commander_F",
	"WU_O_T_Soldier_F",
	"WU_O_CombatUniform_ocamo",
	"WU_B_HeliPilotCoveralls",
	
	// vests
	"V_PlateCarrier2_blk",
	"V_PlateCarrier2_rgr_noflag_F",
	"V_PlateCarrier1_blk",
	"V_PlateCarrier1_rgr_noflag_F",
	"CUP_V_CZ_NPP2006_nk_black",
	"CUP_V_CZ_NPP2006_nk_vz95",
	
	// backpacks
	// Assault Pack load, 0.91kg
	"B_AssaultPack_rgr",
	"B_AssaultPack_eaf_F",
	"B_AssaultPack_tna_F",
	
	// Kitbag load, 2.27kg
	"B_Kitbag_tan",
	"B_Kitbag_sgg",
	"B_Kitbag_rgr",
	"CUP_B_USPack_Black",
	"CUP_B_GER_Pack_Flecktarn",
	"CUP_B_GER_Pack_Tropentarn",
	"CUP_O_RUS_Patrol_bag_Summer",
	"CUP_O_RUS_Patrol_bag_Desert",
	"CUP_O_RUS_Patrol_bag_BeigeDigital",
	
	// headgear
	"H_Bandanna_gry",
	"H_Bandanna_camo",
	"H_Bandanna_sgg",
	"H_Bandanna_cbr",
	"H_Bandanna_khk",
	"H_Booniehat_wdl",
	"H_Bandanna_sand",
	
	"H_Booniehat_tna_F",
	"H_Booniehat_tan",
	"H_Booniehat_taiga",
	"H_Booniehat_oli",
	
	"H_Cap_blk",
	"H_Cap_oli",
	"H_Cap_tan",
	
	"H_HelmetSpecB",
	"H_HelmetSpecB_blk",
	"H_HelmetSpecB_paint2",
	"H_HelmetSpecB_paint1",
	"H_HelmetSpecB_sand",
	"H_HelmetSpecB_snakeskin",
	"H_HelmetSpecB_wdl",
	
	"CUP_H_RUS_K6_3_black",
	"CUP_H_RUS_K6_3_Goggles_black",
	
	"H_Watchcap_blk",
	"H_Watchcap_khk",
	"H_Watchcap_cbr",
	"H_Watchcap_camo",
	
	"H_Hat_camo", // shoot on sight
	
	// facewear
	"G_Balaclava_blk",
	"G_Balaclava_oli",
	"G_Bandanna_oli",
	"G_Balaclava_combat",
	"G_Bandanna_blk",
	"G_Tactical_Clear",
	"CUP_G_ESS_BLK",
	"CUP_G_ESS_BLK_Facewrap_Black",
	"CUP_G_ESS_BLK_Scarf_Grn",
	"CUP_G_ESS_BLK_Dark",
	"CUP_G_ESS_BLK_Scarf_Face_Grn",
	"CUP_PMC_Facewrap_Black",
	"CUP_G_PMC_Facewrap_Black_Glasses_Dark",
	"CUP_PMC_Facewrap_Tan",
	"CUP_G_PMC_Facewrap_Tan_Glasses_Dark",
	"CUP_PMC_Facewrap_Tropical",
	"CUP_G_PMC_Facewrap_Tropical_Glasses_Dark",
	"CUP_PMC_Facewrap_Winter",
	"CUP_G_PMC_Facewrap_Winter_Glasses_Dark",
	"CUP_G_Oakleys_Clr",
	"CUP_G_Oakleys_Drk",
	"CUP_G_Oakleys_Embr",
	"CUP_G_Scarf_Face_Blk",
	"CUP_G_Scarf_Face_Grn",
	"CUP_G_Scarf_Face_Tan",
	"CUP_G_Scarf_Face_White",
	"CUP_FR_NeckScarf",
	"CUP_FR_NeckScarf2",
	"CUP_FR_NeckScarf3",
	"CUP_FR_NeckScarf4",
	"CUP_FR_NeckScarf5",
	
	// nvg
	"NVGoggles_OPFOR",
	"NVGoggles",
	"NVGoggles_INDEP",
	"NVGoggles_tna_F",
	
	// misc
	"ItemMap",
	"ItemGPS",
	"ItemCompass",
	"ItemWatch",
	
	// items
	"greenmag_item_speedloader",
	"ACRE_PRC343",
	"diw_armor_plates_main_plate",
	"FirstAidKit",
	"ACE_MapTools",
	"ACE_RangeCard",
	"HandGrenade",
	"CUP_HandGrenade_RGD5",
	"ACE_M84",
	"SmokeShell",
	"SmokeShellBlue",
	"SmokeShellGreen",
	"SmokeShellPurple",
	"SmokeShellRed",
	"ACE_Chemlight_IR",
	"ACE_Chemlight_HiWhite",
	
	// mods
	/* borked
	"CUP_acc_ANPEQ_15_Black",
	"CUP_acc_ANPEQ_15_Black_Top",
	"CUP_acc_ANPEQ_15_Flashlight_Black_L",
	"CUP_acc_ANPEQ_15_Top_Flashlight_Black_L",
	"CUP_acc_LLM_black",
	*/
	"CUP_acc_ANPEQ_2_Flashlight_Black_L",
	"CUP_acc_Flashlight",

	
	"CUP_bipod_Harris_1A2_L_BLK",
	
	// the 8 1xs I like most
	"optic_Aco",
	"optic_yorris",
	"CUP_optic_AC11704_Black",
	"CUP_optic_CompM2_low",
	"CUP_optic_MEPRO_openx_orange",
	"CUP_optic_TrijiconRx01_kf_black",
	"CUP_optic_ZeissZPoint",
	"CUP_optic_Eotech553_Black",
	
	//dovetail
	"CUP_optic_ekp_8_02",
	"CUP_optic_Kobra",
	"CUP_optic_1p63",
	
	"CUP_muzzle_snds_SCAR_H",
	
	"CUP_muzzle_snds_G36_black",
	"CUP_muzzle_snds_FAMAS",
	"CUP_muzzle_snds_M16",
	
	"CUP_muzzle_TGPA",
	"CUP_muzzle_snds_KZRZP_AK545",
	"CUP_muzzle_Bizon",
	"CUP_muzzle_snds_KZRZP_AK762",
	"CUP_muzzle_snds_groza"
];

private _optic2x = [
	"optic_Arco_blk_F",
	"optic_Arco",
	"optic_MRCO",
	"optic_Hamr",

	"CUP_optic_PSO_1_AK_open"
];

private _binocs = [
	"Binocular",
	"Laserdesignator",
	"Laserdesignator_03",
	"Rangefinder"
];

private _leaders = [
	"hgun_Pistol_heavy_02_F",
	"6Rnd_45ACP_Cylinder",
	
	"CUP_V_CZ_NPP2006_co_black",
	"CUP_V_CZ_NPP2006_co_vz95",
	
	"H_Beret_blk",
	"CUP_H_Beret_HIL",
	"CUP_H_SLA_BeretRed",
	"CUP_H_ChDKZ_Beret",
	"ACRE_PRC148",
	
	"ACE_SpraypaintBlue"
];
_leaders append _binocs;

private _medics = [
	"Medikit",
	"B_Carryall_oucamo",
	"B_Carryall_ghex_F",
	"B_Carryall_ocamo"
];

private _ammoCarriers = [
	"B_Carryall_taiga_F",
	"B_Carryall_eaf_F",
	"B_Carryall_oli"
];

private _lat = [
	"CUP_launch_M136",
	"CUP_launch_RPG26",
	"CUP_launch_M72A6_Loaded",
	
	"CUP_launch_RPG7V",
	"CUP_PG7VL_M"
];

private _manpad = [
	/*
	//reusable
	"launch_B_Titan_olive_F",
	"Titan_AA",
	*/
	// disposable
	"CUP_launch_Igla",
	"CUP_launch_FIM92Stinger"
];

private _mat = [
	"launch_MRAWS_green_rail_F",
	"launch_MRAWS_olive_rail_F",
	"launch_MRAWS_sand_rail_F",
	"CUP_launch_Mk153Mod0",
	"CUP_launch_Mk153Mod0_blk",
	"CUP_optic_SMAW_Scope"
];

private _matAmmo = [
	"MRAWS_HEAT_F",
	"MRAWS_HE_F",
	"CUP_SMAW_HEDP_M",
	"CUP_SMAW_HEAA_M",
	"CUP_SMAW_NE_M"
];

private _hat = [
	//"CUP_launch_Javelin", // this any good?
	"launch_I_Titan_short_F",
	"launch_B_Titan_short_F"
];

private _hatAmmo = [
	//"CUP_Javelin_M", 
	"Titan_AT",
	"Titan_AP" 
];

private _airCrew = [
	"CUP_U_C_Pilot_01",
	"U_B_PilotCoveralls",
	"U_I_pilotCoveralls",
	"WU_B_HeliPilotCoveralls",
	"WU_I_HeliPilotCoveralls",
	"WU_O_PilotCoveralls",
	"Toolkit",
	"ACE_IR_Strobe_Item",
	"ACRE_PRC148",
	"ACE_Chemlight_UltraHiOrange",
	"SmokeShellOrange"
];

private _tankCrew =
[
	"ACRE_PRC148",
	"H_HelmetCrew_I",
	"H_HelmetCrew_O",
	"CUP_H_CZ_Helmet05"
];

private _engineer = [
	"ACE_Clacker",
	"ACE_M26_Clacker",
	"DemoCharge_Remote_Mag",
	"APERSBoundingMine_Remote_Mag",
	"ATMine_Range_Mag",
	"MineDetector",
	"Toolkit",
	
	"ACE_M14",
	"ACE_wirecutter",
	"ACE_EntrenchingTool",
	"ACE_DeadManSwitch",
	"ACE_DefusalKit",
	"ACE_FlareTripMine_Mag",
	"APERSTripMine_Wire_Mag",
	"SLAMDirectionalMine_Wire_Mag",
	"ClaymoreDirectionalMine_Remote_Mag",
	"TrainingMine_Mag",
	"ACE_UAVBattery",
	"ACE_SpraypaintBlack",
	"ACE_Rope36",
	"ACE_Rope15",
	"ACE_Chemlight_HiBlue",
	"ACE_Chemlight_HiYellow",
	"ACE_Chemlight_UltraHiOrange",
	"B_UAV_01_backpack_F",
	"B_UGV_02_Demining_backpack_F",
	"ACE_TacticalLadder_Pack",
	
	"B6SH118",
	"B_Bergen_mcamo_F",
	"B_Bergen_dgtl_F"
];

private _specialForces = [
	"ACE_CTS9",
	"ACE_CableTie",
	"ACE_IR_Strobe_Item",
	"ACE_M26_Clacker",
	"ACE_wirecutter",
	"ACE_M14",
	"DemoCharge_Remote_Mag",
	"ACRE_PRC148",
	
	"CUP_V_B_Ciras_Black",
	"CUP_V_B_Ciras_Black2",
	"CUP_V_B_Ciras_Khaki",
	"CUP_V_B_Ciras_Khaki2",
	"CUP_V_B_Ciras_Olive",
	"CUP_V_B_Ciras_Olive2",
	
	"Mechanism",
	
	"CUP_arifle_AS_VAL_VFG_top_rail",
	"CUP_smg_MP5SD6",
	
	"CUP_20Rnd_9x39_SP5_VSS_M"
];
_specialForces append _binocs;
_specialForces append _smgs;
_specialForces append _shotguns;

private _mortar = [
	"B_Mortar_01_weapon_F",
	"B_Mortar_01_support_F",
	"ACE_artilleryTable"
];

private _ownedDLCs = getDLCs 1;
private _hasApex = 395180 in _ownedDLCs;
private _hasContact = 1021790 in _ownedDLCs;

if (_hasApex) then {
	_baseItems append [
		"U_I_C_Soldier_Bandit_3_F",
		"U_I_C_Soldier_Para_2_F",
		"U_I_C_Soldier_Para_3_F",
		"U_I_C_Soldier_Para_4_F",
		"U_I_C_Soldier_Para_1_F",
		
		"H_HelmetB_TI_tna_F",
		"U_I_C_Soldier_Camo_F",
		
		"G_Balaclava_TI_blk_F",
		"G_Balaclava_TI_G_blk_F",
		
		"muzzle_snds_58_blk_F"
	];
	
	_optic2x append [
		"optic_ERCO_blk_F"
	];
	
	_rifles append [
		"arifle_CTAR_blk_F"
	];
	
	_rifleAmmo append [
		"30Rnd_580x42_Mag_F",
		"30Rnd_580x42_Mag_Tracer_F",
		
		"greenmag_ammo_580x42_basic_60Rnd",
		"greenmag_ammo_580x42_basic_30Rnd"
		
	];
	/*
	_sharpshooters append [
		"srifle_DMR_07_blk_F",
		"20Rnd_650x39_Cased_Mag_F"
	];
	*/
	_magFedMGs append [
		"arifle_CTARS_blk_F",
		"100Rnd_580x42_Mag_Tracer_F",
		"greenmag_ammo_580x42_basic_60Rnd"
	];
	
	_underslung append [
		"arifle_CTAR_GL_blk_F"
	];
};

if (_hasContact) then {
	_baseItems append [
		"optic_ico_01_camo_f",
		
		"U_O_R_Gorka_01_black_F",
		
		"G_Blindfold_01_black_F"
	];
	
	/*
	_rifles append [
		"arifle_MSBS65_camo_F"
	];
	
	_rifleAmmo append [
		"30Rnd_65x39_caseless_msbs_mag",
		"30Rnd_65x39_caseless_msbs_mag_Tracer",
	];
	
	_sharpshooters append [
		"arifle_MSBS65_Mark_camo_F",
		"30Rnd_65x39_caseless_msbs_mag"
	];
	
	_underslung append [
		"arifle_MSBS65_GL_camo_F"
	];
	*/
	_leaders append [
		"H_Beret_EAF_01_F"
	];
	/*
	_specialForces append [
		"arifle_MSBS65_UBS_black_F",
		"optic_ico_01_black_f",
		"6Rnd_12Gauge_Slug",
		"6Rnd_12Gauge_Pellets"
	];
	*/
	_airCrew append [
		"U_I_E_Uniform_01_coveralls_F"
	];
};

private _tarkovuniforms = [];
for [{_i = 2}, {_i < 623}, {_i = _i + 24}] do
{
	for "_j" from (_i) to (_i + 21) do 
	{
    _tarkovuniforms pushback ("Tarkov_Uniforms_" + str _j);
	};
};
//Add Existing Player Items
waitUntil { !isNull player };
{
    _baseItems pushBackUnique _x;
}forEach (primaryWeaponItems player);

{
    _baseItems pushBackUnique _x;
}forEach (handgunItems player);

_baseItems pushBack uniform player;
_baseItems pushBack vest player;
_baseItems pushBack backpack player;
_baseItems pushBack headgear player;

{
    _baseItems pushBackUnique _x;
} forEach (assignedItems player);

_baseItems append _tarkovuniforms;
_baseItems append _optic2x; // comment out for 1x only
// _machineGuns append _magFedMGs; // comment out for belt-feds only

private _role = player getVariable ["tmf_assignGear_role",nil];
private _leaderRole = ["tl", "sl"];

arsenal = "building" createVehicleLocal [0,0,0];
switch (true) do 
{
	case (_role == "r") : // basic–so most will skip the rest of this giant switch
	{
		{_baseItems append _x;} forEach [_carbines, _rifles, _rifleAmmo, _pistols];
	};
	case (_role == "lat") : // LAT
	{
		{_baseItems append _x;} forEach [_lat, _rifleAmmo, _rifles, _carbines, _pistols];
	};
	case (_role == "ar") : //MG
	{
		{_baseItems append _x;} forEach [_machineGuns, _mgAmmo, _ammoCarriers, _pistols];
	};
	case (_role == "aar") : //MG ammobearer
	{
		{_baseItems append _x;} forEach [_carbines, _rifles, _ammoCarriers, _rifleAmmo, _mgAmmo, _pistols];
	};
	case (_role in _leaderRole) : // leaders
	{
		{_baseItems append _x;} forEach [_underslung, _rifleAmmo, _leaders, _pistols];
	};
	case (_role == "cls") : // medics
	{
		{_baseItems append _x;} forEach [_rifles, _carbines, _rifleAmmo, _medics, _pistols];
	};
	case (_role == "crew") :
	{
		{_baseItems append _x;} forEach [_smgs, _carbines, _rifleAmmo, _binocs, _pistols]; // todo: tank crew stuff
	};
	case (_role == "mat") : // MAT
	{
		{_baseItems append _x;} forEach [_mat, _matAmmo, _carbines, _rifles, _rifleAmmo, _ammoCarriers, _pistols];
	};
	case (_role == "amat") : // MAT carrier
	{
		{_baseItems append _x;} forEach [_carbines, _rifles, _ammoCarriers, _rifleAmmo, _matAmmo, _pistols];
	};
	case (_role == "sniper") : // Snipers
	{
		{_baseItems append _x;} forEach [_snipers, _pistols, _binocs];
	};
		case (_role == "spotter") : // Spotters and/or Sharpshooters
	{
		{_baseItems append _x;} forEach [_sharpshooters, _optic2x, _pistols, _binocs];
	};
	case (_role == "aircrew") : // Pilots
	{
		{_baseItems append _x;} forEach [_smgs, _pistols, _aircrew, ["H_PilotHelmetFighter_B"]];
	};
	case (_role == "helocrew") : // Pilots
	{
		{_baseItems append _x;} forEach [_smgs, _carbines, _rifleAmmo, _pistols, _aircrew, ["H_PilotHelmetHeli_B"]];
	};
	case (_role == "hat") : // HAT
	{
		{_baseItems append _x;} forEach [_hat, _hatAmmo, _ammoCarriers, _rifles, _carbines, _rifleAmmo, _pistols];
	};
	case (_role == "ahat") : // HAT carrier
	{
		{_baseItems append _x;} forEach [_hatAmmo, _ammoCarriers, _rifles, _carbines, _rifleAmmo, _pistols];
	};
	case (_role == "ceng") :
	{
		{_baseItems append _x;} forEach [_engineer, _ammoCarriers, _shotguns, _rifles, _carbines, _rifleAmmo, _pistols];
	};
	case (_role == "sfmed") : // SFMedic
	{
		{_baseItems append _x;} forEach [_lat, _manpad, _specialForces, _rifles, _carbines, _rifleAmmo, _pistols, _medics, _optic2x];
	};
	case (_role == "sfsl") : // SFLead
	{
		{_baseItems append _x;} forEach [_lat, _manpad, _specialForces, _underslung, _rifleAmmo, _pistols, _ammoCarriers, _optic2x, _leaders];
	};
	case (_role == "sfdmr") : // SFMarksman
	{
		{_baseItems append _x;} forEach [_lat, _manpad, _specialForces, _sharpshooters, _pistols, _ammoCarriers, _leaders];
	};
	case (_role == "sfar") : // SF MG
	{
		{_baseItems append _x;} forEach [_lat, _manpad, _specialForces, _machineGuns, _optic2x, _mgAmmo, _magFedMGs, _pistols, _ammoCarriers];
	};
	case (_role == "sfmat") : // SF MAT
	{
		{_baseItems append _x;} forEach [_mat, _matAmmo, _specialForces, _rifles, _carbines, _rifleAmmo, _pistols, _ammoCarriers, _optic2x];
	};
	case (_role == "mrtl") : // mortar lead
	{
		{_baseItems append _x;} forEach [_smgs, _binocs, _carbines, _rifleAmmo, _pistols, _ammoCarriers, _mortar, ["ACRE_PRC148"]];
	};
	case (_role == "mrta") : // mortar assistant
	{
		{_baseItems append _x;} forEach [_smgs, _binocs, _carbines, _rifleAmmo, _pistols, _ammoCarriers, _mortar];
	};
	default 
	{
		{_baseItems append _x;} forEach [_carbines, _rifles, _rifleAmmo, _pistols];
	};
};

[arsenal, _baseItems] call ace_arsenal_fnc_initBox;

player setVariable ["startpos", getPosASL player];
_action = 
[
	"personal_arsenal","Personal Arsenal","\A3\ui_f\data\igui\cfg\weaponicons\MG_ca.paa",
	{
		lockIdentity player;
		[arsenal, _player] call ace_arsenal_fnc_openBox;
	},
	{ 
		(player distance2d (player getVariable ["startpos",[4500,6700,0]])) < 200
	},
	{},
	[],
	[0,0,0],
	3
] call ace_interact_menu_fnc_createAction;

["CAManBase", 1, ["ACE_SelfActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;