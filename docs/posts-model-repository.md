# POSTS Model and Repository Classes Design Recipe

## 1. Design and create the Table


```

Table: POSTS

| Record                | Properties          |
| --------------------- | ------------------  |
| posts                 | id, postname, email, password
| posts                   id, date_created, content, post_id


```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql

TRUNCATE TABLE posts, posts  RESTART IDENTITY;

INSERT INTO posts (postname, email, password) VALUES 
('micheal23', 'micheal_james@gmail.com', "123456"),
('fred23', 'fred-manu@gmail.com', "ilovemymom456"),
('james-lewis', 'james-lewis333@gmail.com', "summin-summin!2323"),
('big-l', 'liam2@yahoo.com', "Rafaf22");
INSERT INTO posts (content, date_created, post_id) VALUES 
("Took the plunge. Dealing with the fall-out. About to secure my freedom from the evil tentacled monster. Takes 12 steps, but I hit a brick wall at 8.

Took time off to recuperate and recover my energy. Now back from paradise, rejuvenated and ready to take on the beast again. All eyes on the prize, one more trip to deliver the coup de grace to that other beast in the west. Once that's done, its just a matter of time and protocol until the next step is reached.

Its scary and new, but isn't that just what makes it all so deliciously exciting?", '11:22', 4),
('hot take: vine is the american dream', "12/6/22", 5),
('i always daydream about how kanye west will save the economy', "12/6/22", 4),
('i hate how running away from home and joining the circus is not as bad as everyone thinks', "12/6/22", 3),
('i always daydream about how the bee movie (2007) is fake news', "12/6/22", 2),
('u know what pisses me off? the fact that the dark side of the moon is fake.', "12/6/22", 1);


```

```bash
psql -h 127.0.0.1 chitter_test < seeds_posts_posts.sql
```

## 3. Define the class names

```ruby
# EXAMPLE

# Model class
# (in lib/post.rb)
class post
end

# Repository class
# (in lib/posts_Repository.rb)
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

class post
  attr_accessor :id, :content, :date_create, : :user_id
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
# (in lib/posts_Repository.rb)

class PostRepository

  def all

  end

  def find(id)
    
  end

  def create(post)
  end

  def update(post)
  end

  def delete(post)
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

posts.length # =>  2

posts[0].id # =>  1
posts[0].content # =>  'David'
posts[0].date_created # =>  330
posts[0].artist_id #=> 4

posts[1].id # =>  2
posts[1].content # =>  'Anna'
posts[1].date_created # =>  330
posts[1].artist_id #=> 5

# 2
# Get a single post

repo = PostRepository.new

posts = repo.find(1)

posts.id # =>  1
posts.content # =>  'David'
posts.date_created # =>  "23"
posts.artist_id # =>  "3"

# 3
# create a single order 
repo = PostRepository.new
post = post.new
post.id # => "??"
post.content # =>  'rings_new'
post.date_created # =>  34
post.artist_id # =>  6

repo.create(post)
posts = repo.all


posts[2].id # => "3"
posts[2].content # =>  'rings_new'
posts[2].date_created # =>  34
posts[2].artist_id # =>  6

#4
# update an post
repo = PostRepository.new
post = repo.find(1)

post.content # =>  'rubies_new'
repo.update(post)

posts = repo.all


posts[2].id # => "1"
posts[2].content # =>  'rubies_new'
posts[2].date_created # => 800
posts[2].artist_id # => 19

#5
# delete an post
repo = PostRepository.new
post = repo.find(1)

repo.delete(post)

posts = repo.all
posts.length #=> 1

```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run


```ruby
# EXAMPLE

# file: spec/posts_Repository_spec.rb

def reset_posts_posts_table
  seed_sql = File.read('spec/seeds_posts_posts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'shop_manager_test' })
  connection.exec(seed_sql)
end

describe PostRepository do
  before(:each) do 
    reset_posts_posts_table
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour
