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
('Emma_Johnson', 'SparkleLioness1234@gmail.com', 'ZnG3q'),
('Ethan_Hernandez', 'NeonUnicorn12@yahoo.com', 'Lk8$2'),
('Daniel_Anderson', 'ElectricPenguin77@outlook.com', 'Vt9@p'),
('Steve Williams','techsavvy87@gmail.com','qwezr'),
('Ben J Smith','musiclover23@yahoo.com','plmko'),
('Melissa Thompson','fitnessjunkie99@outlook.com','yhnji'),
('Anthony N Harris','travelenthusiast13@live.com','gfdsa'),
('Laura Davis','fashionista82@icloud.com','vbhnm'),
('Sarah Johnson','gamerfanatic45@protonmail.com','xdrfv'),
('Jenn Martinez','brainsnack@hotmail.com','lkjhg');

INSERT INTO peeps (content, time_of_posting, user_id) VALUES
('Just finished a great workout! #sweatyselfie', NOW(), 1),
('Its been 10 years since #TheEvent - so much has changed since then!', NOW() - INTERVAL '10 seconds', 9),
('got an amazing new haircut and Im feelin sooo good!', NOW() - INTERVAL '45 seconds', 2),
('Sometimes you just need a good hug! #zombielife', NOW() - INTERVAL '50 seconds', 10),
('Just finished a challenging puzzle. Feels good to have completed it.', NOW() - INTERVAL '1 minutes 10 seconds', 4),
('just found out my parents have been lying about being dead for 22 years. i still love you mom and dad.', NOW() - INTERVAL '3 minutes', 6),
('We are here to build products, not portfolios', NOW() - INTERVAL '7 minutes', 5),
('Why is it still night time?', NOW() - INTERVAL '10 minutes', 2),
('Has anyone else noticed the strange creatures lurking around here?', NOW() - INTERVAL '15 minutes', 3),
('I love rx. Hes basically the kawaii version of me.', NOW() - INTERVAL '18 minutes', 4),
('Had a great time catching up with an old friend, yum! #zombielife', NOW() - INTERVAL '19 minutes', 10),
('Just had a delicious lunch. Yum!', NOW() - INTERVAL '27 minutes', 10),
('Hey guys I am so excited to be here! Cant wait to start my new job!', NOW() - INTERVAL '50 minutes', 5),
('Just heard a loud noise - Im not sure what it was but Im getting out of here!', NOW() - INTERVAL '100 minutes', 8),
('Going out for a coffee with some friends later. Cant wait!', NOW() - INTERVAL '2 hours', 10),
('Just took a walk in the park. So peaceful.', NOW() - INTERVAL '6 hours', 1),
('got a new puppy! Shes soooo cute! #puppylove', NOW() - INTERVAL '5 days', 8),
('Order corn', NOW() - INTERVAL '300 days', 7),
('Wow - this new tech is going to revolutionize the way we work and play', NOW() - INTERVAL '1 year', 6),
('We will never forget the impact of #TheEvent and the changes it brought to the world! Who else is ready for summer?! #summervibes', NOW() - INTERVAL '1 year', 7);