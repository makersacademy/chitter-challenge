# {{TABLE NAME}} Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](.-single_table_design_recipe_template.md).

_In this template, we'll use an example table `students`_

```
# EXAMPLE
| Record                | Properties                    |
| --------------------- | ------------------------------|
|  peeps                | content, time, name, username, user_id |
|  users                | email, pw, name, username     |
```

## 2. Create Test SQL seeds

Your tests will depend on data stored in usergreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- EXAMPLE
-- (file: spec-seeds_{table_name}.sql)
-- Write your SQL seed here.
-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)
TRUNCATE TABLE peeps RESTART IDENTITY CASCADE; -- replace with your own table name.
-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.
INSERT INTO peeps (content, time, name, username, user_id) VALUES ('Ed BallS', '07:00 AM', 'Shah', 'shussain', '1');
INSERT INTO peeps (content, time, name, username, user_id) VALUES ('im innocent come find me', '10:00 AM', 'SBF', 'SBFFTX', '2');
INSERT INTO peeps (content, time, name, username, user_id) VALUES ('IM IN ME MUMS CAR BROOM BROOM', '12:00 PM', 'mobreezy', 'mojd', '3');
INSERT INTO peeps (content, time, name, username, user_id) VALUES ('me tariq from rochdale bit barass with my family', '10:00 PM', 'Tariq', 'tariqroch', '4');
INSERT INTO peeps (content, time, name, username, user_id) VALUES ('FIRE GREG ROMAN!!', '6:46 PM', 'Lamar', 'LJEra', '5');


-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE users RESTART IDENTITY CASCADE; -- replace with your own table name.
-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (email, password, name, username) VALUES ('shah@test.com', 'dogwater', 'Shah', 'shussain' );
INSERT INTO users (email, password, name, username) VALUES ('SBF@test.com', 'bahamas', 'SBF', 'SBFFTX');
INSERT INTO users (email, password, name, username) VALUES ('mo@test.com', 'wraith', 'mobreezy', 'mojd');
INSERT INTO users (email, password, name, username) VALUES ('tariq@test.com', 'rochdale', 'Tariq', 'tariqroch');
INSERT INTO users (email, password, name, username) VALUES ('lamar@test.com', 'louisville', 'Lamar', 'LJEra');

```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 chitter_test < spec/seeds_peeps.sql
psql -h 127.0.0.1 chitter_test < spec/seeds_users.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
# EXAMPLE
# Table name: peeps
# Model class
# (in lib-peep.rb)
class Peep
end
# Repository class
# (in lib-peep_repository.rb)
class PeepRepository
end


# (in lib-user.rb)
class User
end
# Repository class
# (in lib-user_repository.rb)
class UserRepository
end


```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# EXAMPLE
# Table name: students
# Model class
# (in lib-peep.rb)
class Peep
  # Replace the attributes by your own columns.
  attr_accessor :id, :content, :time, :name, :username, :user_id
end


# (in lib-user.rb)
class User
  # Replace the attributes by your own columns.
  attr_accessor :id, :email, :password, :name, :username  
end

```

_You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed._

## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
# EXAMPLE
# Table name: peeps
# Repository class
# (in lib-peep_repository.rb)
class PeepRepository
 
  def all
    sql = 'SELECT id, content, time, name, username, user_id, FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])
    peeps = []

    result_set.each do |record|
      peep = Peep.new
      peep.id = record['id']
      peep.content = record['content']
      peep.time = record['time']
      peep.name = record['name']
      peep.username = record['username']
      peep.user_id = record['user_id']
      peeps << peep
    end
    peeps
  end

  def find(id)
    sql = 'SELECT id, content, time, name, username, user_id FROM peeps WHERE id = $1;'
    params = [id]
    result_set = DatabaseConnection.exec_params(sql, params)

    record = result_set[0]
    peep = Peep.new
    peep.id = record['id']
    peep.content = record['content']
    peep.time = record['time']
    peep.name = record['name']
    peep.username = record['username']
    peep.user_id = record['user_id']
    
    peep
  end

  def create(peep)
    sql = 'INSERT INTO peeps (content, time, name, username, user_id) VALUES ($1, $2, $3, $4, $5);'
    params = [peep.content, peep.time, peep.name, peep.username, peep.user_id]
    DatabaseConnection.exec_params(sql, params)
  end

```

