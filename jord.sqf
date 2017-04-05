[] spawn {
["TaskSucceeded", ["", "Jord's Menu loaded"]] call BIS_fnc_showNotification;
sleep 0.1;
call jMenu;
};


jMenu = {
 removeallactions player;
 sleep 0.1;
 
  player addAction ["<t color=""#ff6600"">==== Jord's Menu v0.1 ===</t>",""];
  player addAction ["<t color=""#99ff66"">== Toggles ==</t>", jToggles];
  player addAction ["<t color=""#cc33ff"">== Vehicle Menu ==</t>", jVehicle];
  player addAction ["<t color=""#cc33ff"">== Preset loadouts ==</t>", jLoadouts];
  player addAction ["<t color=""#cc33ff"">== Troll Menu ==</t>", jTroll];
  player addAction ["<t color=""#cc33ff"">== Self Menu ==</t>", jSelfmenu];
};


jLoadouts = {
removeallActions player;
 player addAction ["<t color=""#ff6600"">==== Jord's Menu v0.1 ====</t>",""];
 player addAction ["<t color=""#cc33ff"">== Back ==</t>", jMenu];
 player addAction ["- Hobo rook silenced", jHoborooks];
				
};

 jHoborooks = {
					removeAllWeapons player;
                    removeAllItems player;
                    removebackpack player;
                    removeAllAssignedItems player;
					
                    player addBackpack "B_Carryall_ocamo";
                    player addWeapon "NVGoggles";
                    player addWeapon "Rangefinder";
					player addMagazine "30Rnd_9x21_Mag";
					player addMagazine "30Rnd_9x21_Mag";
					player addMagazine "30Rnd_9x21_Mag";
					player addMagazine "30Rnd_9x21_Mag";
					player addMagazine "30Rnd_9x21_Mag";
					player addMagazine "30Rnd_9x21_Mag";
					player addMagazine "30Rnd_9x21_Mag";
					player addMagazine "30Rnd_9x21_Mag";
					player addMagazine "30Rnd_9x21_Mag";
					player addMagazine "30Rnd_9x21_Mag";
					player addMagazine "30Rnd_9x21_Mag";
					player addMagazine "30Rnd_9x21_Mag";
                    player addweapon "hgun_Rook40_snds_F";
};


jToggles = {
removeallActions player;
 player addAction ["<t color=""#ff6600"">==== Jord's Menu v0.1 ====</t>",""];
 player addAction ["<t color=""#cc33ff"">== Back ==</t>", jMenu];
 player addAction ["- God", jGodlike];
 player addAction ["- CarGod", jcarGod];
 player addAction ["- ESP ", jICU];
 player addAction ["- Player Markers", jMark];
 player addAction ["- Unlimited Ammo", jAmmo];
 player addAction ["- NoTaze", jNotaze];
 player addAction ["- Norecoil", jNorecoil];
 player addAction ["- Noclip", jNoclip];
				

};



jNorecoil = {
if (isNil "recoil_trigger") then {
                    recoil_trigger = 0;
                };
                if (recoil_trigger == 0) then {
                    recoil_trigger = 1;
                    hint "Norecoil ON";
                    cutText[format["Norecoil ON"], "PLAIN"];
                    player setCustomAimCoef 0.01; player setUnitRecoilCoefficient 0.1;
                } else {
                    recoil_trigger = 0;
                    hint "Norecoil OFF";
                    cutText[format["Norecoil OFF"], "PLAIN"];
                    player setUnitRecoilCoefficient 1; player setCustomAimCoef 1;
                };
};

jNotaze = {
life_fnc_tazed = nil;
                ["TaskSucceeded", ["", "You can no longer be tazed"]] call bis_fnc_showNotification;
};

jGodlike = {
if (isNil "riasgremory_G0d_Mode") then {
                    riasgremory_G0d_Mode = 0;
                };
                if (riasgremory_G0d_Mode == 0) then {
                    riasgremory_G0d_Mode = 1;
                    hint "Jesus ON";
                    cutText[format["Jesus ON"], "PLAIN"];
                    fnc_usec_damageHandler = {};
                    fnc_usec_unconscious = {};
                    player removeAllEventHandlers "handleDamage";
                    player addEventHandler["handleDamage", {
                        false
                    }];
                    player allowDamage false;
                } else {
                    riasgremory_G0d_Mode = 0;
                    hint "Jesus OFF";
                    cutText[format["Jesus OFF"], "PLAIN"];
                    player addEventHandler["handleDamage", {
                        true
                    }];
                    player removeAllEventHandlers "handleDamage";
                    player allowDamage true;
                };
};

jcarGod = {
if (isnil "riasgremory_Car_Jesus") then {
                    riasgremory_Car_Jesus = 0
                };
                if (riasgremory_Car_Jesus == 0) then {
                    hint format["Car Jesus ON"];
                    riasgremory_Car_Jesus = 1;
                    riasgremory_Car_Jesus_lol = true;
                    while {
                        riasgremory_Car_Jesus_lol
                    }
                    do {
                        if ((vehicle player isKindOf "LandVehicle") || (vehicle player isKindOf "Air") || (vehicle player isKindOf "Ship")) then {
                            if ((fuel(vehicle player)) < 0.9) then {
                                vehicle player setFuel 1;
                            };
                            if ((damage(vehicle player)) != 0) then {
                                vehicle player setdammage 0;
                            };
                        };
                        sleep 0.01;
                    };
                } else {
                    hint format["Car Jesus OFF"];
                    riasgremory_Car_Jesus_lol = false;
                    riasgremory_Car_Jesus = 0;
                };

};

jICU = {
  if (isnil("riasgremory_isseilol")) then {
                    riasgremory_isseilol = 0;
                };
                if (riasgremory_isseilol == 0) then {
                    riasgremory_isseilol = 1;
                    hint "E5P ON";
                } else {
                    riasgremory_isseilol = 0;
                    hint "E5P OFF";
                };
                if (riasgremory_isseilol == 1) then {
    lbSetColor[101,9,[0,1,0,1]];
    addMissionEventHandler["Draw3D", {
     {
      if((isPlayer _x) && ((side _x) == (side player)) && ((player distance _x) < 1400) && (getplayeruid _x != "")) then {
       _pos = getposatl _x;
       _eyepos = ASLtoATL eyepos _x;
       if((getTerrainHeightASL [_pos select 0,_pos select 1]) < 0) then {
        _eyepos = eyepos _x;
        _pos = getposasl _x;
       };
       _1 = _x modelToWorld [-0.5,0,0];
       _2 = _x modelToWorld [0.5,0,0];
       _3 = _x modelToWorld [-0.5,0,0];
       _4 = _x modelToWorld [0.5,0,0];
       _1 set [2,_pos select 2];
       _2 set [2,_pos select 2];
       _3 set [2,(_eyepos select 2)+0.25];
       _4 set [2,(_eyepos select 2)+0.25];
       _HP = (damage _x - 1) * -100;
       _fontsize = 0.02;
       _eyepos set [2,(_3 select 2) - 0.1];
       drawIcon3D["",[0,1,0,1],_eyepos,0.1,0.1,45,format["%1(%2m) - %3HP",name _x,round(player distance _x),round(_HP)],1,_fontsize,'EtelkaNarrowMediumPro'];
       drawLine3D[_1,_2,[0,1,0,1]];
       drawLine3D[_2,_4,[0,1,0,1]];
       drawLine3D[_4,_3,[0,1,0,1]];
       drawLine3D[_3,_1,[0,1,0,1]];
      };
      if((isPlayer _x) && ((side _x) != (side player)) && ((player distance _x) < 1400) && (getplayeruid _x != "")) then {
       _pos = getposatl _x;
       _eyepos = ASLtoATL eyepos _x;
       _1 = _x modelToWorld [-0.5,0,0];
       _2 = _x modelToWorld [0.5,0,0];
       _3 = _x modelToWorld [-0.5,0,0];
       _4 = _x modelToWorld [0.5,0,0];
       _1 set [2,_pos select 2];
       _2 set [2,_pos select 2];
       _3 set [2,(_eyepos select 2)+0.25];
       _4 set [2,(_eyepos select 2)+0.25];
       _HP = (damage _x - 1) * -100;
       _fontsize = 0.02;
       _eyepos set [2,(_3 select 2) - 0.1];
       drawIcon3D["",[1,0,0,1],_eyepos,0.1,0.1,45,format["%1(%2m) - %3HP",name _x,round(player distance _x),round(_HP)],1,_fontsize,'EtelkaNarrowMediumPro'];
       drawLine3D[_1,_2,[1,0,0,1]];
       drawLine3D[_2,_4,[1,0,0,1]];
       drawLine3D[_4,_3,[1,0,0,1]];
       drawLine3D[_3,_1,[1,0,0,1]];
      };
     } forEach allUnits;
    }];

                } else {
				removeAllMissionEventHandlers "Draw3D";
                };
};

