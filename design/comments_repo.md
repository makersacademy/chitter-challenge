# Comment Model and Repository Classes Design Recipe

## 1. Design and create the Table

Done.

## 2. Create Test SQL seeds

Done.

## 3. Define the class names

```ruby
class Comment
end

class CommentRepository
end
```

## 4. Implement the Model class

```ruby
class Comment
  attr_accessor :id, :content, :time_posted, :user_id, :peep_id
end
```

## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
class CommentRepository
  def create(new_comment) # instance of comment
    # Executes the SQL query:
    # INSERT INTO comments (content, time_posted, user_id, peep_id) VALUES($1, $2, $3, $4);

    # doesnt need to return anything
  end

  def find_by_peep(post_id)
    # Executes the SQL query:
    # SELECT id, content, time_posted, user_id, peep_id FROM comments WHERE post_id = $1;

    # returns an array of comments associated with the post with that id
  end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES

# 1
# Get all comments related to a peep

repo = CommentRepository.new

comments = repo.find_by_peep(2)

expect(comments.length).to eq(1)
expect(comments.first.content).to eq('wow amazing')
# 2
# create a comment

repo = CommentRepository.new

new_comment = Comment.new
new_comment.content = 'New comment / reply'
new_comment.time_placed = '2022-11-30 22:13:04'
new_comment.user_id = 3
new_comment.peep_id = 2

repo.create(new_comment)

comments = repo.find_by_peep(2)

expect(comments.length).to eq(2)
expect(comments.first.content).to eq('wow amazing')
expect(comments.last.content).to eq('New comment / reply')
```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
def reset_tables
  seed_sql = File.read('spec/chitter_test_db.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe CommentRepository do
  before(:each) do 
    reset_students_table
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._