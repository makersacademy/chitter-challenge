CREATE DATABASE chitter_database;

CREATE TABLE makers_user (
    student_id SERIAL PRIMARY KEY,
    student_email VARCHAR( 300 ),
    username VARCHAR( 50 ) UNIQUE,
    registration_date DATE NOT NULL,
    registration_time TIME( 0 ) NOT NULL
);

CREATE TABLE peeps (
    peep_id SERIAL PRIMARY KEY,
    peep_text VARCHAR( 280 ),
    date_posted DATE NOT NULL,
    time_posted TIME( 0 ) NOT NULL,
    student_id INTEGER,
    FOREIGN KEY (student_id) REFERENCES makers_user(student_id)
);

CREATE TABLE makers_passwords (
    id SERIAL PRIMARY KEY,
    password VARCHAR( 50 ),
    student_id INTEGER,
    FOREIGN KEY (student_id) REFERENCES makers_user(student_id)
);

CREATE DATABASE chitter_database_test;

CREATE TABLE makers_user (
    student_id SERIAL PRIMARY KEY,
    student_email VARCHAR( 300 ),
    username VARCHAR( 50 ) UNIQUE,
    registration_date DATE NOT NULL,
    registration_time TIME( 0 ) NOT NULL
);

CREATE TABLE peeps (
    peep_id SERIAL PRIMARY KEY,
    peep_text VARCHAR( 280 ),
    date_posted DATE NOT NULL,
    time_posted TIME( 0 ) NOT NULL,
    student_id INTEGER,
    FOREIGN KEY (student_id) REFERENCES makers_user(student_id)
);

CREATE TABLE makers_passwords (
    id SERIAL PRIMARY KEY,
    password VARCHAR( 50 ),
    student_id INTEGER,
    FOREIGN KEY (student_id) REFERENCES makers_user(student_id)
);