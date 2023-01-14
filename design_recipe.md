# Chitter Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

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
Post, time, user

Verbs:

Post message, reverse chronological, see time, sign up, log in, log out

```
# EXAMPLE

Table: posts

Columns: 
content: string
date_time: time

Table: users

Columns: 
email: string
password: string
name: string
user_name: string
logged_in: boolean 
```
Foreign Key is user_id. Many posts can have 1 user but many users cant have 1 post

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql

TRUNCATE TABLE posts, users RESTART IDENTITY; 


INSERT INTO posts (content, date_time) VALUES ('Peep 1', '17:48 05/12/2020');
INSERT INTO posts (content, date_time) VALUES ('Peep 2', '18:48 06/12/2020');
INSERT INTO posts (content, date_time) VALUES ('Peep 3', '19:48 07/12/2020');

INSERT INTO users (name, email, user_name, password, logged_in ) VALUES ('Adam Hoar', 'pretend@hotmail.com', 'adam1', 'password1', false);
INSERT INTO users (name, email, user_name, password, logged_in ) VALUES ('Joe Bloggs', 'fake@icloud.com', 'joe1', 'pizza123', false);
INSERT INTO users (name, email, user_name, password, logged_in ) VALUES ('John Doe', 'real@icloud.com', 'john3', 'makers1', false);
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 chitter_db < seeds_chitter.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby

class Post
end

class PostRepository
end

class User
end

class UserRepository
end

```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby

class Post
  attr_accessor :id, :content, :date_time
end

class User
  attr_accessor :id, :name, :user_name, :password, :logged_in
end

```

## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
class PostRepository


  def all
    # Sends SQL query to db
    # Returns all posts
  end

  def create(content)
    # Takes a string of content
    # Sends SQL query to add it to db
    # This is then populated online
  end
end

class UserRepository

  def sign_up(name, email, user_name, password)
    # Takes user credentials
    # Asks them to choose a username 
    # Checks if username is already taken
    # If not adds them to the db
  end

  def log_in(user_name, password)
    # checks username and password against the db
    # if both are correct returns true
    # changes value in db of logged_in to true
    # based on true value webpage will change to show user_name on posts
  end

  def log_out
    # sets logged_in to false
    # changes webpage to hide elements
  end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# Gets all posts
repo = PostRepository.new

posts = repo.all

posts.length # =>  3

posts[0].id # =>  1
posts[0].content # =>  'Peep 1'
posts[0].date_time # =>  '17:48 05/12/2020'

posts[1].id # =>  2
posts[1].content # =>  'Peep 2'
posts[1].date_time # =>  '18:48 06/12/2020'

# Creates a post

repo = PostRepository.new
repo.create("Peep 4")
posts = repo.all

posts[0].id # =>  1
posts[0].content # =>  'Peep 4'
posts[0].date_time # =>  'Time at creation'

# checks log in successful 
 
repo = UserRepository.new

expect(repo.log_in('adam1', 'password1')).to eq true

# checks log in unsuccessful 
repo = UserRepository.new

expect(repo.log_in('adam1', 'password')).to eq false

# Checks sign up successful
name, email, user_name, password
repo = UserRepository.new
expect(repo.sign_up('Dave Jones', 'dave@madeup.com','BigDave', 'bigpassword')).to eq true

# Checks sign up unsuccessful as it already exists
name, email, user_name, password
repo = UserRepository.new
expect(repo.sign_up('Adam Hoar', 'pretend@hotmail.com', 'adam1', 'password1')).to eq false
```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby

def reset_tables
  seed_sql = File.read('spec/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_db_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_tables
  end

  # (your tests will go here).
end

```

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name: string
  email: string
  user_name: string
  password: string
  logged_in: boolean 
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  content: string
  date_time: time
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

