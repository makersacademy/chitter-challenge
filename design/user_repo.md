# {{items}} Model and Repository Classes Design Recipe

## 1. Design and create the Table

```sql
-- (file: design/tables.sql)
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text UNIQUE,
  password text,
  name text,
  username text UNIQUE
);
```

## 2. Create Test SQL seeds

```sql
-- (file: spec/seeds_items_orders.sql)

TRUNCATE TABLE users RESTART IDENTITY;

INSERT INTO users (email, password) VALUES ('duck@makers.com', 'quack!');
INSERT INTO users (email, password)
  VALUES ('duck2@makers.com', '$2a$12$qmO3XbZHMXhymqZBstr48O0rW8ubyqAITgm9T.cIoQrk0CMEEfECm');

```

```bash
psql -h 127.0.0.1 chitter_test < spec/seeds.sql
```

## 3. Define the class names

```ruby
# Table name: users

# Model class not necessary

# Repository class
# (in lib/user_repo.rb)
class UserRepository
end
```

## 4. Implement the Model class

It would be this:
```ruby
class User
  attr_accessor :id, :email, :password, :name, :username
end
```
But this is considered bad practice. We will receive user data as a hash directly into the UserRepository

## 5. Define the Repository Class interface

```ruby
# Table name: users

# Repository class
# (in lib/user_repo.rb)

class UserRepository
  def create(new_user)
      encrypted_password = BCrypt::Password.create(new_user.password)

      sql = '
        INSERT INTO users (email, password)
          VALUES($1, $2);
      '
      sql_params = [
        new_user.email,
        encrypted_password
      ]
    end

  def sign_in(email, submitted_password)
    user = find_by_email(email)

    return nil if user.nil?

    my_password = BCrypt::Password.new(user['password'])

    if my_password == submitted_password
      # login success
    else
      # wrong password
    end
  end

  def find_by_email(email)
    # sql = 'SELECT * FROM users WHERE email = $1;'
  end
end
```

## 6. Test Examples

```ruby
#1 Find existing user
repo = UserRepository.new
user = repo.create(new_user)
saved_user = repo.find_by_email('duck@makers.com')
saved_user.id # => '1'
saved_user.email # => 'duck@makers.com'
saved_user.password # => 'quack!'

#2 Find non-existent user
repo = UserRepository.new
repo.find_by_email('ducks@makers.com') # => fail "user not found"

#3 Create a user account
encrypted = BCrypt::Password.create('rubbish')
new_user = {email: 'billy@silly.com', password: encrypted}
repo = UserRepository.new
repo.create(new_user)
billy = repo.find_by_email('billy@silly.com')
billy['id'] # => '3'
billy['email'] # => 'billy@silly.com'
billy['password'] # => encrypted

#4 no email
new_user = { password: '' }
b_crypt = double :bcrypt
repo = UserRepository.new(b_crypt)
repo.create(new_user) # => fail "no email"

#5 no password
new_user = { email: 'billy@silly.com', password: '' }
b_crypt = double :bcrypt
repo = UserRepository.new(b_crypt)
repo.create(new_user) # => fail "no password"

#6 duplicate email or username
new_user = { email: 'duck@makers.com', password: 'swim_1' }
b_crypt = double :bcrypt
expect(b_crypt).to receive(:create).with('swim_1').and_return('gobbledy_gook')
repo = UserRepository.new(b_crypt)
# This is bad but I can't work out what the exact error message string should be!
repo.create(new_user) # => fail PG::UniqueViolation

#7 Sign a user in 
new_user = { email: 'billy@silly.com', password: 'rubbish' }
repo = UserRepository.new
repo.create(new_user)
result = repo.sign_in(new_user[:email], 'rubbish')
result2 = repo.sign_in(new_user[:email], 'wrong_password')
result # => true
result2 # => false

#8 No password
new_user = { email: 'billy@silly.com', password: 'rubbish' }
repo = UserRepository.new
repo.create(new_user)
result = repo.sign_in(new_user[:email], '')
result # => false

#9 Blank email
new_user = { email: 'billy@silly.com', password: 'rubbish' }
repo = UserRepository.new
repo.create(new_user)
repo.sign_in('', 'rubbish') # => fail "user not found"

```

## 7. Reload the SQL seeds before each test run

```ruby

# file: spec/user_repo_spec.rb

def reset_tables
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe ItemRepository do
  before(:each) do 
    reset_tables
  end

  # (tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_Follow the test-driving process of red, green, refactor to implement the behaviour._
