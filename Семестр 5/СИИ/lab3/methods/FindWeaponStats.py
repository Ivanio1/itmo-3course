from swiplserver import PrologThread


class FindWeaponStats:
    def run(self, prolog: PrologThread):
        res = prolog.query(self.query())
        if not res or len(res) == 0:
            self.failure(res)
        else:
            self.success(res)

    def __init__(self, weapon_magazine: str, weapon_damage: str):
        self.weapon_magazine = weapon_magazine
        self.weapon_damage = weapon_damage

    def query(self):
        return f'weapon_magazine(X, {self.weapon_magazine}), weapon_damage(X,{self.weapon_damage})'

    def success(self, res):
        print(f'Найдено {len(res)} оружие(-ия) с такими параметрами:')
        for index, line in enumerate(res, 1):
            print(f'{index}.', line['X'])

    def failure(self, res):
        print(
            f'Нет оружий с {self.weapon_magazine} патронами и {self.weapon_damage} уроном. Попробуйте другие параметры.')
