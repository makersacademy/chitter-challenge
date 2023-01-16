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

INSERT INTO posts (content, post_timestamp, user_id ) VALUES
('Looking forward to a great weekend!', '2023-01-13 12:12:12', 1),
('This is my first peep!', '2022-01-04 07:12:24', 7),
('Back to work...', '2022-01-03 09:05:12', 6),
('Currently coding', '2022-01-03 08:10:14', 5),
('I love Chitter!', '2022-01-02 12:12:12', 4),
('Hope 2023 is a good year', '2023-01-01 00:14:18', 2),
('Happy New Year', '2023-01-01 00:12:15', 2),
('Just joined', '2022-12-31 12:12:12', 3),
('Hello..', '2022-12-31 09:09:24', 1);
; 
INSERT INTO "posts" ("content", "post_timestamp", "user_id") VALUES
('Looking forward to a great weekend!', '2023-01-13 12:12:12', 1),
('This site seems like fun', '2022-12-03 09:12:12', 3),
;
INSERT INTO posts (content, timestamp, user_id ) VALUES ();
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
  attr_accessor :id, :name, :cohort_name
end

# post = Post.new
# post.name = 
# post.name
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
    # SELECT id, name, cohort_name FROM posts;

    # Returns an array of Post objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, cohort_name FROM posts WHERE id = $1;

    # Returns a single Post object.
  end

  # Add more methods below for each operation you'd like to implement.

  # def create(post)
  # end

  # def delete(post)
  # end
end
```

## 6. Test Examples

These examples will later be encoded as RSpec tests.

```ruby

# 1
# Get all posts

repo = PostRepository.new

posts = repo.all

posts.length # =>  2

posts[0].id # =>  1
posts[0].name # =>  'David'
posts[0].cohort_name # =>  'April 2022'

posts[1].id # =>  2
posts[1].name # =>  'Anna'
posts[1].cohort_name # =>  'May 2022'

# 2
# Get a single post

repo = PostRepository.new

post = repo.find(1)

post.id # =>  1
post.name # =>  'David'
post.cohort_name # =>  'April 2022'


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

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_Refer to the repository class implementation for the posts table and the repository and implementation spec files for tests_

