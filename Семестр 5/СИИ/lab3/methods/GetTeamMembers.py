from swiplserver import PrologThread


class GetTeamMembers:
    def run(self, prolog: PrologThread):
        res = prolog.query(self.query())
        if not res or len(res) == 0:
            self.failure(res)
        else:
            self.success(res)

    def __init__(self, team: str):
        self.team = team

    def query(self):
        return f'player_team(X,{self.team})'

    def success(self, res):
        print(f'Найдено {len(res)} участника(-ов) команды {self.team}:')
        for index, line in enumerate(res, 1):
            print(f'{index}.', line['X'])

    def failure(self, res):
        print(f'За {self.team} никто не играет.')
