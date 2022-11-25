# USERS Model and Repository Classes Design Recipe

## 1. Design and create the Table


```

Table: USERS

| Record                | Properties          |
| --------------------- | ------------------  |
| users                 | id, username, email, password
| posts                   id, date_created, content, user_id


```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql

TRUNCATE TABLE users, posts  RESTART IDENTITY;

INSERT INTO users (username, email, password) VALUES 
('micheal23', 'micheal_james@gmail.com', "123456"),
('fred23', 'fred-manu@gmail.com', "ilovemymom456"),
('james-lewis', 'james-lewis333@gmail.com', "summin-summin!2323"),
('big-l', 'liam2@yahoo.com', "Rafaf22");
INSERT INTO posts (content, date_created, user_id) VALUES 
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
psql -h 127.0.0.1 chitter_test < seeds_users_posts.sql
```

## 3. Define the class names

```ruby
# EXAMPLE

# Model class
# (in lib/user.rb)
class User
end

# Repository class
# (in lib/users_Repository.rb)
class UsersRepository
end
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# EXAMPLE
# Table name: users

# Model class
# (in lib/user.rb)

class User
  attr_accessor :id, :username, :email, :password
end

```

*You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.*

## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
# EXAMPLE
# Table name: users

# Repository class
# (in lib/Users_Repository.rb)

class UsersRepository

  def all

  end

  def find(id)
    
  end

  def create(user)
  end

  def update(user)
  end

  def delete(user)
  end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES

# 1
# Get all users

repo = UsersRepository.new

users = repo.all

users.length # =>  2

users[0].id # =>  1
users[0].username # =>  'David'
users[0].email # =>  330
users[0].password #=> 4

users[1].id # =>  2
users[1].username # =>  'Anna'
users[1].email # =>  330
users[1].password #=> 5

# 2
# Get a single user

repo = UsersRepository.new

users = repo.find(1)

users.id # =>  1
users.username # =>  'David'
users.email # =>  "23"
users.password # =>  "3"

# 3
# create a single order 
repo = UsersRepository.new
user = user.new
user.id # => "??"
user.username # =>  'rings_new'
user.email # =>  34
user.password # =>  6

repo.create(user)
users = repo.all


users[2].id # => "3"
users[2].username # =>  'rings_new'
users[2].email # =>  34
users[2].password # =>  6

#4
# update an user
repo = UsersRepository.new
user = repo.find(1)

user.username # =>  'rubies_new'
repo.update(user)

users = repo.all


users[2].id # => "1"
users[2].username # =>  'rubies_new'
users[2].email # => 800
users[2].password # => 19

#5
# delete an user
repo = UsersRepository.new
user = repo.find(1)

repo.delete(user)

users = repo.all
users.length #=> 1

```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run


```ruby
# EXAMPLE

# file: spec/users_Repository_spec.rb

def reset_users_users_table
  seed_sql = File.read('spec/seeds_users_users.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'shop_manager_test' })
  connection.exec(seed_sql)
end

describe usersRepository do
  before(:each) do 
    reset_users_users_table
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour
