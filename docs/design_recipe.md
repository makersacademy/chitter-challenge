{{TABLE NAME}} Model and Repository Classes Design Recipe

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

Nouns:

peep_content, peep_post_date user_name, user_email

1. Design and create the Table

DB name: chitterdb_test

Table: peeps
Table: users

Columns:
id | peep_content | peep_post_date | user_id
id | first_name | last_name | user_name | user_email

2. Create Test SQL seeds

-- (file: spec/seeds_peeps_test.sql)

TRUNCATE TABLE peeps, users RESTART IDENTITY;

INSERT INTO peeps (peep_content, peep_post_date, user_id) VALUES ('First peep', '2023-03-12', 1);
INSERT INTO peeps (peep_content, peep_post_date, user_id) VALUES ('Second peep', '2023-03-13', 2);
INSERT INTO peeps (peep_content, peep_post_date, user_id) VALUES ('Third peep', '2023-03-14', 1);
INSERT INTO peeps (peep_content, peep_post_date, user_id) VALUES ('Fourth peep', '2023-03-12', 3);

INSERT INTO users (first_name, last_name, user_name, user_email) VALUES ('User, '1', 'User1', 'user1@peep.com');
INSERT INTO users (first_name, last_name, user_name, user_email) VALUES ('User, '2', 'User 2', 'user2@peep.com');
INSERT INTO users (first_name, last_name, user_name, user_email) VALUES ('User, '3', 'User 3', 'user3@peep.com');

Run once to create the tables (for each DB):
    CREATE TABLE users (
        id SERIAL PRIMARY KEY,
        first_name TEXT,
        last_name TEXT,
        user_name TEXT,
        user_email TEXT
    );
    
    CREATE TABLE peeps (
        id SERIAL,
        peep_content TEXT,
        peep_post_date TIMESTAMP,
        user_id INT,
        constraint fk_user foreign key(user_id) references users(id) on delete cascade
    );

Then load the test seeds into the test database
    psql -h 127.0.0.1  chitterdb_test < seeds_peeps_test.sql

3. Define the class names

# Table name: peeps

# Model class
# (in lib/peep_model.rb)
class Peep
end

# Repository class
# (in lib/peep_repository.rb)
class PeepRepository
end

# Table name: users

# Model class
# (in lib/user_model.rb)
class User
end

# Repository class
# (in lib/user_repository.rb)
class UserRepository
end

4. Implement the Model class

# Table name: peeps

# Model class
# (in lib/peep_model.rb)

class Peep
  attr_accessor :id, :peep_content, :peep_post_date
end

# Table name: users

# Model class
# (in lib/user_model.rb)

class User
  attr_accessor :id, :user_name, :user_email
end

5. Define the Repository Class interface

# Table name: peeps

# Repository class
# (in lib/peep_repository.rb)

class PeepRepository
  def all
    SELECT id, peep_content, peep_post_date, user_id FROM peeps;
    # Returns an array of peeps.
  end

  def find(id)
    SELECT id, peep_content, peep_post_date, user_id FROM peeps WHERE id = $1;
    # Returns a single peep object.
  end

  def create(peep)
    INSERT INTO peeps (peep_content, peep_post_date, user_id) VALUES ($1, $2, $3);
    # Creates a peep.
  end

  def update(peep)
    UPDATE peeps SET peep_content = $1;
    # Updates a peep.
  end

  def delete_peep(id)
    DELETE FROM peeps WHERE id = $1;
    # Deletes a peep.
  end

  def delete_all_peeps(user_id)
    DELETE FROM peeps WHERE user_id = $1;
    # Deletes all peeps that belong to a user.
  end
end

# Table name: users

# Repository class
# (in lib/user_repository.rb)

class UserRepository
  def all
    SELECT id, user_name, user_email FROM users;
    # Returns an array of users.
  end

  def find(id)
    SELECT id, user_name, user_email FROM users WHERE id = $1;
    # Returns a single user object.
  end

  def create(user)
    INSERT INTO users (user_name, user_email) VALUES ($1, $2);
    # Creates a user.
  end

  def update(user)
    UPDATE users SET user_name = $1, user_email = $2;
    # Updates a user.
  end

  def delete_user(id)
    DELETE FROM users WHERE id = $1;
    # Deletes a user.
  end
end

6. Write Test Examples

UNIT TESTS
-- PEEPS
# 1 Returns all peeps that belong to a user.

repo = PeepRepository.new

peeps = repo.all
peeps.length # =>  4

peeps[0].id # =>  1
peeps[0].peep_content # =>  'First peep'
peeps[0].peep_post_date # =>  '2023-03-12'

peeps[1].id # =>  2
peeps[1].peep_content # =>  'Second peep'
peeps[1].peep_post_date # =>  '2023-03-13'

# 2 Finds a single peep.

repo = PeepRepository.new
peep = repo.find(1)

peep.id # =>  1
peep.peep_content # =>  'Second peep'
peep.peep_post_date # =>  '2023-03-13'

# 3 Creates a peep.

repo = PeepRepository.new
peeps = repo.all
peep = Peep.new

peep.peep_content = 'Hello all you peepers, not peppers!'
peep.peep_post_date = '2023-03-14' (or try to use NOW, the user won't have to add it!)
peeps.create(peep)

new_peep = repo.find(5)
peep.id # =>  5
peep.peep_content # =>  'Hello all you peepers, not peppers!'
peep.peep_post_date # =>  '2023-03-14'
peeps.length # => 5

# 4 Updates a peep

repo = PeepRepository.new
peep = repo.find(1)
peep.peep_content = 'Hello all you peepers! (edited)'
peep.update(peep)
peep.peep_content # => 'Hello all you peepers! (edited)'

# 5 Deletes a peep

repo = PeepRepository.new
peeps = repo.all

new_peep1 = Peep.new
new_peep1.peep_content = 'Fifth peep'
new_peep1.peep_post_date = '2023-03-14'
repo.create(new_peep1)

new_peep2 = Peep.new
new_peep2.peep_content = 'Sixth peep'
new_peep2.peep_post_date = '2023-03-15'
repo.create(new_peep2)

repo.delete(5)
peeps = repo.all
peeps.length # => 5
peeps.last.peep_content # => 'Sixth peep'

-- USERS
# 6 Returns all users.

repo = UserRepository.new

users = repo.all
users.length # =>  3

users[0].id # =>  1
users[0].user_name # =>  'User 1'
users[0].user_email # =>  'user1@peep.com'

users[1].id # =>  2
users[1].user_name # =>  'User 2'
users[1].user_email # =>  'user2@peep.com'

# 7 Finds a single user.

repo = UserRepository.new
user = repo.find(1)

user.id # =>  1
user.user_name # =>  'User 1'
user.user_email # =>  'user1@peep.com'

# 8 Creates a user.

repo = UserRepository.new
users = repo.all
user = User.new

user.user_name = 'User 4'
user.user_email = 'user4@peep.com'
users.create(user)

new_user = repo.find(4)
user.id # =>  4
user.user_name # =>  'User 4'
user.user_email # =>  'user4@peep.com'
users.length # => 4

# 9 Updates a user

repo = UserRepository.new
user = repo.find(1)
user.last_name = 'One'
user.update(user)
user.last_name # => 'One'

# 10 Deletes a user

repo = UserRepository.new
users = repo.all

new_user1 = User.new
new_user1.first_name = 'Alice'
new_user1.last_name = 'Wilson'
new_user1.username = 'alicewilson'
new_user1.email = 'alice.wilson@peep.com'
repo.create(new_user1)

new_user2 = User.new
new_user2.first_name = 'Amanda'
new_user2.last_name = 'Benson'
new_user2.username = 'amandabenson'
new_user2.email = 'amanda.benson@peep.com'
repo.create(new_user2)

repo.delete(new_user1.id)
users = repo.all
users.length # => 4
users.last.username # => 'amanda.benson@peep.com'

INTEGRATION TESTS:

# 11 Creates a user and two peeps.

user_repo = UserRepository.new
peep_repo = PeepRepository.new
new_user.first_name = 'Jane'
new_user.last_name = 'Dough'
new_user.user_name = 'janedough'
new_user.email = 'janedough@peep.com'
new_user = user_repo.create(new_user)

first_peep = Peep.new
first_peep.peep_content = 'This is my first peep!'
first_peep.peep_post_date = '2023-03-15'
peep_repo.create(first_peep)

second_peep = Peep.new
second_peep.peep_content = 'This is my second peep!'
second_peep.peep_post_date = '2023-03-15'
peep_repo.create(second_peep)

peep_repo.delete(first_peep.id)
peeps = peep_repo.all

peeps.length # => 1
peeps.second_peep.peep_content # => 'This is my second peep!'
new_user.user_name = 'janesourdough'
user_repo.update(new_user)
new_user.user_name # => 'janesourdough'

7. Reload the SQL seeds before each test run

# file: spec/user_repository_spec.rb

def reset_users_table
  seed_sql = File.read('spec/seeds_peeps_test.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitterdb' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
end

  # (your tests will go here).
end

# file: spec/peep_repository_spec.rb

def reset_peeps_table
  seed_sql = File.read('spec/seeds_peeps_test.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitterdb' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_peeps_table
end

  # (your tests will go here).
end

8. Test-drive and implement the Repository class behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.