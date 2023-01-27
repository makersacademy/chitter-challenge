# {{TABLE NAME}} Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._




# User stories:
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

# Notes on functionality

You don't have to be logged in to see the peeps.
Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
The username and email are unique.
Peeps (posts to chitter) have the name of the maker and their user handle.




## 1. Design and create the Table

If the table is already created in the database, you can skip this step.





## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- EXAMPLE
-- (file: spec/seeds_{table_name}.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE users, peeps, comments RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (email_address, password, name, username) VALUES ('sarahjacobs@gmail.com', 'StrongPassword123!!', 'Sarah Jacobs', 'JazzySaz');
INSERT INTO users (email_address, password, name, username) VALUES ('johnny22@gmail.com', '22pwordjj', 'Johnny James', 'JJ22');
INSERT INTO users (email_address, password, name, username) VALUES ('lewisjandrews@outlook.com', 'Norfolk?91', 'Lewis Andrews', 'Luigi_100');


INSERT INTO peeps (content, date_and_time, user_id) VALUES ('My first peep!!!', '2022-11-30 12:05:06', 1);
INSERT INTO peeps (content, date_and_time, user_id) VALUES ('Second Maker to peep lmao!', '2022-11-30 16:45:12', 2);
INSERT INTO peeps (content, date_and_time, user_id) VALUES ('Bronze medal for me lololol', '2022-12-01 11:22:34', 3);
INSERT INTO peeps (content, date_and_time, user_id) VALUES ('Go Makers!!', '2022-12-01 17:01:02', 1);
INSERT INTO peeps (content, date_and_time, user_id) VALUES ('Has anyone seen my rubber duck?', '2022-12-01 18:11:55', 2);

INSERT INTO comments (content, date_and_time, user_id, peep_id) VALUES ('You beat me to it!!', '2022-11-30 17:05:11', 2, 1);
INSERT INTO comments (content, date_and_time, user_id, peep_id) VALUES ('Do I win a prize?', '2022-11-30 17:10:20', 1, 1);
INSERT INTO comments (content, date_and_time, user_id, peep_id) VALUES ('In your dreams lol', '2022-11-30 17:21:40', 2, 1);
INSERT INTO comments (content, date_and_time, user_id, peep_id) VALUES ('Did you leave it in the bath again??', '2022-12-01 19:34:54', 3, 5);
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 chitter_test < seeds_chitter.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
# Table name: users

# Model class
# (in lib/user.rb)
class User
end

# Repository class
# (in lib/user_repository.rb)
class UserRepository
end



# Table name: peeps

# Model class
# (in lib/peep.rb)
class Peep
end

# Repository class
# (in lib/peep_repository.rb)
class PeepRepository
end



# Repository class
# (in lib/user_repository.rb)
class UserRepository
end


# Table name: comments

# Model class
# (in lib/comment.rb)
class Comment
end

# Repository class
# (in lib/comment_repository.rb)
class CommentRepository
end


```




## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# Table name: users

# Model class
# (in lib/user.rb)

class User
  # Replace the attributes by your own columns.
  attr_accessor :id, :email_address, :password, :name, :username
end



# Table name: peeps

# Model class
# (in lib/peep.rb)

class Peep
  # Replace the attributes by your own columns.
  attr_accessor :id, :content, :date_and_time, :user_id
end



# Table name: comments

# Model class
# (in lib/comment.rb)
class Comment
  # Replace the attributes by your own columns.
  attr_accessor :id, :content, :date_and_time, :user_id, :peep_id
end





# The keyword attr_accessor is a special Ruby feature
# which allows us to set and get attributes on an object,
# here's an example:
#
# user = User.new
# user.name = 'Jo'
# user.name
```

*You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.*




## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
# EXAMPLE
# Table name: users

# Repository class
# (in lib/user_repository.rb)

class UserRepository

  # Gets all users
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, email_address, password, name, username FROM users;

    # Returns an array of User objects.
  end

  # creates a new user (account)
  # takes one argument: a User object
  def create(user)
    # Executes the SQL query:
    # INSERT INTO users (email_address, password, name, username) VALUES ($1, $2, $3, $4);

    # Returns nil
  end
end



class PeepRepository

  # Gets all peeps
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, content, date_and_time, user_id FROM peeps;

    # Returns an array of Peep objects.
  end

  # Gets all peeps by given user
  # One argument: the (user)id (number)
  def peeps_by_user(user_id)
    # Executes the SQL query:
    # SELECT id, content, date_and_time, FROM peeps WHERE user_id = $1;

    # Returns all peeps by given User object.
  end

  # creates a new peep
  # takes one argument: a Peep object
  def create(peep)
    # Executes the SQL query:
    # INSERT INTO peeps (content, date_and_time, user_id) VALUES ($1, $2, $3);

    # Returns nil
  end

  # # allows user to delete a peep they've posted
  # def delete(peep)
  #   TBC
  # end
end



# Repository class
# (in lib/comment_repository.rb)
class CommentRepository

  # Gets all comments
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, content, date_and_time, user_id, peep_id FROM comments;

    # Returns an array of Comment objects.
  end

  # Gets all comments by given peep
  # One argument: the (peep)id (number)
  def comments_by_peep(peep_id)
    # Executes the SQL query:
    # SELECT id, content, date_and_time, user_id FROM comments WHERE peep_id = $1;

    # Returns all comments by given Peep object.
  end

  # creates a new comment
    # takes one argument: a Comment object
  def create(comment)
    # Executes the SQL query:
    # INSERT INTO comments (content, date_and_time, user_id, peep_id) VALUES ($1, $2, $3, $4);

    # Returns nil
  end

  # # allows user to delete a comment they've posted
  # def delete(comment)
  #   TBC
  # end
end
```





## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby

# USERS

# 1 get all users
  
  repo = UserRepository.new
  users = repo.all

  users.length # => 3
  users.first.id # => '1'
  users.first.email_address # => 'sarahjacobs@gmail.com'
  users.first.password # => 'StrongPassword123!!'
  users.first.name # => 'Sarah Jacobs'
  users.first.username # => 'JazzySaz'
  users.last.id # => '3'
  users.last.email_address # => 'lewisjandrews@outlook.com'
  users.last.password # => 'Norfolk?91'
  users.last.name # => 'Lewis Andrews'
  users.last.username # => 'Luigi_100'


# 2 create(user)
  # 2.1
  # success: create a user (valid input)

  new_user = User.new
  new_user.email_address = 'newuser@gmail.com'
  new_user.password = 'NewPassword'
  new_user.name = 'New Name'
  new_user.username = 'new_username'

  repo = UserRepository.new
  repo.create(new_user)

  users = repo.all

  users.last.id # => '4'
  users.last.email_address # => 'newuser@gmail.com'
  users.last.password # => 'NewPassword'
  users.last.name # => 'New Name'
  users.last.username # => 'new_username'

  
  # 2.2
  # error: empty field
  new_user = User.new
  new_user.email_address = 'newuser@gmail.com'
  new_user.password = 'NewPassword'
  new_user.name = 'New Name'
  new_user.username = ''

  repo = UserRepository.new
  expect{ repo.create(new_user) }.to raise_error('Please fill in all fields')


  # 2.3
  # error: email_address taken
  new_user = User.new
  new_user.email_address = 'sarahjacobs@gmail.com'
  new_user.password = 'NewPassword'
  new_user.name = 'New Name'
  new_user.username = 'new_username'

  repo = UserRepository.new
  expect{ repo.create(new_user) }.to raise_error('That email address is already taken')


  # 2.4
  # error: username taken
  new_user = User.new
  new_user.email_address = 'newuser@gmail.com'
  new_user.password = 'NewPassword'
  new_user.name = 'New Name'
  new_user.username = 'JJ22'

  repo = UserRepository.new
  expect{ repo.create(new_user) }.to raise_error('That username is already taken')






# PEEPS

# 1 #all
  # 1.1
  # success: get all peeps
  
  repo = PeepRepository.new
  peeps = repo.all

  peeps.length # => 5
  peeps.first.id # => '1'
  peeps.first.content # => 'My first peep!!!'
  peeps.first.date_and_time # => '2022-11-30 12:05:06'
  peeps.first.user_id # => '1'
  peeps.last.id # => '5'
  peeps.last.content # => 'Has anyone seen my rubber duck?'
  peeps.last.date_and_time # => '2022-12-01 18:11:55'
  peeps.last.user_id # => '2'


# 2 #peeps_by_user(user_id)
  # 2.1
  # success: get all peeps by user_id
  repo = PeepRepository.new

  peeps_by_user = repo.peeps_by_user(2)

  peeps_by_user.length # => 2

  peeps_by_user.first.id # => '2'
  peeps_by_user.first.content # => 'Second Maker to peep lmao!'
  peeps_by_user.first.date_and_time # => '2022-11-30 16:45:12'
  peeps_by_user.first.user_id # => '2'

  peeps_by_user.last.id # =>  '5'
  peeps_by_user.last.content # => 'Has anyone seen my rubber duck?'
  peeps_by_user.last.date_and_time # => '2022-12-01 18:11:55'
  peeps_by_user.last.user_id # => '2'


  # 2.2
  # error: invalid user ID
  repo = PeepRepository.new
  expect{ repo.peeps_by_user(70) }.to raise_error("This user does not exist")


# 3 #create(peep)
  # 3.1
  # success: create a peep
  new_peep = Peep.new
  new_peep.content = 'New test peep'
  new_peep.date_and_time = '2022-12-01 19:43:11'
  new_peep.user_id = 3   # or string '3'?
  
  repo = PeepRepository.new
  repo.create(new_peep)

  peeps = repo.all

  peeps.length # => 6
  peeps.last.id # => '6'
  peeps.last.content # => 'New test peep'
  peeps.last.date_and_time # => '2022-12-01 19:43:11'
  peeps.last.user_id # => '3'


  # 3.2
  # error: empty field
  new_peep = Peep.new
  new_peep.content = ''
  new_peep.date_and_time = '2022-12-01 19:43:11'
  new_peep.user_id = 3   # or string '3'?
  
  repo = PeepRepository.new
  expect{ repo.create(new_peep) }.to raise_error("Peeps must be at least 1 character long")





# COMMENTS
# 1 #all
  # 1.1
  # success: get all comments
  
  repo = CommentRepository.new
  comments = repo.all

  comments.length # => 4
  comments.first.id # => '1'
  comments.first.content # => 'You beat me to it!!'
  comments.first.date_and_time # => '2022-11-30 17:05:11'
  comments.first.user_id # => '2'
  comments.first.peep_id # => '1'

  comments.last.id # => '4'
  comments.last.content # => 'Did you leave it in the bath again??'
  comments.last.date_and_time # => '2022-12-01 19:34:54'
  comments.last.user_id # => '3'
  comments.last.peep_id # => '5'


# 2 #comments_by_peep(peep_id)
  # 2.1
  # success: get all comments by peep_id
  repo = CommentRepository.new
  comments_by_peep = repo.comments_by_peep(1)

  comments_by_peep.length # => 3
  comments_by_peep.first.id # => '1'
  comments_by_peep.first.content # => 'You beat me to it!!'
  comments_by_peep.first.date_and_time # => '2022-11-30 17:05:11'
  comments_by_peep.first.user_id # => '2'

  comments_by_peep.last.id # => '3'
  comments_by_peep.last.content # => 'In your dreams lol'
  comments_by_peep.last.date_and_time # => '2022-11-30 17:21:40'
  comments_by_peep.last.user_id # => '2'


  # 2.2
  # error: invalid peep_id
  repo = CommentRepository.new
  expect{ repo.comments_by_peep(95) }.to raise_error("Invalid peep")


# 3 create(comment)
  # 3.1
  # success: create a comment
  new_comment = Comment.new
  new_comment.content = 'New test comment'
  new_comment.date_and_time = '2022-12-01 20:40:14'
  new_comment.user_id = 3   # or string '3'?
  new_comment.peep_id = 5   # or string '5'?
  
  repo = CommentRepository.new
  repo.create(new_comment)

  comments = repo.all

  comments.length # => 5
  comments.last.id # => '5'
  comments.last.content # => 'New test comment'
  comments.last.date_and_time # => '2022-12-01 20:40:14'
  comments.last.user_id # => '3'
  comments.last.peep_id # => '5'


  # 3.2
  # error: empty field
  new_comment = Comment.new
  new_comment.content = ''
  new_comment.date_and_time = '2022-12-01 20:40:14'
  new_comment.user_id = 3   # or string '3'?
  new_comment.peep_id = 5   # or string '5'?
  
  repo = CommentRepository.new
  expect{ repo.create(new_comment) }.to raise_error("Comments must be at least 1 character long")


```



Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# file: spec/TBC_spec.rb

def reset_tables
  seed_sql = File.read('spec/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

RSpec.describe TbcRepository do
  before(:each) do 
    reset_tables
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
