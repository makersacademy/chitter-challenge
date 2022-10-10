DROP TABLE IF EXISTS peeps;

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  message text,
  time_stamp timestamp,
  
-- The foreign key name is always {other_table_singular}_id
    user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

Truncate Table peeps RESTART IDENTITY;


INSERT INTO peeps ("message", "time_stamp", "user_id") VALUES
('message1', '2022-06-08 12:00:00', 1),
('message2', '2022-09-07 13:00:00', 1),
('message3', '2022-08-06 15:00:00', 2),
('message4', '2022-10-08 13:48:00', 3),
('message5', '2022-10-08 12:00:00', 4);