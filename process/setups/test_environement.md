# Test Environment Setup

1. Create 'chitter' Database
2. Connect to chitter database
3. Create a table 'peeps'

```
       >>  psql
       =#  CREATE DATABASE chitter_test;
       =#  \c chitter
chitter=# CREATE TABLE peeps(id SERIAL PRIMARY KEY, peep VARCHAR(500), peeper VARCHAR(30));

```

4. Setup test environment
   1. Add test environment to spec_helper
   2. Create setup_test_database spec file to setup database connection

```
# in 'spec/setup_test_database.rb'

  require 'pg'

  def setup_test_database
    p "Setting up test database..."

    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("TRUNCATE peeps;")
  end

```