POSTGRES

development enviroment
CREATE DATABASE chitter ENCODING 'UTF8'

test enviroment
CREATE DATABASE chitter_test ENCODING 'UTF8'

development/test enviroment table creation
./lib/db/create_tables.rb
