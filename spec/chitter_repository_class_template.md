# {{TABLE NAME}} Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](./single_table_design_recipe_template.md).

*In this template, we'll use an example table `students`*

```
# EXAMPLE 

Table: students

Columns:
id | name | cohort_name
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

TRUNCATE TABLE users, posts RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (name, username, email_address, password) VALUES ('Mike Oliver', 'mike', remoteunderscore@gmail.com);
INSERT INTO posts (message, message_time, user_id) VALUES ('Deployed', '2022-12-02 14:20:00', '1');


```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
# EXAMPLE

# Table name: books

# Model class
# lib/books.rb




class User

end

class UserRepository

end

class Post

end

class PostRepository

end









```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby

# EXAMPLE

# Table name: books

class User
  attr_accessor :name :username :email_address :password
end

class Post
  attr_accessor :message :message_time :user_id
end



# Table name: albums

# Model class
# (in lib/album.rb)

class Album

  # Replace the attributes by your own columns.
  attr_accessor :id, :title, :release_year, :artist_id
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

# Table name: books

# Repository class
# lib/book_repository.rb

class UserRepository
  def all

  # SQL: 'SELECT id, name, username, email_address, password FROM users;'
  # returns all users
  end

  def find(id)

  # SQL: 'SELECT id, name, username, email_address, password FROM users WHERE id = $1;'
  # Returns a single user
  end

  def create(user)

  # SQL: 'INSERT INTO users (name, username, email_address, password) VALUES($1, $2, $3, $4);'
  # Doesn't need to return anything
  end

  def delete(id)

  # SQL: 'DELETE FROM users WHERE id = $1;'
  # Doesn't need to return anything
  end

  def update(user)

  # SQL: 'UPDATE users SET name = $1, username = $2, email_address = $3, password = $4 WHERE id = $5;'
  # Doesn't need to return anything
  end


class PostRepository
  def all

  # SQL: 'SELECT id, message, message_time, user_id FROM posts;'
  # returns an array of posts
  end

  def find(id)

  #SQL: 'SELECT id, message, message_time, user_id FROM posts WHERE id = $1;'
  # Returns a single user post
  end

  def create(post)

  # SQL: 'INSERT INTO posts (message, message_time, user_id) VALUES($1, $2, $3);'
  # Doesn't need to return anything
  end

  def delete(id)

  # SQL: 'DELETE FROM posts WHERE id = $1;'
  # Doesn't need to return anything
  end

  def update(post)

  # SQL: 'UPDATE posts SET message = $1, message_time = $2, user_id = $3 WHERE id = $4;'
  # Doesn't need to return anything
  end

```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES

# 1
# Get all user_accounts and posts

repo = UserRepository.new

users = repo.all
users.first.id # => '1'
users.length # => 1
users.first.email_address # => 'remoteunderscore@gmail.com'

repo = PostRepository.new

posts = repo.all
posts.first.id # => '1'
posts.length # => 1
posts.first.message # => 'Deployed'


# 2
# Get a single user_account and post

repo = UserRepository.new

user = repo.find(1)
user.name # => 'Mike Oliver'
user.username # => 'mike'

repo = PostRepository.new

post = repo.find(1)
post.message # => 'Deployed'
post.message_time # => '2022-12-02 14:20:00'


# 3
# Create a new user

repo = UserRepository.new

user = User.new
user_account.email_address = 'maisie@maisie'
user_account.username = 'maisie'

user_accounts = repo.all
repo.create(user_account)

last_user_account = user_accounts.last

expect(last_user_account.email_address).to eq ('maisie@maisie')
expect(last_user_account.username).to eq ('maisie')


# 4
# Delete a user account

repo = UserAccountRepository.new

repo.delete(1)

all_user_accounts.length # => 3
all_user_accounts.first.id # => 2

repo = PostRepository

repo.delete(1) # Delete a post with id 1

all_posts.length # => 3
all_posts.first.id # => 2


# 5
# Update a user account

repo = UserAccountRepository.new

user_account = repo.find(1)

user_account.email_address = 'mike@mike'
user_account.username = 'mike'

updated_user_account = repo.find(1)
updated_user_account.email_address # => 'henry@henry'
updated_user_account.username # => 'henry'


repo = PostRepository.new

post = repo.find(1)

post.post_title = 'day one'
post.post_contents = 'Once upon a time'

updated_post.post_title # => 'To begin with'
updated_post.post_contents # => 'I wandered lonely as a cloud...'






```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/student_repository_spec.rb

def reset_user_accounts_table
  seed_sql = File.read('spec/seeds_user_accounts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
  connection.exec(seed_sql)
end

describe StudentRepository do
  before(:each) do 
    reset_user_accounts_table
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