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
('ad@host.com','password1','Adam','Ad'),
('bob@host.com','password2','Bob','Big'),
('cat@host.com','password3','Claire','Cat'),
('dd@host.com','password4','Donna','Donut'),
('ee@host.com','password5','Evan','Easy');

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