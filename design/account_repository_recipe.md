# Account Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

```
# EXAMPLE

Table: accounts

Columns:
id | email_address | username | name | password
```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql

-- (file: spec/accounts_seeds.sql)

TRUNCATE TABLE accounts RESTART IDENTITY; -- replace with your own table name.

INSERT INTO accounts ("email_address", "username", "name", "password") VALUES
('alice@example.com', 'alice1', 'Alice Wood', 'test123'),
('chris@example.com', 'chris1', 'Chris Wood', 'test321'),
('will@example.com', 'will1', 'will Davies', 'test987')
```

## 3. Define the class names

```ruby
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
# Table name: accounts

# Model class
# (in lib/account.rb)

class Account
  attr_accessor :id, :email_address, :username, :name, :password
end

```

## 5. Define the Repository Class interface

```ruby
# Table name: accounts

# Repository class
# (in lib/account_repository.rb)

class AccountRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, email_address, username, name, password FROM accounts;

    # Returns an array of account objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, email_address, username, name, password FROM accounts WHERE id = $1;

    # Returns a single account object.
  end

  def create(account)
   # Executes the SQL query:
  # INSERT INTO accounts(email_address, username, name, password) VALUES ($1, $2, $3, $4);

    # Returns nil, just creates account.
  end

  # def update(account)
  # not needed for MVP 
  # end

  # def delete(account)
  # not needed for MVP 
  # end
end
```

## 6. Write Test Examples

```ruby

# 1
# Get all accounts

repo = AccountRepository.new

accounts = repo.all

accounts.length # =>  3

accounts.first.id # =>  1
accounts.first.email_address # => 'alice@example.com'
accounts.first.username # => 'alice1'
accounts.first.name # =>  'Alice Wood'
accounts.first.password # =>  'test123'

# 2
# Get a single account

repo = AccountRepository.new

account = repo.find(2)

accounts.id # =>  1
accounts.email_address # => 'chris@example.com'
accounts.username # => 'chris1'
accounts.name # =>  'Chris Wood'
accounts.password # =>  'test321'

#  3 
# Create a new account

repo = AccountRepository.new

account = Account.new

account.email_address = 'leo@example.com'
account.username ='leo1'
account.name = 'Leo Hetsch'
account.password = 'test456'

repo.add(account)

accounts = repo.all

accounts.length # => 4
accounts.last.email_address # =>  'leo@example.com'
accounts.last.username # => 'leo1'
accounts.last.name # =>  'Leo Hetsch'
accounts.last.password # =>  'test456'

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
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
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
