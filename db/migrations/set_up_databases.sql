DROP DATABASE IF EXISTS hivemind_chitter;
DROP DATABASE IF EXISTS hivemind_chitter_test;
DROP ROLE IF EXISTS hivemind_chitter;
CREATE USER hivemind_chitter WITH ENCRYPTED PASSWORD 'password';
CREATE DATABASE hivemind_chitter;
CREATE DATABASE hivemind_chitter_test;
GRANT ALL PRIVILEGES ON DATABASE hivemind_chitter TO hivemind_chitter;
GRANT ALL PRIVILEGES ON DATABASE hivemind_chitter_test TO hivemind_chitter;