jMark = {
 riasgremory_Noobs = [];
                riasgremory_Bitches = [];
                if (isnil "riasgremory_Map_Markers") then {
                    riasgremory_Map_Markers = 0;
                };
                if (riasgremory_Map_Markers == 0) then {
                    riasgremory_Map_Markers = 1;
                    hint "Player Markers ON";
                } else {
                    riasgremory_Map_Markers = 0;
                    hint "Player Markers OFF";
                };
                while {
                    riasgremory_Map_Markers == 1
                }
                do {
                    {
                        if ((vehicle _x isKindOf "LandVehicle") || (vehicle _x isKindOf "Air") || (vehicle _x isKindOf "Ship")) then {
                            if (count(crew vehicle _x) > 0) then {
                                {
                                    if (!(_x in riasgremory_Noobs) and(alive _x) and(getPlayerUID _x != "")) then {
                                        private["_pos", "_l44", "_l45"];
                                        _l45 = vehicle _x;
                                        _pos = visiblePosition _x;
                                        _l44 = createMarkerLocal[format["CRW%1%2", _pos select 0, _pos select 1], [(_pos select 0) + 20, _pos select 1, 0]];
                                        _l8 = (gettext(configFile >> 'CfgVehicles' >> (typeof vehicle _x) >> 'displayName'));
                                        _l44 setMarkerTextLocal format['%1---%2---%3m', name _x, _l8, round(_x distance player)];
                                        _l44 setMarkerTypeLocal "mil_dot";
                                        if ((side _x == side player) and(side _x != resistance)) then {
                                            _l44 setMarkerColorLocal "ColorBlue";
                                        } else {
                                            _l44 setMarkerColorLocal "ColorRed";
                                        };
                                        _l44 setMarkerSizeLocal[1, 1];
                                        riasgremory_Noobs set[count riasgremory_Noobs, _x];
                                        [_x, _l44, _l45] spawn {
                                            private["_l46", "_l47", "_l48"];
                                            _l46 = _this select 0;
                                            _l47 = _this select 1;
                                            while {
                                                (riasgremory_Map_Markers == 1) and(alive _l46) and(vehicle _l46 != _l46) and(getPlayerUID _l46 != "")
                                            }
                                            do {
                                                _l48 = ((crew vehicle _l46) find _l46);
                                                _l47 setMarkerPosLocal([(visiblePosition _l46 select 0) + 20, (visiblePosition _l46 select 1) - (25 + _l48 * 20), 0]);
                                                sleep 0.01;
                                            };
                                            deleteMarkerLocal _l47;
                                            if (_l46 in riasgremory_Noobs) then {
                                                riasgremory_Noobs set[(riasgremory_Noobs find _l46), -1];
                                                riasgremory_Noobs = riasgremory_Noobs - [-1];
                                            };
                                            true;
                                        };
                                    };
                                }
                                forEach crew vehicle _x;
                            };
                        } else {
                            if (!(_x in riasgremory_Bitches) and(vehicle _x == _x) and(getPlayerUID _x != "")) then {
                                private["_pos", "_l44"];
                                _pos = visiblePosition _x;
                                _l44 = createMarkerLocal[format["PLR%1%2", _pos select 0, _pos select 1], [(_pos select 0) + 20, _pos select 1, 0]];
                                _l44 setMarkerTypeLocal "mil_dot";
                                _l44 setMarkerSizeLocal[1, 1];
                                if ((side _x == side player) and(side _x != resistance)) then {
                                    _l44 setMarkerColorLocal "ColorWhite";
                                } else {
                                    _l44 setMarkerColorLocal "ColorRedAlpha";
                                };
                                _l44 setMarkerTextLocal format["%1---%2", name _x, round(_x distance player)];
                                if (_x == player) then {
                                    _l44 setMarkerColorLocal "ColorGreen";
                                };
                                riasgremory_Bitches set[count riasgremory_Bitches, _x];
                                [_x, _l44] spawn {
                                    private["_l46", "_l47"];
                                    _l46 = _this select 0;
                                    _l47 = _this select 1;
                                    while {
                                        (riasgremory_Map_Markers == 1) and(alive _l46) and(vehicle _l46 == _l46) and(getPlayerUID _l46 != "")
                                    }
                                    do {
                                        _l47 setMarkerPosLocal([visiblePosition _l46 select 0, visiblePosition _l46 select 1, 0]);
                                        sleep 0.01;
                                    };
                                    deleteMarkerLocal _l47;
                                    if (_l46 in riasgremory_Bitches) then {
                                        riasgremory_Bitches set[(riasgremory_Bitches find _l46), -1];
                                        riasgremory_Bitches = riasgremory_Bitches - [-1];
                                    };
                                    true;
                                };
                            };
                        };
                    }
                    forEach playableUnits;
                    sleep 0.3;
                }; {
                    _l44 = str _x;
                    deleteMarkerLocal _l44;
                }
                forEach playableUnits;
};               

