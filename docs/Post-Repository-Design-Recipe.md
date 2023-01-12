# Post Model and Repository Classes Design Recipe

## 1. Design and create the Table
```
Table: posts

Columns:
id | message | timestamp | user_id 
```

## 2. Create Test SQL seeds

```sql
-- (file: spec/seeds_posts.sql)

TRUNCATE TABLE users, posts RESTART IDENTITY; 

INSERT INTO users (name, user_name, email, password) VALUES ('Harry Potter', 'lightning-boy', 'harry@hogwarts.com', 'scarhead1234');
INSERT INTO users (name, user_name, email, password) VALUES ('Ron Weasley', 'gingernut', 'ron@hogwarts.com', 'redhead4eva');
INSERT INTO users (name, user_name, email, password) VALUES ('Hermione Granger', 'clever-cloggs', 'herminone@hogwarts.com', 'best-in-class');
INSERT INTO posts (message, timestamp, user_id) VALUES ('Tom Riddle is a baddie', '2023-01-08 12:05:06', 1);
INSERT INTO posts (message, timestamp, user_id) VALUES ('gingernut has dirt on his nose', '2023-01-07 15:11:06', 3);
INSERT INTO posts (message, timestamp, user_id) VALUES ('I heart Ginny', '2023-01-08 09:05:06', 1);
INSERT INTO posts (message, timestamp, user_id) VALUES ('Looking forward to quidditch world cup!', '2023-01-09 11:11:06', 2);
INSERT INTO posts (message, timestamp, user_id) VALUES ('Re-reading Hogwards: A History', '2023-01-07 16:24:06', 3);
INSERT INTO posts (message, timestamp, user_id) VALUES ('Do one, Malfoy', '2023-01-08 21:09:06', 1);
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 chitter_database_test < seeds_posts.sql
```

## 3. Define the class names

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
# Table name: posts
# Model class
# (in lib/post.rb)
class Post
  attr_accessor :id, :message, :timestamp, :user_id
end

```
## 5. Define the Repository Class interface

```ruby
# Table name: posts
# Repository class
# (in lib/post_repository.rb)
class PostRepository
  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT posts.id, posts.message, posts.timestamp, users.name, users.user_name FROM posts JOIN users ON users.id = posts.user_id;
    # Returns an array of Post objects with user names and user_names.
  end
  # Gets mulitple records by user_id
  # One argument: the id (number)
  def find_by_user_id(user_id)
    # Executes the SQL query:
    # SELECT id, message, timestamp, user_id FROM posts WHERE user_id = $1;
    # Returns multiple Post objects.
  end
  # Adds a new post to the table
  def create(post)
    # Executes the SQL query:
    # INSERT INTO posts (message, timestamp, user_id) VALUES ($1, $2, $3)
    # Returns nil
  end
end
```

## 6. Write Test Examples

```ruby
# 1
# Get all posts

repo = PostRepository.new

posts = repo.all

expect(posts.length).to eq 6

expect(posts[0].id).to eq 1
expect(posts[0].message).to eq 'Tom Riddle is a baddie'
expect(posts[0].timestamp).to eq '2023-01-08 12:05:06'
expect(posts[0].user_id).to eq 1
expect(posts[0].name).to eq 'Harry Potter'
expect(posts[0].user_name).to eq 'lightning-boy'

expect(posts[1].id).to eq 2
expect(posts[1].message).to eq 'gingernut has dirt on his nose'
expect(posts[1].timestamp).to eq '2023-01-07 15:11:06'
expect(posts[1].user_id).to eq 3
expect(posts[1].name).to eq 'Hermione Granger'
expect(posts[1].user_name).to eq 'clever-cloggs'

# 2
# Get all posts by a single user_id
repo = PostRepository.new

user_posts = repo.find_by_user_id(1)

expect(user_posts.length).to eq 3

expect(user_posts[0].message).to eq 'Tom Riddle is a baddie'
expect(user_posts[1].message).to eq 'I heart Ginny'
expect(user_posts[2].message).to eq 'Do one, Malfoy'

# 3
# Create a new post
repo = PostRepository.new

new_post = Post.new
new_post.message = 'I want a Nimbus200'
new_post.timestamp = '2023-01-08 22:10:06'
new_post.user_id = 3

repo.create(new_post)

expect(repo.all.length).to eq 7
expect(repo.all).to include(
  have_attributes(message: 'I want a Nimbus200', timestamp: '2023-01-08 22:10:06', user_id: 3)
)

```

## 7. Reload the SQL seeds before each test run

```ruby
# file: spec/post_repository_spec.rb

def reset_posts_table
  seed_sql = File.read('spec/seeds_posts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
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