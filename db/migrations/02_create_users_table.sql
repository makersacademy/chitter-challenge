CREATE TABLE users (username VARCHAR(20) NOT NULL CHECK(username <> ''), email VARCHAR(20) NOT NULL CHECK(email <> ''), password VARCHAR(20) NOT NULL CHECK(LENGTH(password) >4));