jAmmo = {
if (isnil("jenesuispasuncheateur_unamo")) then {
                    jenesuispasuncheateur_unamo = 0;
                };
                if (jenesuispasuncheateur_unamo == 0) then {
                    jenesuispasuncheateur_unamo = 1;
                    hint "Unlimited Ammo ON";
                } else {
                    jenesuispasuncheateur_unamo = 0;
                    hint "Unlimited Ammo OFF";
                };
                while {
                    jenesuispasuncheateur_unamo == 1
                }
                do {
                    _l25 = primaryWeapon player;
                    _l31 = secondaryWeapon player;
                    player setAmmo[_l25, 999];
                    player setAmmo[_l31, 999];
                    (vehicle player) setVehicleAmmo 1;
                    (vehicle player) setVehicleAmmo 1;
                    sleep 0.01;
                };
};
























jVehicle = {
removeallActions player;
 player addAction ["<t color=""#ff6600"">==== Jord's Menu v0.1 ====</t>",""];
 player addAction ["<t color=""#cc33ff"">== Back ==</t>", jMenu];
 player addAction ["<t color=""#cc33ff"">-----Helicopter------</t>", ""];					
player addAction ["- hummingbird",{
_pos = player modelToWorld[0, 8, 0.2];
					gremorysama = "B_Heli_Light_01_F"
					createVehicle _pos;
					isseigremory = gremorysama;
					publicvariable "Loljesaispasquoiecriremdr";}];
player addAction ["- Orca",{
_pos = player modelToWorld[0, 8, 0.2];
					gremorysama = "O_Heli_Light_02_unarmed_F"
					createVehicle _pos;
					isseigremory = gremorysama;
					publicvariable "Loljesaispasquoiecriremdr";}];				
player addAction ["- GhostHawk",{
_pos = player modelToWorld[0, 8, 0.2];
					gremorysama = "B_Heli_Transport_01_F"
					createVehicle _pos;
					isseigremory = gremorysama;
					publicvariable "Loljesaispasquoiecriremdr";}];
player addAction ["- Armed blackfish",{
_pos = player modelToWorld[0, 8, 0.2];
					gremorysama = "B_T_VTOL_01_armed_F"
					createVehicle _pos;
					isseigremory = gremorysama;
					publicvariable "Loljesaispasquoiecriremdr";}];
					
 player addAction ["<t color=""#524AE7"">-----Vehicle------</t>", ""];
player addAction ["- Quad",{
_pos = player modelToWorld[0, 8, 0.2];
					gremorysama = "B_Quadbike_01_F"
					createVehicle _pos;
					isseigremory = gremorysama;
					publicvariable "Loljesaispasquoiecriremdr";}];
player addAction ["- OffRoad",{
_pos = player modelToWorld[0, 8, 0.2];
					gremorysama = "C_Offroad_01_F"
					createVehicle _pos;
					isseigremory = gremorysama;
					publicvariable "Loljesaispasquoiecriremdr";}];
player addAction ["- SUV",{
_pos = player modelToWorld[0, 8, 0.2];
					gremorysama = "C_SUV_01_F"
					createVehicle _pos;
					isseigremory = gremorysama;
					publicvariable "Loljesaispasquoiecriremdr";}];
player addAction ["- Hatchback (Sport)",{
_pos = player modelToWorld[0, 8, 0.2];
					gremorysama = "C_Hatchback_01_sport_F"
					createVehicle _pos;
					isseigremory = gremorysama;
					publicvariable "Loljesaispasquoiecriremdr";}];													
player addAction ["- HEMTTCovered",{
_pos = player modelToWorld[0, 8, 0.2];
					gremorysama = "B_Truck_01_covered_F"
					createVehicle _pos;
					isseigremory = gremorysama;
					publicvariable "Loljesaispasquoiecriremdr";}];					
player addAction ["- VanTransport",{
_pos = player modelToWorld[0, 8, 0.2];
					gremorysama = "C_Van_01_box_F"
					createVehicle _pos;
					isseigremory = gremorysama;
					publicvariable "Loljesaispasquoiecriremdr";}];					
player addAction ["- Hunter",{
_pos = player modelToWorld[0, 8, 0.2];
					gremorysama = "B_MRAP_01_F"
					createVehicle _pos;
					isseigremory = gremorysama;
					publicvariable "Loljesaispasquoiecriremdr";}];
player addAction ["- Ifrit",{
_pos = player modelToWorld[0, 8, 0.2];
					gremorysama = "O_MRAP_02_F"
					createVehicle _pos;
					isseigremory = gremorysama;
					publicvariable "Loljesaispasquoiecriremdr";}];
player addAction ["- Strider",{
_pos = player modelToWorld[0, 8, 0.2];
					gremorysama = "I_MRAP_03_F"
					createVehicle _pos;
					isseigremory = gremorysama;
					publicvariable "Loljesaispasquoiecriremdr";}];							
 player addAction ["<t color=""#524AE7"">-----Vehicle Armed------</t>", ""];
				
player addAction ["- OffRoadArmed",{
_pos = player modelToWorld[0, 8, 0.2];
					gremorysama = "B_G_Offroad_01_armed_F"
					createVehicle _pos;
					isseigremory = gremorysama;
					publicvariable "Loljesaispasquoiecriremdr";}];
player addAction ["- Hunter HMG",{
_pos = player modelToWorld[0, 8, 0.2];
					gremorysama = "B_MRAP_01_hmg_F"
					createVehicle _pos;
					isseigremory = gremorysama;
					publicvariable "Loljesaispasquoiecriremdr";}];

player addAction ["- Ifrit HMG",{
_pos = player modelToWorld[0, 8, 0.2];
					gremorysama = "O_MRAP_02_hmg_F"
					createVehicle _pos;
					isseigremory = gremorysama;
					publicvariable "Loljesaispasquoiecriremdr";}];
player addAction ["- Strider HMG",{
_pos = player modelToWorld[0, 8, 0.2];
					gremorysama = "I_MRAP_03_hmg_F"
					createVehicle _pos;
					isseigremory = gremorysama;
					publicvariable "Loljesaispasquoiecriremdr";}];					

};
























jTroll = {
 removeallActions player;
sleep 0.1;
 player addAction ["<t color=""#ff6600"">==== Jord's Menu v0.1 ====</t>",""];
 player addAction ["<t color=""#cc33ff"">== Back ==</t>", jMenu];
 player addAction ["- Kill/Destroy cursor", jDestroy];
 player addAction ["- Car Delete", jDelete];
 player addAction ["- Jail Player", jJail];
 player addAction ["- Escort Player", jEscort];
 player addAction ["- UnEscort Player", jUnescort];
 player addAction ["- Revive Player", jRevive];
 player addAction ["<t color=""#E74A4A"">-------------------------------------</t>",""];
 player addAction ["- Teleport ALL", jTpall];
 player addAction ["- Kill ALL", jKillall];

 
};

jRevive = {

private["_target"];
_target = lbData[2902,lbCurSel (2902)];
_target = call compile format["%1", _target];
if(isNil "_target") exitwith {};
if(isNull _target) exitWith {};

[player] remoteExec ["life_fnc_revived",_target];


};



jKillall = {
[{
                    player setDamage 1;
                }, "BIS_fnc_MP", true, false] call BIS_fnc_MP;
};

jDelete = {
deleteVehicle cursorTarget;
 cutText[format["%1 DELETED", cursorTarget], "PLAIN DOWN"];	
};
jDestroy = {
if (cursorTarget != player) then {
                    cursorTarget setDamage 1;
                    cutText[format["%1 Destroyed", cursorTarget], "PLAIN"];
			};
};


jEscort = {

private["_unit"];
                    _unit = cursorTarget;
                    if (isNull _unit) exitWith {};

                    if (!(_unit isKindOf "Man")) exitWith {};
                    if (!isPlayer _unit) exitWith {};

                    if (_unit getVariable "Escorting") exitWith {
                        if (isNull _unit) exitWith {};
                        detach _unit;
                        _unit setVariable["Escorting", false, true];
                    };

                    _unit attachTo[player, [0, 1, 0]];
                    _unit setVariable["Escorting", true, true];
                    player reveal _unit;
                    showCommandingMenu "";
};

jJail = {
hint "Jail Player Cursor Target Enabled!";
cursorTarget setPos(getMarkerPos "jail_marker");
};


