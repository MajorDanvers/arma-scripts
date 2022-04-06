input = ["CUP_O_sla_Soldier_AA", 
"CUP_O_sla_Soldier_AAT", 
"CUP_O_sla_Soldier_AMG", 
"CUP_O_sla_Soldier_HAT", 
"CUP_O_sla_Soldier_AR", 
"CUP_O_sla_Commander", 
"CUP_O_sla_Crew", 
"CUP_O_sla_Engineer", 
"CUP_O_sla_Soldier_GL", 
"CUP_O_sla_Soldier_MG", 
"CUP_O_sla_Medic", 
"CUP_O_sla_Officer", 
"CUP_O_sla_Pilot", 
"CUP_O_sla_Soldier", 
"CUP_O_SLA_Soldier_Backpack", 
"CUP_O_sla_Soldier_LAT", 
"CUP_O_sla_Soldier_AT", 
"CUP_O_sla_Sniper", 
"CUP_O_sla_Sniper_KSVK", 
"CUP_O_SLA_Sniper_SVD_Night", 
"CUP_O_sla_Soldier_AKS_Night", 
"CUP_O_sla_Soldier_AKS_74_GOSHAWK", 
"CUP_O_SLA_Spotter", 
"CUP_O_sla_Soldier_SL"]

loadout = "ENEMY_LOADOUT"

output = ["class Extended_InitPost_EventHandlers", "{"]
for soldier_class in input:
    output.append("    class {}".format(soldier_class))
    output.append("    {")
    output.append("        class varInit")
    output.append("        {")
    output.append("            init = \"[_this select 0, '{}', 'r'] call tmf_assigngear_fnc_assigngear;\";".format(loadout))
    output.append("        };")
    output.append("    };")
    output.append("")

output.append("};")

print("\n".join(output))