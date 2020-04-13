# Database Setup

1. Add pg gem

```
# in gemfile

  gem 'pg'


# in terminal

  bundle


# in 'lib/peep.rb'

  require 'pg'
```

2. Create 'chitter' Database
3. Connect to chitter database
4. Create a table 'peeps'

```
       >>  psql
       =#  CREATE DATABASE chitter;
       =#  \c chitter
chitter=# CREATE TABLE peeps(id SERIAL PRIMARY KEY, peep VARCHAR(500), peeper VARCHAR(30));

```

5. Setup database connection class with:
   1. Setup method - to connect to database
   2. Connection method - to make connection accessable
   3. query method - so the table can be queried

```
# in db_connection.rb
require 'pg'

  class DbConnection

    def self.setup(dbname)
      @connection = PG.connect(dbname: dbname)
    end

    def self.connection
      @connection
    end

    def self.query(sql)
      @connection.exec(sql)
    end
  end
```

