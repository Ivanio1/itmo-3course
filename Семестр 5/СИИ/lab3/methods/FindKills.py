from swiplserver import PrologThread


class FindKills:
    def run(self, prolog: PrologThread):
        res = prolog.query(self.query())
        if not res or len(res) == 0:
            self.failure(res)
        else:
            self.success(res)

    def __init__(self, kill: str):
        self.kill = kill

    def query(self):
        return f'kill({self.kill},X)'

    def success(self, res):
        print(f'Найдено {len(res)} жертвы {self.kill}:')
        for index, line in enumerate(res, 1):
            print(f'{index}.', line['X'])

    def failure(self, res):
        print(f'{self.kill} никого не убивал.')
