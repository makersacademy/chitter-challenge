# User - Model and Repository Classes Design Recipe

## 1. Design and create the Table
```sql
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email text,
  password text
);
```
## 2. Create Test SQL seeds
```sql

TRUNCATE TABLE users, posts RESTART IDENTITY;

INSERT INTO users (name, username, email, password) VALUES ('Moe', 'moeez', 'moeez@gmail.com', 'strong123');
INSERT INTO users (name, username, email, password) VALUES ('Joe', 'joeez', 'joeez@gmail.com', 'weak123');
INSERT INTO users (name, username, email, password) VALUES ('Foe', 'foeez', 'foeez@gmail.com', 'wicked123');


INSERT INTO posts (message, timestamp, user_id) VALUES ('first message', '2022-03-01 12:00:00', 1);
INSERT INTO posts (message, timestamp, user_id) VALUES ('second message', '2022-12-04 12:00:00', 2);
INSERT INTO posts (message, timestamp, user_id) VALUES ('third message', '2022-10-06 12:00:00', 3);

```
## 3. Define the class names
```ruby
# Table name: users

# Model class
class User
end

# Repository class
class UserRepository
end
```

## 4. Implement the Model class
```ruby
# Model class
class User
  attr_accessor :id, :name, :username, :email, :password
end
```
## 5. Define the Repository Class interface
```ruby
# Repository class
class UserRepository

  # selects all records
  def all
    # SELECT * FROM users;
  end

  # returns a single record
  def find(id)
    # SELECT * FROM users WHERE id = $1;
  end

  # Adds a new user
  def create(user)
    # INSERT INTO users (name, username, email) VALUES ($1, $2, $3);
  end

  # Updates the username
  def update_username(id, username)
    # UPDATE users SET username = $3 WHERE id = $1;
  end

  # Removes a record from users
  def delete(username)
    # DELETE FROM users WHERE username = $1;
  end
end
```

## 6. Write Test Examples

```ruby
# 1. Get all users
repo = UserRepository.new

users = repo.all

users.length # =>  3

users[0].id # =>  1
users[0].name # =>  'Moe'
users[0].username # =>  'moeee'
users[0].email # =>  'moeee@gmail.com'

users[1].id # =>  2
users[1].name # =>  'Row'
users[1].username # =>  'toeeez'
users[1].email # =>  'toeeez@email.com'

users[2].id # =>  3
users[2].name # =>  'Cow'
users[2].username # =>  'coweez'
users[2].email # =>  'coweez@email.com'

# 2. Get a single user by id
repo = UserRepository.new

user = repo.find(1)

user.id # =>  1
user.name # =>  'Moe'
user.username # =>  'moeee'
user.email # =>  'moeee@gmail.com'

# 3. Adds new record to the 'users' table
repo = UserRepository.new

new_user = User.new
new_user.name = 'Penaldo'
new_user.username = 'pens'
new_user.email = 'penaldo@gmail.com'
repo.create(new_user)

users = repo.all

users.length # =>  4
users.last.username # =>  'pens'
users.last.email # =>  'penaldo@gmail.com'


# 4. Get a single user by username
repo = UserRepository.new

user = repo.find_by_username('toeez')

users[1].id # =>  2
users[1].name # =>  'Row'
users[1].username # =>  'toeez'
users[1].email # =>  'toeeez@email.com'

# 5. updates a username
repo = UserRepository.new
repo.update_username(2, 'toeer')

users = repo.all
users[1].id # =>  '2'
users[1].name # =>  'Row'
users[1].username # =>  'toeer'
users[1].email # =>  'toeeez@email.com'

# 6. deletes a user
repo = UserRepository.new

repo.delete(1)
users = repo.all

users.length # =>  2
users.first.id # =>  2

```
## 7. Reload the SQL seeds before each test run
```ruby
# EXAMPLE
def reset_users_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_testing' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end
end
```
## 7. Test-drive and implement the Repository class behaviour
```
Follow the test-driving process of red, green, refactor to implement the behaviour.

```