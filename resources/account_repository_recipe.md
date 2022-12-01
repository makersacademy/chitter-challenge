# Account Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](./single_table_design_recipe_template.md).

*In this template, we'll use an example table `students`*

```
# EXAMPLE

Table: accounts

Columns:
id | email | password | name | username
```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- (file: spec/seeds_accounts.sql)

TRUNCATE TABLE accounts RESTART IDENTITY CASCADE;
TRUNCATE TABLE peeps RESTART IDENTITY;

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO accounts (email, password, name, username) VALUES
('thomas@email.com', 'password', 'Thomas Seleiro', 'TSeleiro'),
('graeme@email.com', 'P@$$w0rd', 'Graeme Paterson', 'GPaterson'),
('robbie@email.com', '1234hello1234', 'Robbie Kirkbride', 'RKirkbride');

INSERT INTO peeps(contents, time_posted, account_id) VALUES
('My first peep', '2022-12-01 16:00:00', 1),
('My second peep', '2022-12-01 16:00:30', 1),
('Hello', '2022-12-02 09:30:14', 2),
('Test', '2022-12-02 16:00:30', 3),
('My third peep', '2022-12-03 07:13:49', 1);
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 chitter_db_test < seeds_accounts.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

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
  attr_accessor :id, :email, :password, :name, :username
end
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
    # SELECT id, email, password, name, username FROM accounts;

    # Returns an array of Account objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, email, password, name, username FROM accounts WHERE id = $1;

    # Returns a single Account object.
  end

  def create(account)
    # Executes the SQL query:
    # INSERT INTO accounts (email, password, name, username) VALUES ($1, $2, $3, $4);

    # Returns nothing
  end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# 1
# Get all accounts
account_repo = AccountRepository.new
accounts = account_repo.all

accounts.length # => 3

accounts.first.id # => 1
accounts.first.email # => "thomas@email.com"
accounts.first.password # => "password"
accounts.first.name # => "Thomas Seleiro"
accounts.first.username # => "TSeleiro"

accounts.last.id # => 3
accounts.last.email # => "robbie@email.com"
accounts.last.password # => "1234hello1234"
accounts.last.name # => "Robbie Kirkbride"
accounts.last.username # => "RKirkbride"

# 2
# Finds an account with a given account id
account_repo = AccountRepository.new
account = account_repo.find(2)

account.id # => 2
account.email # => "graeme@email.com"
account.password # => "P@$$w0rd"
account.name # => "Graeme Paterson"
account.username # => "GPaterson"

# 3
# #find fails when given an invalid account id
account_repo = AccountRepository.new
account = account_repo.find(4) # => raises error "There is no account with ID 4"

# 4
# #create adds an account to the database
account_repo = AccountRepository.new
new_account = Account.new
new_account.email = "shah@email.com"
new_account.password = "12344321"
new_account.name = "Shah Hussain"
new_account.username = "SHussain"

account_repo.create(new_account)

account_repo.all # => include(have_attributes(id: 4, email:, password:, name:, username:)

# 5
# #create fails when adding an account with an existing username
account_repo = AccountRepository.new
new_account = Account.new
new_account.email = "thomas@email.com"
new_account.password = "12344321"
new_account.name = "Shah Hussain"
new_account.username = "SHussain"

account_repo.create(new_account) # => raises error PG::UniqueViolation

# 6
# #create fails when adding an account with an existing password
account_repo = AccountRepository.new
new_account = Account.new
new_account.email = "shah@email.com"
new_account.password = "12344321"
new_account.name = "Shah Hussain"
new_account.username = "TSeleiro"

account_repo.create(new_account) # => raises error PG::UniqueViolation

# 7
# #create fails when any field is empty
account_repo = AccountRepository.new
new_account = Account.new

new_account.email = ""
new_account.password = "12344321"
new_account.name = "Shah Hussain"
new_account.username = "SHussain"
account_repo.create(new_account) # => raises error "An account cannot have an empty argument"

new_account.email = "shah@email.com"
new_account.password = ""
account_repo.create(new_account) # => raises error "An account cannot have an empty argument"

new_account.password = "12344321"
new_account.name = ""
account_repo.create(new_account) # => raises error "An account cannot have an empty argument"

new_account.name = "Shah Hussain"
new_account.username = ""
account_repo.create(new_account) # => raises error "An account cannot have an empty argument"

# 8
# #create fails when entering a poorly formatted email address
account_repo = AccountRepository.new

new_account = Account.new
new_account.password = "12344321"
new_account.name = "Shah Hussain"
new_account.username = "SHussain"

new_account.email = "abc-@email.com"
account_repo.create(new_account) # => raises error "Please enter a valid email address"
new_account.email = "abc#def@email.com"
account_repo.create(new_account) # => raises error "Please enter a valid email address"
new_account.email = "shah@emailcom"
account_repo.create(new_account) # => raises error "Please enter a valid email address"
new_account.email = "shah@email.net"
account_repo.create(new_account) # => raises error "Please enter a valid email address"
new_account.email = "abc-@.com"
account_repo.create(new_account) # => raises error "Please enter a valid email address"
new_account.email = "abc-@em ail.com"
account_repo.create(new_account) # => raises error "Please enter a valid email address"
```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# file: spec/account_repository_spec.rb

def reset_accounts_table
  seed_sql = File.read('spec/seeds/seeds_accounts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_db_test' })
  connection.exec(seed_sql)
end

describe AccountRepository do
  before(:each) do 
    reset_accounts_table
  end
end
```
