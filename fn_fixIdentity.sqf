params ["_unit"];
sleep 1;
if (uniform _unit in ['U_B_CombatUniform_mcam_tshirt_W', 'WU_B_T_Soldier_AR_F', 'WU_B_GEN_Commander_F']) then {
	private _face = selectRandom ['max_faceWS8', 'max_faceWS3', 'max_faceWS4'];
	[_unit, _face] remoteExec ['setFace'];
	[_unit,'CUP_D_Female01_EN'] remoteExec ['setSpeaker'];
	private _name = format ["%1 %2", selectRandom ["Alex", "Jane", "Rachel", "Karen", "Carol", "Michelle"], selectRandom ["Smith", "Jones", "Kelly", "Johnson"]];
	[_unit, _name] remoteExec ['setName'];
};