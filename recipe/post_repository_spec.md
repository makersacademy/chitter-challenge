# Posts Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](./single_table_design_recipe_template.md).

*In this template, we'll use an example table `posts`*

```
# EXAMPLE

Table: posts

Columns:
id | content | post_time | tagged_users | user_id
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

INSERT INTO users (username, name, email, password) VALUES 
('ted453', 'Ted D', 'tedd@hotmailtest.com', 'qwerty123'),
('jem341', 'Jemm Platz', 'JSpace@yahoot.com', 'astrocosmaus789'),
('user123', 'Anon Ymouse', 'is_a_user@user.com', 'password_123');

INSERT INTO posts (content, post_time, tagged_users, user_id) VALUES
('Ate beans LOL', '2021-08-09 13:57:40', 'jem341', 1),
('Walked the dog, barked at a cat', '2022-05-06 16:57:40', '', 1),
('Wrote a message to Makers today saying how good the course is', '2022-08-31 20:57:40', 'user123', 2),
('Ran a marathon yesterday, quicker than the Flash', '2020-08-09 13:57:40', '', 3),
('Going on a diet after eating a beige buffet for lunch', '2022-01-09 13:57:40', 'ted453', 3);

```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 chitter_test < chitter_test_seeds.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
# EXAMPLE
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
# Table name: posts

# Model class
# (in lib/post.rb)

class Post
  attr_accessor :id, :content, :post_time, :tagged_users, :user_id
end

```

*You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.*

## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
# EXAMPLE
# Table name: posts

# Repository class
# (in lib/post_repository.rb)

class PostRepository
  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT * FROM posts;

    # Returns an array of post objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT * FROM posts WHERE id = $1;

    # Returns a single post object.
  end

  def create(post)
    # Executes the SQL query:
    # INSERT INTO posts (content, post_time, tagged_users, user_id) VALUES ($1, $2, $3, $4);
  end

  # def update(post)
  # end

  # def delete(post)
  # end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES

# 1
# Get all posts

repo = postRepository.new
posts = repo.all

posts.length # =>  3

posts[0].id # =>  1
posts[0].content # => 'Ate beans LOL'
posts[0].post_time # =>  '2021-08-09 13:57:40'
posts[0].tagged_users # =>  'jem341'
posts[0].user_id # => 1

posts[4].id # =>  1
posts[4].content # => 'Going on a diet after eating a beige buffet for lunch'
posts[4].post_time # =>  '2022-01-09 13:57:40'
posts[4].tagged_users # =>  'ted453'
posts[4].user_id # => 3

# 2
# Get a single post

repo = postRepository.new

post = repo.find(1)
posts.id # =>  1
posts.content # => 'Ate beans LOL'
posts.post_time # =>  '2021-08-09 13:57:40'
posts.tagged_users # =>  'jem341'
posts.user_id # => 1

# Get a single post

repo = postRepository.new

post = repo.find(3)
posts.id # =>  3
posts.content # => 'Wrote a message to Makers today saying how good the course is'
posts.post_time # =>  '2022-08-31 20:57:40'
posts.tagged_users # =>  'user123'
posts.user_id # => 2


#3
#Create a post

repo = postRepository.new
post = post.new
post.content = 'Ed Balls'
post.post_time = '2019-01-20 14:20:00'
post.tagged_users = ''
post.user_id = '3'

repo.create(post)
all_posts = repo.all

expect(all_posts.length).to eq 6
expect(all_posts.last.content).to eq 'Ed Balls'
expect(all_posts.last.post_time).to eq '2019-01-20 14:20:00'
expect(all_posts.last.user_id).to eq 3

```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/post_repository_spec.rb

def reset_posts_table
  seed_sql = File.read('spec/chitter_test_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
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
