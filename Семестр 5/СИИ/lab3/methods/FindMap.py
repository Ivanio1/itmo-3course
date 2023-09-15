from swiplserver import PrologThread


class FindMap:
    def run(self, prolog: PrologThread):
        res = prolog.query(self.query())
        if not res or len(res) == 0:
            self.failure(res)
        else:
            self.success(res)

    def __init__(self, map_type: str):
        self.map_type = map_type

    def query(self):
        return f'map_type(X, {self.map_type})'

    def success(self, res):
        print(f'Найдено {len(res)} карт, которые относятся к {self.map_type}:')
        for index, line in enumerate(res, 1):
            print(f'{index}.', line['X'])

    def failure(self, res):
        print(
            f'Нет карт, относящихся к {self.map_type}.')
