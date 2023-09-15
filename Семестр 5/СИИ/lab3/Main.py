from swiplserver import PrologMQI, create_posix_path
from methods import FindWeaponStats, FindKills, FindMap, GetTeamMembers, MainQuery

import re

KNOWLEDGE_BASE_PATH = r'C:\Users\Asus\PycharmProjects\lab3\lab1.pl'

queries = [
    "\n * Какое оружие имеет 13 патронов и 38 урон?",
    "Кого убил number_k? (the_doctor_romanov, mr_muhlik, michael_syfers, jacques_beltram, john_kask, capitan_davida,vaipa)",
    "Какие карты относятся к competitive? (flying_scoutsman, danger_zone)",
    "Выведи список участников команды terrorists (counterterrorists)",
    "Меня зовут Иван, я - добрый/злой, люблю оружие ближнего/дальнего поражения и взрывы/скрытность (Меня зовут Иван, я - злой, люблю оружие дальнего поражения и скрытность)"

]

patterns = {
    r'Какое оружие имеет (.+) патронов и (.+) урон\?': FindWeaponStats.FindWeaponStats,
    r'Кого убил (.+)\?': FindKills.FindKills,
    r'Какие карты относятся к (.+)\?': FindMap.FindMap,
    r'Выведи список участников команды (.+)': GetTeamMembers.GetTeamMembers,
    "Меня зовут (.+), я - (.+), люблю оружие (.+) поражения и (.+)": MainQuery.MainQuery

}

with PrologMQI() as mqi:
    with mqi.create_thread() as prolog:
        path = create_posix_path(KNOWLEDGE_BASE_PATH)
        prolog.query(f'consult("{path}")')
        print("Успешно загружена база знаний Prolog!")
        print("\nПримеры запросов, которые вам доступны:", "\n * ".join(queries))
        print("\nДля завершения введите - exit.")
        while True:
            query = input('$ ')
            if query.lower() == 'exit':
                break

            for pattern in patterns:
                match = re.match(pattern, query, re.IGNORECASE)
                if match is None:
                    continue
                processor = patterns[pattern](*match.groups())
                processor.run(prolog)
                break
            else:
                print("Неверный запрос")
