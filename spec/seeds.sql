TRUNCATE TABLE makers, peeps RESTART IDENTITY; -- replace with your own table name.

INSERT INTO makers (name, email, password) VALUES ('Sean', 'lobe_carpels_06@icloud.com', '$2y$10$WKkmvBWESRzEfsBcPKZjbOFK5cFr0nuVhU25ijAmkSvRnKq3rZHfG');
INSERT INTO makers (name, email, password) VALUES ('Joe', 'dib_stump.0j@icloud.com', '$2y$10$izoz6TGIHKc3xjju0cXjn.N4QJEQvcdMs5s1ZAYZpzy/rrhPeaHLq');
INSERT INTO makers (name, email, password) VALUES ('Eugene', 'bawls-hasty-01@icloud.com', '$2y$10$xkywp3MGsLUkWi3eN5KEEuW2VcMZ/Rhdj5m70Yg3qLwwIwO0qZP8m');

INSERT INTO peeps (content, time, maker_id) VALUES ('Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '2023-03-08 04:05:06', 1);
INSERT INTO peeps (content, time, maker_id) VALUES ('Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '2023-05-06 10:11:12', 2);
INSERT INTO peeps (content, time, maker_id) VALUES ('Sed do eiusmod tempor incididunt.', '2023-05-07 11:12:13', 1);
INSERT INTO peeps (content, time, maker_id) VALUES ('Labore et dolore magna aliqua.', '2023-05-08 12:13:14', 1);
INSERT INTO peeps (content, time, maker_id) VALUES ('At in tellus integer feugiat scelerisque.', '2023-05-09 13:14:15', 3);
