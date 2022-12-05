# {{TABLE NAME}} Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](./single_table_design_recipe_template.md).

*In this template, we'll use an example table `students`*

```

```

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

TRUNCATE TABLE users RESTART IDENTITY; -- replace with your own table name.
TRUNCATE TABLE posts RESTART IDENTITY;
-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (username, email) VALUES ('Tom', 'tom@gmail.com');
INSERT INTO users (username, email) VALUES ('Jerry', 'jerry@gmail.com');

INSERT INTO posts (title, content, views, user_id) VALUES ('Day 1', 'good morning', 10, 1);
INSERT INTO posts (title, content, views, user_id) VALUES ('Day 2', 'good evening', 5, 2);
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 social_network_test< spec/seeds_posts.sql

psql -h 127.0.0.1 social_network_test< spec/seeds_users.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
# EXAMPLE
# Table name: students

# Model class
# (in lib/student.rb)
class User
end

# Repository class
# (in lib/student_repository.rb)
class UserRepository
end

class Post
end

# Repository class
# (in lib/student_repository.rb)
class PostRepository
end
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# EXAMPLE
# Table name: students

# Model class
# (in lib/student.rb)

class User

  # Replace the attributes by your own columns.
  attr_accessor :id, :username, :email
end

class Post

  # Replace the attributes by your own columns.
  attr_accessor :id, :title, :content, :time, :user_id
end


# The keyword attr_accessor is a special Ruby feature
# which allows us to set and get attributes on an object,
# here's an example:
#
# student = Student.new
# student.name = 'Jo'
# student.name
```

*You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.*

## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
# EXAMPLE
# Table name: students

# Repository class
# (in lib/student_repository.rb)

class UserRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, cohort_name FROM students;

    # Returns an array of Student objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, cohort_name FROM students WHERE id = $1;

    # Returns a single Student object.
  end


  def create(user)
  end

  
end

class PostRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, cohort_name FROM students;

    # Returns an array of Student objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, cohort_name FROM students WHERE id = $1;

    # Returns a single Student object.
  end


  def create(post)
  end

  

 
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES

# User Repo Tests
# 1
# Get all users

repo = UserRepository.new

users = repo.all

users.length # =>  3

users[0].id # =>  1
users[0].username # =>  'Yannis'
users[0].email # =>  'yphillip@foals.com'

users[1].id # =>  2
users[1].username # =>  'Jimmy'
users[1].email # =>  'jsmith@foals.com'

# 2
# Get a single user

repo = UserRepository.new

user = repo.find(1)

user.id # =>  1
user.username # =>  'Yannis'
user.email # =>  'yphillip@foals.com'

user = repo.find(3)

user.id # =>  3
user.username # =>  'Jack'
user.email # =>  'beeker@foals.com'

# 3
# Create a new user

repo = UserRepository.new

user = User.new

user.username = 'Edwin'
user.email = 'ed@foals.com'

repo.create(user) => returns nil

users = repo.all
last_user = users.last
last_user.username #=> 'Edwin'
last_user.email #=> 'ed@foals.com'




# Post Repo Tests
# 2
# Get all posts

repo = PostRepository.new

posts = repo.all

posts.length # =>  4

posts[0].id # =>  1
posts[0].title # =>  'Antidotes'
posts[0].content # =>  'math rocking glory'
posts[0].time # => 2008-01-01 12:00:00

posts[1].id # =>  2
posts[1].title # =>  'TLF'
posts[1].content # =>  'spanish sahara left field'
posts[1].time #=>  2010-01-01 12:00:00


# 2
# Get a single post

repo = PostRepository.new

post = repo.find(3)

post.id # =>  3
post.title # =>  'Holy Fire'
post.content # =>  'you dont have my number'
post.time # => 2013-01-01 12:00:00

post = repo.find(4)

post.id # =>  4
post.title # =>  'Went Down'
post.content # =>  'I see a lion'
post.time #=> 2015-01-01 12:00:00


# 3
# Create a new user

repo = PostRepository.new

post = Post.new

post.title = 'Life Is Yours'
post.content = 'wake me up'
post.time = 2022-01-01 12:00:00

repo.create(post) => returns nil

posts = repo.all
last_post = posts.last
last_post.title #=> 'Life Is Yours'
last_post.content #=> 'wake me up'
last_post.time #=> 2022-01-01 12:00:00


```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# USER REPO SPEC
# file: spec/user_repository_spec.rb

def reset_users_table
  seed_sql = File.read('spec/seeds_users.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' }) # do we run the test or real database?
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_user_table
  end

  # (your tests will go here).
end

# POST REPO SPEC

def reset_posts_table
  seed_sql = File.read('spec/seeds_posts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' }) # do we run the test or real database?
  connection.exec(seed_sql)
end

describe PostRepository do
  before(:each) do 
    reset_post_table
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->