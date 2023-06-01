TRUNCATE TABLE makers, peeps RESTART IDENTITY; -- replace with your own table name.

INSERT INTO makers (name, email, password) VALUES ('Sean', 'sean@makers.tech', '$2y$10$uqkMrjDvWYNeLR/zXgdnQOJsAqNEn8xa789LeBKafA0H4uIxou5gC');
INSERT INTO makers (name, email, password) VALUES ('Joe', 'joe@makers.tech', '$2y$10$izoz6TGIHKc3xjju0cXjn.N4QJEQvcdMs5s1ZAYZpzy/rrhPeaHLq');
INSERT INTO makers (name, email, password) VALUES ('Yevhen', 'eugene@makers.tech', '$2y$10$xkywp3MGsLUkWi3eN5KEEuW2VcMZ/Rhdj5m70Yg3qLwwIwO0qZP8m');

INSERT INTO peeps (content, time, maker_id) VALUES ('Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '2023-03-08 04:05:06', 1);
INSERT INTO peeps (content, time, maker_id) VALUES ('Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '2023-05-06 10:11:12', 2);
