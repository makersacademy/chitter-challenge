
# Posts Model and Repository Classes Design

## 1. Table Design 

```
Table: posts

Columns:
id | content | timestamp | user_id
```

## 2. Test SQL seeds

```sql
TRUNCATE TABLE posts RESTART IDENTITY; -- 

INSERT INTO posts (content, timestamp, user_id ) VALUES (' checking this site out', 23-01-01, 1);
INSERT INTO posts (content, timestamp, user_id ) VALUES ('checking this site out', 23-01-01, 1);
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql
```

## 3. Classes

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

## 4. Model class

```ruby

# Table name: posts

# Model class
# (in lib/post.rb)

class Post
  attr_accessor :id, :content, :timestamp, :user_id
end

# post = Post.new
# post.content = 'content'
```

## 5. Repository Class interface

```ruby
# Table name: posts

# Repository class
# (in lib/post_repository.rb)

class PostRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    
    #SELECT id, content, timestamp, user_id FROM posts;

    # Returns an array of Post objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  
  # Gets a single record by its content
  # One argument: the content(string)
  # Like
  def find(content)
    # Executes the SQL query:
    # SELECT id, content, timestamp, user_id FROM posts WHERE content LIKE $1;

    # Returns matching Post objects.
  end
  
  def create(post)
  # Executes the SQL query:
  # INSERT INTO posts VALUES (content, timestamp, user_id);

  # creates a new post record and object
  end

  
end
```

## 6. Test Examples

These examples will later be encoded as RSpec tests.

```ruby

# 1
# Get all posts

repo = PostRepository.new

posts = repo.all

posts.length # =>  20

posts[0].id # =>  1
posts[0].content # =>  'Hello, I've just signed up!'
posts[0].timestamp # =>  '23-01-05'
posts[0].user_id # => 3


# 2
# Get a single post

repo = PostRepository.new

post = repo.find('content')

post.id # =>  1
post.content # =>  'this is content'
post.timestamp # =>  '23-01-05'
post.user_id # => 1

# 3
# Get a single post by searching content

repo = PostRepository.new

post = repo.find('alice')

post.id # =>  1
post.content # =>  'this is content'
post.timestamp # =>  '23-01-05'
post.user_id # => 1


# 4
# Creates a new post

repo = PostRepository.new

post = repo.create('carol')

post.id # =>  3
post.content # =>  'Hello'
post.timestamp # =>  '23-01-03'
post.user_id # => 3


```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby

# file: spec/post_repository_spec.rb

def reset_posts_table
  seed_sql = File.read('spec/seeds_posts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'posts' })
  connection.exec(seed_sql)
end

describe PostRepository do
  before(:each) do 
    reset_posts_table
  end

  # Tests
end
```

## 8. Test-drive and implement the Repository class behaviour

_Refer to the repository class implementation for the posts table and the repository and implementation spec files for tests_

