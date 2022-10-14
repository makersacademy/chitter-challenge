DROP TABLE IF EXISTS peeps; 

-- Table Definition
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  message text,
  time_stamp time,
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps ("message", "time_stamp", "user_id") VALUES
('Message_1', '10:10:10', 1),
('Message_2', '11:11:11', 1),
('Message_3', '12:12:12', 2),
('Message_4', '9:9:9', 3),
('Message_5', '8:8:8', 4);