```ruby
# EXAMPLE
# Table name: users
# Repository class
# (in lib-user_repository.rb)
class UsersRepository
  
  def all
    sql = 'SELECT id, email, password, name, username FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])
    users = []
    
    result_set.each do |record|
      user = User.new
      user.id = record['id']
      user.email = record['email']
      user.password = record['password']
      user.name = record['name']
      user.username = record['username']
      users << user
    end
    users
  end

  def find(id)
    sql = 'SELECT id, email, password, name, username FROM users WHERE id = $1;'
    params = [id]
    result_set = DatabaseConnection.exec_params(sql, params)
    record = result_set[0]
    user = User.new
    user.id = record['id']
    user.email = record['email']
    user.password = record['password']
    user.name = record['name']
    user.username = record['username']
  end

  def create(user)
    sql = 'INSERT INTO users (email, password, name, username) VALUES ($1, $2, $3);'
    params = [user.email, user.password, user.name, user.username]
    DatabaseConnection.exec_params(sql, params)
  end

end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES
# 1
# Get all peeps
repo = PeepRepository.new
peeps = repo.all
expect(peeps.length).to eq 5
expect(peeps[0].id).to eq '1'
expect(peeps[0].content).to eq 'Ed Balls'
expect(peeps[0].time).to eq '07:00 AM'
expect(peeps[0].name).to eq 'Shah'
expect(peeps[0].username).to eq 'shussain'
expect(peeps[1].id).to eq '2'
expect(peeps[1].content).to eq 'im innocent come find me'
expect(peeps[1].time).to eq '10:00 AM'
expect(peeps[1].name).to eq 'SBF'
expect(peeps[1].username).to eq 'SBFFTX'


# 2
# Get a single peep
repo = PeepRepository.new
peeps = repo.find(1)
expect(peeps.id).to eq '1'
expect(peeps.content).to eq 'Ed Balls'
expect(peeps.time).to eq '07:00 AM'
expect(peeps.name).to eq 'Shah'
expect(peepS.username).to eq 'shussain'

# 3
# create a peep
repo = PeepRepository.new
new_peep = Peep.new
new_peep.content = 'I AM BACK I AM DONALD TRUMP'
new_peep.time = '3:00 PM'
new_peep.name = 'Donald'
new_peep.username = 'DTrump'
new_peep.user_id = '6'


repo.create(new_peep)
peeps = repo.all
last_peep = peeps.last

expect(last_peep.name).to eq 'Donald'
expect(last_peep.time).to eq '03:00:00'
expect(last_peep.username).to eq 'DTrump'


# 6
# Get all users
repo = UserRepository.new
users = repo.all
expect(users.length).to eq 5
expect(users[0].id).to eq '1'
expect(users[0].name).to eq 'Shah'
expect(users[0].username).to eq 'shussain'


# 7 
# finds a user
repo = usersRepository.new
users = repo.find(2)
expect(users.name).to eq 'mobreezy'
expect(users.username).to eq 'mojd'


# 8
# creates a user
repo = UsersRepository.new
new_user = User.new
new_user.email = 'saf@test.com'
new_user.password = 'toodles'
new_user.name = 'Soph'
new_user.username = 'mickeymouse'

repo.create(new_user)
users = repo.all
last_user = users.last

new_user.name = 'Soph'
new_user.username = 'mickeymouse'


```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh tabls ever you run the test suite.

```ruby
# EXAMPLE
# file: spec-peep_repository_spec.rb
def reset_peeps_table
  seed_sql = File.read('spec-seeds_peeps.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

  before(:each) do
    reset_peeps_table
  end
  # (your tests will go here).
end

# file: spec-user_repository_spec.rb
def reset_users_table
  seed_sql = File.read('spec/seeds_users.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

  before(:each) do
    reset_users_table
  end
  # (your tests will go here).


```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._