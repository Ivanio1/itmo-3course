%База знаний об игре Counter Strike Global Offensive


/*Факты*/

/*Свойства*/
%Факты о том, какие команды в игре (свойство команды)
team_in_game(terrorists).
team_in_game(counterterrorists).

%Факты о том, что карта доступна в игре (свойство карты)
active_map(de_dust2).
active_map(de_mirage).
active_map(dz_sirrocco).

%Факты о том, что персонаж является игроком (свойство персонажа)
active_player(the_doctor_romanov).
active_player(number_k).
active_player(mr_muhlik).
active_player(michael_syfers).
active_player(jacques_beltram).
active_player(john_kask).
active_player(capitan_davida).
active_player(vaipa).


%Факты о том, что данный тип оружия в игре (свойство типа оружия)
active_weapon_type(rifle).
active_weapon_type(grenade).
active_weapon_type(shotgun).
active_weapon_type(pistol).

%Факты о том, что данное оружие в игре. (свойство оружия)
active_weapon(ak47).
active_weapon(awp).
active_weapon(p250).
active_weapon(usp_s).
active_weapon(mag7).
active_weapon(xm1014).
active_weapon(fire_grenade).
active_weapon(smoke_grenade).

%Факты об уроне оружия (свойство оружия)
weapon_damage(ak47, 36).
weapon_damage(awp, 115).
weapon_damage(p250, 38).   
weapon_damage(mag7,30).
weapon_damage(usp_s, 35).
weapon_damage(xm1014,20).
weapon_damage(tec9,33).

%Факты о количестве патронов в оружии (свойство оружия)
weapon_magazine(ak47, 30).
weapon_magazine(awp, 5).
weapon_magazine(p250, 13).   
weapon_magazine(mag7, 5).
weapon_magazine(usp_s, 12).
weapon_magazine(xm1014,7).
weapon_magazine(tec9,18).

%Факты о типе игровых карт (свойство карты)
map_type(de_dust2, competitive).
map_type(de_mirage, competitive).
map_type(ar_dizzy, flying_scoutsman).
map_type(dz_sirrocco, danger_zone).
map_type(de_inferno, competitive).
map_type(dz_vineyard, danger_zone).

%Факты о поле игрока (свойство игрока)
player_sex(the_doctor_romanov,man).
player_sex(number_k,man).
player_sex(mr_muhlik,man).
player_sex(michael_syfers,man).
player_sex(jacques_beltram,man).
player_sex(john_kask,man).
player_sex(capitan_davida, woman).
player_sex(vaipa, woman).

/*Отношения*/
%Факты о наличие оружия у игрока (отношение оружия и игрока)
player_weapon(the_doctor_romanov, ak47).
player_weapon(number_k, p250).
player_weapon(vaipa, p250).
player_weapon(mr_muhlik,xm1014).
player_weapon(michael_syfers, awp).
player_weapon(jacques_beltram, p250).
player_weapon(john_kask, mag7).
player_weapon(capitan_davida, awp).

%Факты о наличие гранаты у игрока (отношение гранаты и игрока)
player_grenade(the_doctor_romanov, smoke_grenade).
player_grenade(mr_muhlik,fire_grenade).
player_grenade(john_kask,fire_grenade).
player_grenade(capitan_davida,smoke_grenade).



%Факты убийства игроков во время игры (отношение двух игроков)
kill(number_k,michael_syfers).
kill(jacques_beltram,mr_muhlik).
kill(number_k,jacques_beltram).
kill(the_doctor_romanov,john_kask).
kill(vaipa,capitan_davida).


%Факты о командах игроков (отношение игрока и команды)
player_team(the_doctor_romanov, terrorists).
player_team(number_k, terrorists).
player_team(mr_muhlik, terrorists).
player_team(vaipa, terrorists).
player_team(michael_syfers, counterterrorists).
player_team(jacques_beltram, counterterrorists).
player_team(john_kask, counterterrorists).
player_team(capitan_davida, counterterrorists).


%Факты о типе оружия (отношение оружия и его типа)
weapon_type(ak47, rifle).
weapon_type(awp, rifle).
weapon_type(p250, pistol).
weapon_type(usp_s, pistol).
weapon_type(tec9, pistol).
weapon_type(mag7, shotgun).
weapon_type(xm1014, shotgun).
weapon_type(fire_grenade, grenade).
weapon_type(smoke_grenade, grenade).


/*Правила*/
%Правило о принадлежности к террористам
is_terrorist(Character):-
     active_player(Character),
     player_team(Character, terrorists).

%Правило о принадлежности к контртеррористам
is_counterterrorist(Character):-
     active_player(Character),
     player_team(Character, counterterrorists).

%Правило о наличии дробовика
is_character_has_shotgun(Character):-
    active_player(Character),
	player_weapon(Character,Weapon),
    weapon_type(Weapon,shotgun).

%Правило о наличии пистолета
is_character_has_pistol(Character):-
    active_player(Character),
	player_weapon(Character,Weapon),
    weapon_type(Weapon,pistol).	

%Правило о наличии автомата
is_character_has_rifle(Character):-
    active_player(Character),
	player_weapon(Character,Weapon),
    weapon_type(Weapon,rifle).	

%Правило, проверяющее является ли карта соревновательной и активной
is_map_competitive(Map):-
    active_map(Map),
	map_type(Map,competitive).

%Правило, проверяющее возможность бросить определённую гранату
ability_to_throw_grenade(Character, Grenade):-
   active_player(Character),
   player_grenade(Character,Grenade).	

%Правило, проверяющее есть ли в команде гранаты
has_team_grenades(Team):-
    team_in_game(Team),
    player_team(Character, Team),
    player_weapon(Character,Weapon),
    weapon_type(Weapon,grenade).


