# Chitter Challenge Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

[See chitter_table_recipe](./chitter_table_recipe.md).


```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- EXAMPLE
-- (file: spec/seeds_chitter_challenge.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE users RESTART IDENTITY CASCADE; -- replace with your own table name.


INSERT INTO users (name, email, password, username) VALUES ('First Name', 'firstname@email.com', 'abc123', 'firstname);
INSERT INTO users (name, email, password, username) VALUES ('Second Name', 'secondname@email.com', 'defgh456', 'secondname');


INSERT INTO posts (content, time, user_id) VALUES ('This is an example post from username firstname', '22022-01-08 04:05:06', 1);
INSERT INTO posts (content, time, user_id) VALUES ('This is another example post from username firstname', '22022-01-09 18:00:05', 1);

INSERT INTO posts (content, time, user_id) VALUES ('This is an example post from username firstname', '22022-01-08 05:02:03', 2);
INSERT INTO posts (content, time, user_id) VALUES ('This is another example post from username firstname', '22022-01-09 20:0:06', 2);

```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash

psql -h 127.0.0.1 chitter_challenge_test < spec/seeds_chitter_challenge.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
# EXAMPLE
# Table name: students

# Model class
# (in lib/user.rb)
class User
end

# Repository class
# (in lib/user_repository.rb)
class UserRepository
end

# Model class
# (in lib/post.rb)
class Post
end

# Repository class
# (in lib/post_repository.rb)
class PostRepository
end

```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# EXAMPLE
# Table name: users

# Model class
# (in lib/user.rb)

class User
  # Replace the attributes by your own columns.
  attr_accessor :id, :name, :email, :password, :username
end

# EXAMPLE
# Table name: posts

# Model class
# (in lib/post.rb)

class Post
  # Replace the attributes by your own columns.
  attr_accessor :id, :content, :time, :password, :user_id
end

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

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, email, password, username FROM users;

    # Returns an array of User objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, email, password, username FROM users WHERE id = $1;

    # Returns a single user object.
  end

      # Insert new user 
    # item is a new User object
  def create(user)
    # Executes the SQL query:

    # INSERT INTO users (name, email, password, username) VALUES($1, $2, $3, $4);
    # Doesn't need to return anything (only creates a record)
  end

end

# EXAMPLE
# Table name: users

# Repository class
# (in lib/post_repository.rb)

class PostRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, content, time, user_id FROM posts;

    # Returns an array of post objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, content, time, user_id FROM posts WHERE id = $1;

    # Returns a single post object.
  end

      # Insert new post 
    # item is a new post object
  def create(post)
    # Executes the SQL query:

    # INSERT INTO posts (content, time, user_id) VALUES($1, $2, $3);
    # Doesn't need to return anything (only creates a record)
  end

end

```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES

# 1
# Get all users

repo = UserRepository.new

users = repo.all

users.length # =>  2

users[0].id # =>  1
users[0].name # =>  First Name
users[0].email # =>  'firstname@email.com'
users[0].password # =>  'abc123'
users[0].username # =>  'firstname'

users[0].id # =>  2
users[0].name # =>  Second Name
users[0].email # =>  'secondname@email.com'
users[0].password # =>  'defgh456'
users[0].username # =>  'secondname'

# 2
# Get a single user

repo = UserRepository.new

user = repo.find(1)

user.id # =>  1
user.name # =>  First Name
user.email # =>  'firstname@email.com'
user.password # =>  'abc123'
user.username # =>  'firstname'

# 3 Creates a new user

repo = UserRepository.new

user = User.new
user.name # =>  Third Name
user.email # =>  'thirdname@email.com'
user.password # =>  'abcd1234'
user.username # =>  'thirdname'

repo.create(user) # => nil

all_users = repo.all
last_user = all_users.last

last_user.name # =>  Third Name
last_user.email # =>  'thirdname@email.com'
last_user.password # =>  'abcd1234'
last_user.username # =>  'thirdname'


# 1
# Get all posts

repo = PostRepository.new

posts = repo.all

posts.length # =>  2

posts[0].id # =>  1
posts[0].content # =>  'This is an example post from username firstname'
posts[0].time # =>  '22022-01-08 04:05:06'
posts[0].user_id # =>  1


posts[1].id # =>  2
posts[1].content # =>  'This is another example post from username firstname'
posts[1].time # =>  '22022-01-09 18:00:05'
posts[1].user_id # =>  1

# 2
# Get a single user

repo = PostRepository.new

post = repo.find(1)

posts.id # =>  1
posts.content # =>  'This is an example post from username firstname'
posts.time # =>  '22022-01-08 04:05:06'
posts.user_id # =>  1

# 3 Creates a new user

repo = PostRepository.new

post = Post.new
posts.content # =>  'This is an example test post from username secondname'
posts.time # =>  '22022-11-08 04:05:08'
posts.user_id # =>  2

repo.create(post) # => nil

all_posts = repo.all
last_post = all_posts.last

posts.content # =>  'This is an example test post from username secondname'
posts.time # =>  '22022-11-08 04:05:08'
posts.user_id # =>  2


# Add more examples for each method
```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/user_repository_spec.rb

def reset_users_table
  seed_sql = File.read('spec/seeds_chitter_challenge.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  # (your tests will go here).
end

# file: spec/user_repository_spec.rb

def reset_posts_table
  seed_sql = File.read('spec/seeds_chitter_challenge.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
  connection.exec(seed_sql)
end

describe PostRepository do
  before(:each) do 
    reset_posts_table
  end

  # (your tests will go here).
end

```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._


