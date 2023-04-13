DROP TABLE IF EXISTS peeps;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  email_address text,
  password text
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  time_of_posting timestamp,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

INSERT INTO users (name, email_address, password) VALUES
('EmmaJohnson', 'SparkleLioness1234@gmail.com', 'ZnG3q'),
('EthanHernandez', 'NeonUnicorn12@yahoo.com', 'Lk8$2'),
('DanielAnderson', 'ElectricPenguin77@outlook.com', 'Vt9@p');

INSERT INTO peeps (content, time_of_posting, user_id) VALUES
('Just finished a great workout! #sweatyselfie', NOW(), 1),
('Why is it still night time?', NOW() - INTERVAL '10 minutes', 2),
('Has anyone else noticed the strange creatures lurking around here?', NOW() - INTERVAL '15 minutes', 3);