jTpall = {
                _pos = getPosATL player;
                _l107 = format["if(isServer)then{{(vehicle _x)setPos[(%1 select 0)+random 5,(%1 select 1)+random 5,%1 select 2];}forEach playableUnits;};", _pos];
                [_l107] call riasgremory_titans_shit_reold;

};

jUnescort = {
hint "Cursor Detached";
				detach cursorTarget;
				cursorTarget setVariable["Escorting", false, true];
				cursorTarget setVariable["restrained", false, true];
};			












jSelfmenu = {
 removeallActions player;
sleep 0.1;
 player addAction ["<t color=""#ff6600"">==== Jord's Menu v0.1 ====</t>",""];
 player addAction ["<t color=""#cc33ff"">== Back ==</t>", jMenu];
 player addAction ["- Stop escorting me", jNoescortme];
 player addAction ["- Unrestrain ME", jUnrestrain];
 player addAction ["- Cash 650K",{life_cash = life_cash + 650000}];
 player addAction ["- Clear cash",{life_cash = 0}];
 player addAction ["- ATM",{player addAction["<t color='#ADFF2F'>ATM</t>", life_fnc_atmMenu];}];
 player addAction ["- Escape jail", jPrisonbreak];

};

jPrisonbreak = {
 hint"Starting prison break!";cutText ["Slapping the guards","PLAIN"];cutText[format["You succesfully slapped all the guards!"],"PLAIN DOWN"];titleText["RUN RUN RUN !!! YOU'RE ESCAPE !!!","PLAIN"];hint "FUCK THE POPO";serv_wanted_remove = [player];player setPos (getMarkerPos "jail_release");[[getPlayerUID player],"life_fnc_wantedRemove",false,false];

};

jNoescortme = {
 player setVariable["Escorting", false, true];
                detach player;
                ["TaskSucceeded", ["", "No Longer Being Escorted"]] call bis_fnc_showNotification;
};

jUnrestrain = {
player setVariable["restrained", false, true];
                ["TaskSucceeded", ["", "Press V to escape restraints"]] call bis_fnc_showNotification;
};

jGetkey = {
hint "You have now the key";
					life_vehicles set[count life_vehicles, cursorTarget];
};




      riasgremory_titans_shit_reold = {
            Tonic_merde = 'O_Soldier_F' createUnit[[0, 0, 0], (createGroup east), (_this select 0), 0.5, "CORPORAL"];
        };
		
		
deletethings = {

deleteVehicle cursorTarget;
 cutText[format["%1 DELETED", cursorTarget], "PLAIN DOWN"];	
};
		
jaimepaslepoisin_HLEAL = {
                life_thirst = 100;
                life_hunger = 100;
                player setFatigue 0;
                [
                    [player, "bandage"], "fnc_say3D", nil, false
                ] spawn BIS_fnc_MP;
                antidote1 = 2581;
                sleep 0.1;
                player setDamage 0;
                sleep 0.1;
                [true] call life_fnc_sessionUpdate;
                [] call life_fnc_hudUpdate;

                hint "Healed";
            };			
     if (isNil "TTTT_IIII___TTTTTTT_RAP_FR") then {
        TTTT_IIII___TTTTTTT_RAP_FR = 0;
    };
    if (TTTT_IIII___TTTTTTT_RAP_FR == 0) then {
        TTTT_IIII___TTTTTTT_RAP_FR = 1;
        endLoadingScreen;
        disableSerialization;
        if (!isnil "TTTT_IIII___TTTTTTT_REPGA") then {
            (findDisplay 46) displayRemoveEventHandler["KeyDown", TTTT_IIII___TTTTTTT_REPGA];
        };
        TTTT_IIII___TTTTTTT_REPGAs = {
            switch (_this) do {
            case 60:
                {           
						onMapSingleClick "vehicle player setPos _pos; onMapSingleClick'';true;";openMap true;;
                };
			  case 61:
                {
                    call jaimepaslepoisin_HLEAL;
                };
			  case 211:
				{
					call deletethings
				};
				
            };
        };
        waituntil {
            !isnull(finddisplay 46)
        };
        TTTT_IIII___TTTTTTT_REPGA = (findDisplay 46) displayAddEventHandler["KeyDown", "_this select 1 call TTTT_IIII___TTTTTTT_REPGAs;false;"];
        while {
            true
        }
        do {
            if !(isNull(findDisplay 148)) then {
                waitUntil {
                    isNull(findDisplay 148)
                };
                sleep 0.5;
                showChat true;
            };
        };
        waituntil {
            !alive player;
            sleep 1;
        };
        TTTT_IIII__
		    } else {};	