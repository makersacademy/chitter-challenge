-- Main database/table
CREATE TABLE chitters(id SERIAL PRIMARY KEY, "user" VARCHAR(20), "peep" VARCHAR(100), "time" VARCHAR);
SELECT * FROM chitters 

-- Test database/table 
CREATE TABLE chitters_test(id SERIAL PRIMARY KEY, "user" VARCHAR(20), "peep" VARCHAR(100), "time" VARCHAR);
SELECT * FROM chitters 