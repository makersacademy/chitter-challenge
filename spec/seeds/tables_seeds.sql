DROP TABLE IF EXISTS makers,conversations,peeps,tags;


CREATE TABLE makers(
  id SERIAL PRIMARY KEY,
  email TEXT UNIQUE,
  password TEXT,
  name TEXT,
  username TEXT UNIQUE
);

CREATE TABLE conversations(
  id SERIAL PRIMARY KEY,
  maker_id INT,
  CONSTRAINT fk_maker FOREIGN KEY(maker_id)
    REFERENCES makers(id)
    ON DELETE CASCADE
);


CREATE TABLE peeps(
  id SERIAL PRIMARY KEY,
  content TEXT,
  created_datetime TIMESTAMPTZ DEFAULT Now(),
  maker_id INT,
  conversation_id INT,
  CONSTRAINT fk_conversation FOREIGN KEY(conversation_id)
    REFERENCES conversations(id)
    ON DELETE CASCADE,
  constraint fk_maker foreign key(maker_id) references makers(id) on delete cascade
);


CREATE TABLE tags(
  maker_id int,
  peep_id int,
  constraint fk_maker foreign key(maker_id) references makers(id) on delete cascade,
  constraint fk_peep foreign key(peep_id) references peeps(id) on delete cascade,
  PRIMARY KEY (maker_id, peep_id)
);


-- data will go here

INSERT INTO makers (email, password, name, username) VALUES
('ad@host.com', '$2a$12$j5243dePvne3jYH4yn4XYuhxXWrTjEIZUW2Hy7MxfjH4PGf7pSche', 'Adam', 'Ad'),
('bob@host.com', '$2a$12$GRvuFEFQrfV4EZjLkyau8OXK4VJZ1DsihK9ErwKHJthsr/KhLix7y', 'Bob', 'Big'),
('cat@host.com', '$2a$12$e2uT1PeQyDWyw5hzztQQ7eAE7xpRj3cnGtuOrpkpKnhhiaQCaelDe', 'Claire', 'Cat'),
('dd@host.com', '$2a$12$.SGLrrSM9JxVAqtPFpbON.ydF63g5X4sCqt1lXApofWb4I3bZdvhG', 'Donna', 'Donut'),
('ee@host.com', '$2a$12$.EpnkWO8gg9hnh.OY6SOEe3hztzYj7ILEKEo4eiDQ9LOJ12WRwu8e', 'Evan', 'Easy');

INSERT INTO conversations (maker_id) VALUES
('1'),
('1'),
('2'),
('4');

INSERT INTO peeps (content, conversation_id, maker_id) VALUES
('First Peep','1','1'),
('Second Peep','2','1'),
('First reply','2','2'),
('Clean for tags','3','4'),
('multi tag','4','4'),
('reply with tag','4','4');

INSERT INTO tags (maker_id, peep_id) VALUES
('1','4'),
('1','5'),
('2','6');