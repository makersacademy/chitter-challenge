 CREATE TABLE peeps(peep VARCHAR(200) NOT NULL CHECK(peep <> ''), time TIMESTAMP, username VARCHAR(20) NOT NULL CHECK(username <> ''));
