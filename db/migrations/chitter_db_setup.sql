CREATE TABLE peeps (
id SERIAL PRIMARY KEY, 
context VARCHAR(150),
date_created DATE DEFAULT CURRENT_TIMESTAMP,
time_added TIME(0) DEFAULT CURRENT_TIMESTAMP
)