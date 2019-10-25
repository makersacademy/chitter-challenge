CREATE TABLE peeps_tags(tag_id INTEGER REFERENCES tags (id), peep_id INTEGER REFERENCES peeps (id));
