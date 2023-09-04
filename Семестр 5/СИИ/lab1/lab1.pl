%База знаний об игре Counter Strike Global Offensive


/*Факты*/

%Факты о том, что персонаж является игроком
player(TheDoctorRomanov)
player(NumberK).
player(MrMuhlik).
player(MichaelSyfers).
player(JacquesBeltram).
player(JohnKask).

%Факты о том, что данное оружие в игре.
active_weapon(AK47).
active_weapon(AWP).
active_weapon(P250).
active_weapon(MAG7).
active_weapon(Fire Grenade).



%Факты о том, какие оружием является 
weapon(AK47, rifle).
weapon(AWP, rifle).
weapon(P250, pistol).
weapon(MAG7, shotgun).
weapon(Fire Grenade, grenade).

%Факты о наличие оружия у игрока 
character_weapon(TheDoctorRomanov, AK47).
character_weapon(NumberK, P250).
character_weapon(MrMuhlik, Fire Grenade).
character_weapon(MichaelSyfers, AWP).
character_weapon(JacquesBeltram, P250).
character_weapon(JohnKask, MAG7).



%Предикаты
%Предикаты о типе оружия 
%Пистолет является стрелковым оружием
weapon_type(pistol, shooting).

%Автомат является стрелковым оружием
weapon_type(rifle, shooting).

%Дробовик является стрелковым оружием
weapon_type(shotgun, shooting).

%Граната является разрывным оружием
weapon_type(grenade, explosive).


%Предикаты о типе карт
map_type(de_dust2, competitive).
map_type(de_mirage, competitive).
map_type(ar_dizzy, flying scoutsman).
map_type(dz_sirrocco, danger zone).
map_type(de_inferno,competitive).
map_type(dz_vineyard, danger zone).


%Предикаты о командах игроков
character_team(TheDoctorRomanov, terrorists).
character_team(NumberK, terrorists).
character_team(MrMuhlik, terrorists).
character_team(MichaelSyfers, counterterrorists).
character_team(JacquesBeltram, counterterrorists).
character_team(JohnKask, counterterrorists).




%Правила
%Правило о принадлежности к террористам

%Правило о принадлежности к контртеррористам

%Правило о возможности убить

%Правило о наличии дробовика
is_character_has_shotgun(Character, Weapon):-
	character_weapon(Character, Weapon), 
	weapon(Weapon, shotgun).

%Правило, проверяющее является ли карта соревновательной



