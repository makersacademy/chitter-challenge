# Design for Chitter Challenge

## 1. User Stories

STRAIGHT UP

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

Key Nouns   
- peep (message)
- created time

Key Verbs:
- post
- see all (reverse chronological order)
- sign up


HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep


## 2. Initial Assumptions

- Users don't need to be logged in to see all peeps including name, username, created datetime

## 3. Future Enhancement Ideas

- Could allow user to login with email or username
- Instead of failing for incorrect credentials, prompts user to re-enter and sends back to login/register page
- Message on page to show incorrect credentials


## 4. Database and Table Definitions and Relationships

createdb chitter
createdb chitter_test

Table: peeps
id: SERIAL
created_date_time: timestamp
content: text

Table: users
id: SERIAL
name: text
email: text
username: text
password: text

'users' can have many 'peeps' but a peep can only belong to one user: users (1) -> peeps (M)

## 5. Write SQL for seed files

psql -h 127.0.0.1 chitter_test < spec/seeds/table_creation.sql
psql -h 127.0.0.1 chitter_test < spec/seeds/seeds_chitter.sql

## 6. Database Connection Class

```ruby

# file: lib/database_connection.rb

require 'pg'

# This class is a thin "wrapper" around the
# PG library. We'll use it in our project to interact
# with the database using SQL.

class DatabaseConnection
  # This method connects to PostgreSQL using the 
  # PG gem. We connect to 127.0.0.1, and select
  # the database name given in argument.
  def self.connect
    if ENV['DATABASE_URL'] != nil
      @connection = PG.connect(ENV['DATABASE_URL'])
      return
    end

    if ENV['ENV'] == 'test'
      database_name = 'chitter_test'
    else
      database_name = 'chitter'
    end
    @connection = PG.connect({ host: '127.0.0.1', dbname: database_name })
  end

  # This method executes an SQL query 
  # on the database, providing some optional parameters
  # (you will learn a bit later about when to provide these parameters).
  def self.exec_params(query, params)
    if @connection.nil?
      raise 'DatabaseConnection.exec_params: Cannot run a SQL query as the connection to'\
      'the database was never opened. Did you make sure to call first the method '\
      '`DatabaseConnection.connect` in your app.rb file (or in your tests spec_helper.rb)?'
    end
    @connection.exec_params(query, params)
  end
end
```

## 7. Edit spec_helper.rb

Add this to the top of the file

```ruby
require 'database_connection'

ENV['ENV'] = 'test'

DatabaseConnection.connect
```

## 8. Create Model Classes

```ruby
def user
attr_accessor :id ...
end
```

## 9. TDD Repository Classes

UserRepository
-> all
-> find
-> create
-> update
-> delete

