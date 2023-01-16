# ACCOUNTS Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](./single_table_design_recipe_template.md).

*In this template, we'll use an example table `items`*

```
# EXAMPLE

Table: accounts

Columns:
id | email | username | password | name
```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- EXAMPLE
-- (file: spec/seeds_items.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE accounts RESTART IDENTITY CASCADE; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO accounts ("email", "username", "password", "name") VALUES
('johnsmith@makers.com', 'jsmith98', 'abc123!!', 'John Smith'),
('benking@makers.com', 'bking98', 'def456??', 'Ben King'),
('chrisbacon@makers.com', 'cbacon98', 'ghi789!!', 'Chris Bacon');

```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 chitter_network < seeds_accounts.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
# EXAMPLE
# Table name: accounts

# Model class
# (in lib/account.rb)
class Account
end

# Repository class
# (in lib/account_repository.rb)
class AccountRepository
end
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# EXAMPLE
# Table name: accounts

# Model class
# (in lib/account_repository.rb)

class Account

  # Replace the attributes by your own columns.
  attr_accessor :id, :email, :username, :password, :name
end

# The keyword attr_accessor is a special Ruby feature
# which allows us to set and get attributes on an object,
# here's an example:
#
# account = Account.new
# account.name = 'John Smith'
# account.name
```

*You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.*

## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
# EXAMPLE
# Table name: accounts

# Repository class
# (in lib/account_repository.rb)

class AccountRepository

    # Selecting all records
    # No arguments
    def all
        # Executes the SQL query:
        # SELECT id, email, username, password, name FROM accounts;

        # Returns an array of Account objects.
    end

    # Gets a single record by its ID
    # One argument: the id (number)
    def find(id)
        # Executes the SQL query:
        # SELECT id, email, username, password, name FROM accounts WHERE id = $1;

        # Returns a single Account object.
    end

    # Inserts new Item record into database
    def create(account)
        # Executes the SQL query
        # INSERT into accounts (email, username, password, name) VALUES ($1, $2, $3, $4);

        # Returns nothing
    end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES

# 1
# Get all accounts

repo = AccountRepository.new

accounts = repo.all

accounts.length # =>  3

accounts[0].id # =>  1
accounts[0].email # =>  'johnsmith@makers.com'
accounts[0].username # =>  'jsmith98'
accounts[0].password # => 'abc123!!'
accounts[0].name # => 'John Smith'

accounts[1].id # =>  2
accounts[1].email # =>  'benking@makers.com'
accounts[1].username # =>  'bking98'
accounts[1].password # => 'def456??'
accounts[1].name # => 'Ben King'

accounts[2].id # =>  3
accounts[2].email # =>  'chrisbacon@makers.com'
accounts[2].username # =>  'cbacon98'
accounts[2].password # => 'ghi789!!'
accounts[2].name # => 'Chris Bacon'

# 2
# Get a single account

repo = AccountRepository.new

account = repo.find(1)

account.id # =>  1
account.email # =>  'johnsmith@makers.com'
account.username # =>  'jsmith98'
account.password # => 'abc123!!'
account.name # => 'John Smith'

# 3
# Creates a new account

repo = AccountRepository.new


account = Account.new
account.email = 'lukeshaw@makers.com'
account.username =  'lshaw98'
account.password = 'jkl123??'
account.name = 'Luke Shaw'

accounts = repo.all
accounts[3].name = 'Luke Shaw'

```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/account_repository_spec.rb

def reset_accounts_table
  seed_sql = File.read('spec/seeds_accounts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_network_test' })
  connection.exec(seed_sql)
end

describe AccountRepository do
  before(:each) do 
    reset_accounts_table
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
