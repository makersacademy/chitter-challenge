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
