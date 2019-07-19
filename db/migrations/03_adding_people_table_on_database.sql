
CREATE TABLE people(id SERIAL PRIMARY KEY, name VARCHAR(60));


add person_id to messages
create people table with name and id
person_id is a foreign key

ALTER TABLE messages ADD CONSTRAINT "kf_person_id_on_messages" FOREIGN KEY (person_id) REFERENCES people (id);

on_id - to add foreign key
