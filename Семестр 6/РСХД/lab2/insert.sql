INSERT INTO users (name, email) VALUES ('Иван', 'ivan@example.com');
INSERT INTO users (name, email) VALUES ('Мария', 'maria@example.com');

INSERT INTO products (name, price) VALUES ('Ноутбук', 1000.00);
INSERT INTO products (name, price) VALUES ('Смартфон', 500.00);

INSERT INTO orders (user_id, total_amount) VALUES (1, 1500.00);
INSERT INTO orders (user_id, total_amount) VALUES (2, 800.00);

INSERT INTO order_items (order_id, product_id, quantity) VALUES (1, 1, 2);
INSERT INTO order_items (order_id, product_id, quantity) VALUES (2, 2, 1);

INSERT INTO addresses (user_id, street, city, zip_code) VALUES (1, 'Улица Пушкина, 10', 'Москва', '123456');
INSERT INTO addresses (user_id, street, city, zip_code) VALUES (2, 'Улица Лермонтова, 20', 'Санкт-Петербург', '654321');