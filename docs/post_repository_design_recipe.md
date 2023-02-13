# {{TABLE NAME}} Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](./single_table_design_recipe_template.md).

*In this template, we'll use an example table `posts`*

```
# EXAMPLE

Table: posts

Columns:
id | message | timestamp | user_id
```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- EXAMPLE
-- (file: spec/seeds_posts.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE posts RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO artists ("message", "timestamp", 'user_id') VALUES
("Friends don/'t lie", '2023-01-08 12:05:06', 1),
("Ahoy, ladies. Didn/'t see you there", '2023-01-08 09:05:06', 5),
("You/'re all so nerdy, it makes me physically ill", '2023-01-07 16:24:06' 6),
("Okay, it/'s official, I'm never having kids", '2023-01-08 21:09:06', 3)
("Mike, don/’t stop, okay? You/’re the heart", '2023-01-07 15:11:06', 4),
("
If anyone asks where I am, I/'ve left the country!", '2023-01-09 11:11:06', 2),
("Eggos, eggos, eggos", '2023-01-07 12:22:06' 1),
("We/’re not even in the game; we/’re on the bench.", '2023-01-09 15:11:06' 2);
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
# EXAMPLE
# Table name: Posts

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

  # Replace the attributes by your own columns.
  attr_accessor :id, :message, :timestamp, :user_id
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
# Table name: posts

# Repository class
# (in lib/post_repository.rb)

class PostRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, message, timestamp, user_id FROM posts;

    # Returns an array of Post objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, message, timestamp, user_id FROM posts WHERE id = $1;

    # Returns a single post object.
  end

  # Add more methods below for each operation you'd like to implement.

  def create(new_post)
    # Executes the SQL query:
    # INSERT INTO posts (message, timestamp, user_id) VALUES ($1, $2, $3);
    
    #return new_post
  end

  def delete(id)
    # Executes the SQL query:
    # DELETE FROM posts WHERE id = $1;

    #return nil
  end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES

# 1
# Get all posts

repo = PostRepository.new

posts = repo.all

expect(posts.length).to eq 8

expect(posts[0].message).to eq "Friends don/'t lie"
expect(posts[0].timestamp).to eq '2023-01-08 12:05:06'
expect(posts[0].user_id).to eq 1


# 2
# Get a single post using its id

repo = PostRepository.new

post = repo.find(3)

expect(post.message).to eq "You/'re all so nerdy, it makes me physically ill"
expect(post.timestamp).to eq '2023-01-07 16:24:06'
expect(post.user_id).to eq 6

# Add more examples for each method

# 3 
# creates a new post

repo = PostRepository.new

new_post = Post.new
new_post.message = "Sorry, but you ate my cat"
new_post.timestamp = '2023-01-08 10:12:06'
new_post.user_id = 3

repo.create(new_post)

posts = repo.all

expect(posts.length).to eq 9
expect(posts.last.message).to eq "Sorry, but you ate my cat"
expect(posts.last.timestamp).to eq '2023-01-08 10:12:06'
expect(posts.last.user_id).to eq 3

# 4
# deletes a post using its id

repo = PostRepository.new

repo.delete(1)
posts = repo.all

expect(posts.length).to eq 7
expect(posts.first.id).to eq 1

```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/post_repository_spec.rb

def reset_posts_table
  seed_sql = File.read('spec/seeds/seeds_posts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database' })
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

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---



<!-- END GENERATED SECTION DO NOT EDIT -->