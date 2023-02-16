/*
    For use in an Explosion event handler
*/

params ["_crate", "_damage", "_source"];
        
if (damage _crate < 1) then {
    for "_i" from 0 to 10 do { 
        private _cratePos = getPos _crate; 
        
        private _randoDir = call CBA_fnc_randomVector3D;  
        while {(_randoDir vectorCos [0, 0, -1]) < .707} do {  
            _randoDir = call CBA_fnc_randomVector3D;  
            if (_randoDir # 2 > 0) then {  
                _randoDir = [_randoDir # 0, _randoDir # 1, (_randoDir # 2) * -1]  
            };  
        }; 

        private _shell = "Bo_Mk82" createVehicle ((_cratePos vectorAdd [0, 0, 20]) vectorAdd (_randoDir vectorMultiply 4)); 
        _shell remoteExec ["hideObject"];
        _shell setVelocity (_randoDir vectorMultiply 8); 
    };
    _crate setDamage 1;
    
    _crate call { 
        private _grp = createGroup sideLogic;  
        "ModuleEffectsFire_F" createUnit [  
         getPos _this,  
         _grp,  
         "this setVariable ['BIS_fnc_initModules_disableAutoActivation', false, true];this setVariable ['EffectSize',15,true];this setVariable ['ParticleSize',5,true];this setVariable ['Timeout',90]"  
        ]; 
        
        "ModuleEffectsSmoke_F" createUnit [  
         getPos _this,  
         _grp,  
         "this setVariable ['BIS_fnc_initModules_disableAutoActivation', false, true];this setVariable ['EffectSize',15,true];this setVariable ['ParticleSize',5,true];this setVariable ['ParticleLifetime',100,true];this setVariable ['Timeout',90];this setVariable ['ColorRed',0];this setVariable ['ColorGreen',0];this setVariable ['ColorBlue',0];"  
        ]; 
    };
};