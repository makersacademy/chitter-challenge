# Post - Model and Repository Classes Design Recipe

## 1. Design and create the Table

See: chitter_database_design_recipe.md

## 2. Create Test SQL seeds

See: ../spec/seeds_chitter.sql

## 3. Define the class names

```
┌────────────────────────────────────┐
│ PostRepository                     |
|                                    │
│ - all                              |
|   => 'returns all posts' info'     │
│ - find(id)                         |
|   => 'returns a sinle post's info' │
│ - create(id, col, val)             │
│ - delete(id)                       │
└───────────┬────────────────────────┘
            │
            │ owns a list of
            ▼
┌─────────────────────────┐
│ Post                    │
│                         │
│ - id                    │
│ - message               │
│ - timestamp             │
│ - user_id               |
└─────────────────────────┘
```

```ruby
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

```ruby
# EXAMPLE
# Table name: posts

# Model class
# (in lib/post.rb)

class Post

  attr_accessor :id, :message, :timestamp, :user_id
end
```

## 5. Define the Repository Class interface

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
    # SELECT id, message, timestamp, user_id FROM posts;

    # Returns an array of post objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, message, timestamp, user_id FROM posts WHERE id = $1;

    # Returns a single post object.
  end

  # Gets a single record by its postname
  # One argument: the postname
  def find_by_user_id(user_id)
    # Executes the SQL query:
    # SELECT id, message, timestamp, user_id FROM posts WHERE user_id = $1;

    # Returns a single post object.
  end

  # Adds new record to the 'posts' table
  # One argument: the new posts
  def create(new_post)
    # Executes the SQL query:
    # INSERT INTO posts (message, timestamp, user_id) VALUES ($1, $2, $3);

    # Doesn't return anything
  end

  # Updates the 'posts' table
  # 3 arguments: id, column name, value
  def update(id, col, val)
    # Executes the SQL query:
    # UPDATE posts SET message = $3 WHERE id = $1;

    # Doesn't return anything
  end

  # Removes a record from the 'posts' table
  # One argument: id
  def delete(id)
    # Executes the SQL query:
    # DELETE FROM posts WHERE id = $1;

    # Doesn't return anything
  end
end
```

## 6. Write Test Examples

```ruby
# EXAMPLES

# 1
# Get all posts
repo = postRepository.new

posts = repo.all

posts.length # =>  4

posts[0].id # =>  1
posts[0].message # =>  'message 1'
posts[0].timestamp # => '2022-07-15 10:23:54'
posts[0].user_id # =>  1

posts[1].id # =>  2
posts[1].message # =>  'message 2'
posts[1].timestamp # => '2022-07-15 10:24:54'
posts[1].user_id # =>  2

posts[2].id # =>  3
posts[2].message # =>  'message 3'
posts[2].timestamp # => '2022-07-16 10:25:54'
posts[2].user_id # =>  3

posts[3].id # =>  4
posts[3].message # =>  'message 4'
posts[3].timestamp # => '2022-07-16 10:26:54'
posts[3].user_id # =>  2

# 2
# Get a single post by id
repo = postRepository.new

post = repo.find(1)

post.id # =>  1
post.message # =>  'message 1'
post.timestamp # => '2022-07-15 10:23:54'
post.user_id # =>  1

# 3
# Adds new record to the 'posts' table
  repo = PostRepository.new

  new_post = Post.new
  new_post.message = 'fun message'
  new_post.timestamp = '2022-07-17 10:26:54'
  new_post.user_id = 'test4@email.com'
  repo.create(new_post)

  posts = repo.all

  posts.length # =>  5
  posts.last.message # =>  'message 1'
  posts.last.user_id # =>  4

# 4
# updates a message' 
repo = PostRepository.new
repo.update(2, 'message', 'del_m')

posts = repo.all
posts[1].id # =>  '2'
posts[1].message # =>  'funnier message'
posts[1].timestamp # =>  '2022-07-15 10:24:54'
posts[1].user_id # =>  '2'


# 5
# 'deletes an Post' do
repo = PostRepository.new

repo.delete(1)
posts = repo.all

posts.length # =>  3
posts.first.id # =>  2

```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

```ruby
# EXAMPLE

# file: spec/post_repository_spec.rb

def reset_posts_table
  seed_sql = File.read('spec/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_directory_test' })
  connection.exec(seed_sql)
end

describe PostRepository do
  before(:each) do 
    reset_posts_table
  end

  # (tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._