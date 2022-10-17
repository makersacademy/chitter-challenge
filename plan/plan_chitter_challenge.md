# Books Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](./single_table_design_recipe_template.md).


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

TRUNCATE TABLE users, posts RESTART IDENTITY;

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.
INSERT INTO users (username, email, password) VALUES ('harry_styles', 'harry_styles@email.co.uk', 'cherry');
INSERT INTO users (username, email, password) VALUES ('taylor_swift', 'taylor_swift@email.com', 'red');
INSERT INTO users (username, email, password) VALUES ('billie_eillish', 'billie_eillish@email.com', 'bored');

INSERT INTO posts (content, time_posted, user_id) VALUES ('watermelon sugar', ' 2022-03-10 09:30:00+00', 1);
INSERT INTO posts (content, time_posted, user_id) VALUES ('baby you are the love of my life', ' 2022-04-12 00:36:00+01', 1);
INSERT INTO posts (content, time_posted, user_id) VALUES ('you got the cinema', '2022-05-20 11:26:00+01', 1);
INSERT INTO posts (content, time_posted, user_id) VALUES ('all too well', '2022-05-14 04:00:00+01', 2);
INSERT INTO posts (content, time_posted, user_id) VALUES ('tear drops on my guitar', '2022-07-13 07:14:00+01', 2);
INSERT INTO posts (content, time_posted, user_id) VALUES ('you really know how to make me cry', '2022-10-21 00:29:00+01', 3);
INSERT INTO posts (content, time_posted, user_id) VALUES ('i just wanna watch tv', '2022-06-23 09:18:00+01', 3);


```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 chitter_challenge_test < posts_seeds.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
# EXAMPLE
# Table name: users

# Model class
# (in lib/user.rb)
class User
end

# Repository class
# (in lib/user_repository.rb)
class UserRepository
end

# Table name: posts

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
# Table name: user

# Model class
# (in lib/user.rb)

class User
  attr_accessor :username, :email, :password, :id
end

# Table name: post

# Model class
# (in lib/post.rb)

class Post
  attr_accessor :content, :time_posted, :user_id, :id
end


# The keyword attr_accessor is a special Ruby feature
# which allows us to set and get attributes on an object,
# here's an example:
#
# book = book.new
# book.name = 'Jo'
# book.name
```

*You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.*

## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
# EXAMPLE

# file: lib/user_repository.rb

class UserRepository
  def create(new_user)
    # Encrypt the password to save it into the new database record.
    encrypted_password = BCrypt::Password.create(new_user.password)

    sql = '
      INSERT INTO users (email, password)
        VALUES($1, $2);
    '
    sql_params = [
      new_user.email,
      encrypted_password
    ]
  end

  def sign_in(email, submitted_password)
    user = find_by_email(email)

    return nil if user.nil?

    # Compare the submitted password with the encrypted one saved in the database
    if submitted_password == BCrypt::Password.new(user.password)
      # login success
    else
      # wrong password
    end
  end

  def find_by_email(email)
    # ...
  end
end

# Table name: posts

# Repository class
# (in lib/post_repository.rb)

class PostRepository
  def all
  end

  def create(post)
  end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# USER EXAMPLES

# 1
# see all users

repo = UserRepository.new

users = repo.all

users.length # => 3
users.first.username # => "harry_styles"
users.first.email # => "harry_styles@email.co.uk"
users.first.password # => "cherry"

# 2
# create new user

repo = UserRepository.new

user = User.new
user.username = 'sabrina_carpenter'
user.email = 'sabrina_carpenter@email.com'
user.password = 'emails'

repo.create(user)

users = repo.all

users.length # => 4
users.last.username # => 'sabrina_carpenter'
users.last.email # => 'sabrina_carpenter@email.com'
users.last.password # => 'emails'

# 3
# find by email

repo = UserRepository.new

user = repo.find_by_email('taylor_swift@email.com')

user.id # => '2'
user.username # => 'taylor_swift'


# 4
# sign in

repo = UserRepository.new

user = repo.sign_in('billie_eillish@email.com', 'bored')

user # => true

# 4
# fail sign in

repo = UserRepository.new

user = repo.sign_in('billie_eillish@email.com', 'hi')

user # => false

# POSTS EXAMPLES INTERGRATED

# 1
# Get all posts

repo = PostRepository.new

posts = repo.all
order = post.first.time_posted > post.last.time_posted

posts.length # => 7

posts[0].id # => 1
posts[0].content # => 'watermelon sugar'
posts[0].time_posted # => '2022-03-10 09:30:00+00', 1
posts[0].user_id # => 1
order # => true

# 2
# Add a post

repo = PostRepository.new

post = Post.new
post.content = "you know it's not the same"
post.time_posted = '2022-08-08 09:30:00+00'
post.user_id = '1'

repo.create(post)

posts = repo.all
posts.length # => 8
posts.last.id # => '8'
posts.last.content # => "you know it's not the same"
posts.last.time_posted # => '2022-08-08 09:30:00+00'
posts.last.user_id # => '1'






```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/student_repository_spec.rb

def reset_user_table
  seed_sql = File.read('spec/posts_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do
    reset_user_table
  end

  # (your tests will go here).
end

def reset_posts_table
  seed_sql = File.read('spec/posts_seeds.sql')
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
