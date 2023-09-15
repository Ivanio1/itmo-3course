from swiplserver import PrologThread


class MainQuery:
    def run(self, prolog: PrologThread):
        res = prolog.query(self.query())
        if not res or len(res) == 0:
            self.failure(res)
        else:
            self.success(res)

    def __init__(self, name: str, team: str, weapon: str, grenade: str):
        if team == "добрый":
            team = 'counterterrorists'
        else:
            team = 'terrorists'
        if weapon == "дальнего":
            weapon = 'rifle'
        else:
            weapon = 'shotgun'
        if grenade == "взрывы":
            grenade = 'fire_grenade'
        else:
            grenade = 'smoke_grenade'
        self.name = name,
        self.team = team,
        self.weapon = weapon,
        self.grenade = grenade

    def query(self):
        query = f'player_team(X,{self.team[0]}), player_weapon(X,Y), weapon_type(Y,{self.weapon[0]}), player_grenade(X,{self.grenade}) '
        return query

    def success(self, res):
        print(f'{self.name[0]}, для вас подойдут данные герои:')
        for index, line in enumerate(res, 1):
            print(f'{index}.', line['X'])

    def failure(self, res):
        print(f'{self.name} для вас не найдено героев.')
