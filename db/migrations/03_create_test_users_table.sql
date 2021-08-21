# in migrations/03_create_test_users_table.sql
CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(50), password VARCHAR(20), name VARCHAR(30), username VARCHAR(20));