DROP DATABASE IF EXISTS chitter_n_peep;
DROP DATABASE IF EXISTS chitter_n_peep_test;
CREATE DATABASE chitter_n_peep;
CREATE DATABASE chitter_n_peep_test;
GRANT CONNECT ON DATABASE chitter_n_peep TO adminollie;
GRANT CONNECT ON DATABASE chitter_n_peep_test TO adminollie;
GRANT ALL PRIVILEGES ON DATABASE chitter_n_peep TO adminollie;
GRANT ALL PRIVILEGES ON DATABASE chitter_n_peep_test TO adminollie;
-- GRANT ALL PRIVILEGES ON DATABASE chitter_n_peep;
-- GRANT ALL PRIVILEGES ON DATABASE chitter_n_peep_test;
