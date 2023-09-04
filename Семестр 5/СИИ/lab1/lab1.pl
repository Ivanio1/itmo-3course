%База знаний об игре Counter Strike Global Offensive


/*Факты*/

%Факты о том, какие команды в игре
team(terrorists).
team(counterterrorists).

%Факты о том, что карта в игре
active_map(de_dust2).
active_map(de_mirage).
active_map(dz_sirrocco).

%Факты о том, что персонаж является игроком
player(the_doctor_romanov).
player(number_k).
player(mr_muhlik).
player(michael_syfers).
player(jacques_beltram).
player(john_kask).

%Факты о том, что данное оружие в игре.
active_weapon(ak47).
active_weapon(awp).
active_weapon(p250).
active_weapon(usp_s).
active_weapon(mag7).
active_weapon(xm1014).
active_weapon(fire_grenade).
active_weapon(smoke_grenade).

%Факты о наличие оружия у игрока 
player_weapon(the_doctor_romanov, ak47).
player_weapon(the_doctor_romanov, smoke_grenade).
player_weapon(number_k, p250).
player_weapon(mr_muhlik,fire_grenade).
player_weapon(mr_muhlik,xm1014).
player_weapon(michael_syfers, awp).
player_weapon(jacques_beltram, p250).
player_weapon(john_kask, mag7).

%Факты убийства игроков во время игры
kill(number_k,michael_syfers).
kill(jacques_beltram,mr_muhlik).
kill(number_k,jacques_beltram).
kill(the_doctor_romanov,john_kask).

%Факты о командах игроков
player_team(the_doctor_romanov, terrorists).
player_team(number_k, terrorists).
player_team(mr_muhlik, terrorists).
player_team(michael_syfers, counterterrorists).
player_team(jacques_beltram, counterterrorists).
player_team(john_kask, counterterrorists).



/*Предикаты*/
%Предикаты о типе оружия 
weapon_type(ak47, rifle).
weapon_type(awp, rifle).
weapon_type(p250, pistol).
weapon_type(usp_s, pistol).
weapon_type(mag7, shotgun).
weapon_type(xm1014, shotgun).
weapon_type(fire_grenade, grenade).
weapon_type(smoke_grenade, grenade).

%Предикаты об уроне оружия
weapon_damage(ak47, 36).
weapon_damage(awp, 115).
weapon_damage(p250, 38).   
weapon_damage(mag7,30).
weapon_damage(usp_s, 35). 
weapon_damage(xm1014,20).

%Предикаты о количестве патронов в оружии
weapon_magazine(ak47, 30).
weapon_magazine(awp, 5).
weapon_magazine(p250, 13).   
weapon_magazine(mag7, 5).
weapon_magazine(usp_s, 12). 
weapon_magazine(xm1014,7).

%Предикаты о типе игровых карт
map_type(de_dust2, competitive).
map_type(de_mirage, competitive).
map_type(ar_dizzy, flying_scoutsman).
map_type(dz_sirrocco, danger_zone).
map_type(de_inferno, competitive).
map_type(dz_vineyard, danger_zone).



/*Правила*/
%Правило о принадлежности к террористам
is_terrorist(Character):-
     player(Character),
     player_team(Character, terrorists).

%Правило о принадлежности к контртеррористам
is_counterterrorist(Character):-
     player(Character),
     player_team(Character, counterterrorists).

%Правило о наличии дробовика
is_character_has_shotgun(Character):-
    player(Character),
	player_weapon(Character,Weapon),
    weapon_type(Weapon,shotgun).

%Правило о наличии пистолета
is_character_has_pistol(Character):-
    player(Character),
	player_weapon(Character,Weapon),
    weapon_type(Weapon,pistol).	

%Правило о наличии автомата
is_character_has_rifle(Character):-
    player(Character),
	player_weapon(Character,Weapon),
    weapon_type(Weapon,rifle).	

%Правило, проверяющее является ли карта соревновательной и активной
is_map_competitive(Map):-
    active_map(Map),
	map_type(Map,competitive).

%Правило, проверяющее возможность бросить определённую гранату
ability_to_throw_grenade(Character, Grenade):-
    player(Character),
    player_weapon(Character,Grenade).	

%Правило, проверяющее есть ли в команде гранаты
has_team_grenades(Team):-
    team(Team),
    player_team(Character, Team),
    player_weapon(Character,Weapon),
     weapon_type(Weapon,grenade).


