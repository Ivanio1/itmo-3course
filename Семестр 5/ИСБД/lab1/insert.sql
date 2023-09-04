
INSERT INTO City (cityName, destructionStatus) VALUES ('Диаспар',false);
INSERT INTO City (cityName, destructionStatus) VALUES ('Москва',false);
INSERT INTO City (cityName, destructionStatus) VALUES ('Атлантида',true);
INSERT INTO City (cityName, destructionStatus) VALUES ('Афины',true);


INSERT INTO Human (humanName, profession) VALUES ('Хедрон','Путешественник');
INSERT INTO Human (humanName, profession) VALUES ('Олвин','Военный');
INSERT INTO Human (humanName, profession) VALUES ('Иван','Плотник');
INSERT INTO Human (humanName, profession) VALUES ('Александр','Работник склада');


INSERT INTO Storage (storageName, capacity) VALUES ('Склад №1',500);
INSERT INTO Storage (storageName, capacity) VALUES ('Склад №2',5100);
INSERT INTO Storage (storageName, capacity) VALUES ('Склад №3',1500);

INSERT INTO Path (cityId, humanId, length) VALUES (1,1,100);
INSERT INTO Path (cityId, humanId, length) VALUES (1,2,150);
INSERT INTO Path (cityId, humanId, length) VALUES (3,1,300);
INSERT INTO Path (cityId, humanId, length) VALUES (2,2,230);
INSERT INTO Path (cityId, humanId, length) VALUES (1,4,450);
INSERT INTO Path (cityId, humanId, length) VALUES (4,3,500);

INSERT INTO Location (cityId, storageId) VALUES (1,1);
INSERT INTO Location (cityId, storageId) VALUES (2,3);
INSERT INTO Location (cityId, storageId) VALUES (4,2);

INSERT INTO Mind (humanId) values  (1);
INSERT INTO Mind (humanId) values  (2);
INSERT INTO Mind (humanId) values  (3);
INSERT INTO Mind (humanId) values  (4);

INSERT INTO Oddities (mindId, odditiesType, description) VALUES (1,'Шизофрения','Возможен бред');
INSERT INTO Oddities (mindId, odditiesType, description) VALUES (2,'Уход в себя','Может надолго уйти в раздумья');
INSERT INTO Oddities (mindId, odditiesType, description) VALUES (3,'Нет странностей','Полностью здоров');
INSERT INTO Oddities (mindId, odditiesType, description) VALUES (4,'Суицидальные мысли','Бывают выбросы злости и желание умереть');

INSERT INTO Food (storageId, foodType, numberOfFood) VALUES (1,'Рис',200);
INSERT INTO Food (storageId, foodType, numberOfFood) VALUES (2,'Свинина',100);
INSERT INTO Food (storageId, foodType, numberOfFood) VALUES (3,'Яблоки',50);
INSERT INTO Food (storageId, foodType, numberOfFood) VALUES (2,'Хлеб',20);
INSERT INTO Food (storageId, foodType, numberOfFood) VALUES (3,'Курица',500);

INSERT INTO Weapon (storageId, weaponType, numberOfWeapon) VALUES (1,'АК47',250);
INSERT INTO Weapon (storageId, weaponType, numberOfWeapon) VALUES (3,'Т34',10);
INSERT INTO Weapon (storageId, weaponType, numberOfWeapon) VALUES (2,'с300', 35);
INSERT INTO Weapon (storageId, weaponType, numberOfWeapon) VALUES (1,'Т34',15);


INSERT INTO Drugs (storageId, drugType, numberOfDrugs) VALUES (2,'Аспирин',500);
INSERT INTO Drugs (storageId, drugType, numberOfDrugs) VALUES (3,'Ношпа',300);
INSERT INTO Drugs (storageId, drugType, numberOfDrugs) VALUES (1,'Корвалол',250);

INSERT INTO Path_Human (pathId, humanId) VALUES (1,1);
INSERT INTO Path_Human (pathId, humanId) VALUES (5,4);
INSERT INTO Path_Human (pathId, humanId) VALUES (2,2);
INSERT INTO Path_Human (pathId, humanId) VALUES (3,1);
INSERT INTO Path_Human (pathId, humanId) VALUES (4,2);
INSERT INTO Path_Human (pathId, humanId) VALUES (6,3);