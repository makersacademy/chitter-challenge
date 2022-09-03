# {{items}} Model and Repository Classes Design Recipe

## 1. Design and create the Table

```sql
-- (file: design/tables.sql)
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  timestamp text,
  name text,
  username text
);
```

## 2. Create Test SQL seeds

```sql
-- (file: spec/seeds_items_orders.sql)

TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps (content, timestamp, name, username)
  VALUES ('It is awfully hot today', '2022-08-12 21:55:12.940137 +0100', 'Daffy Duck', '@daffy');
INSERT INTO peeps (content, timestamp, name, username)
  VALUES ('Nice weather for ducks', '2022-08-12 21:56:54.385627 +0100 ', 'Donald Duck', '@donald');
```

```bash
psql -h 127.0.0.1 chitter_test < spec/seeds.sql
```

## 3. Define the class names

```ruby
# Table name: peeps

# Model class

# No Model class needed

# Repository class
# (in lib/peep_repo.rb)
class PeepRepository
end
```

## 4. Implement the Model class

It would be this:
```ruby
class Peep
  attr_accessor :id, :content, :timestamp, :name, :username
end
```
But this is considered bad practice. This design will receive peep data as a hash directly into the UserRepository

## 5. Define the Repository Class interface

```ruby
# Table name: peeps

# Repository class
# (in lib/peep_repo.rb)

class PeepRepository
  def create(peep)
    # sql = 'INSERT INTO peeps (content, timestamp, name, username)
    #   VALUES ($1, $2, $3, $4);'
  end

  def view_all
    # sql = 'SELECT * FROM peeps;'
  end
end
```

## 6. Test Examples

```ruby
#1 View peeps
repo = PeepRepository.new
peeps = repo.view_all
peeps.ntuples # => 2

peeps[0]['id'] # => '1'
peeps[0]['content'] # => 'It is awfully hot today'
peeps[0]['timestamp'] # => '2022-08-12 21:55:12.940137 +0100'
peeps[0]['name'] # => 'Daffy Duck'
peeps[0]['username'] # => '@daffy'

peeps[1]['id'] # => '2'
peeps[1]['content'] # => 'Nice weather for ducks'
peeps[1]['timestamp'] # => '2022-08-12 21:56:54.385627 +0100'
peeps[1]['name'] # => 'Donald Duck'
peeps[1]['username'] # => '@donald'


#2 Find non-existent user
repo = UserRepository.new
repo.find_by_email('ducks@makers.com') # => fail "user not found"

#3 Create a user account
encrypted = BCrypt::Password.create('rubbish')
new_user = {email: 'billy@silly.com', password: encrypted}
repo = UserRepository.new
repo.create(new_user)
billy = repo.find_by_email('billy@silly.com')
billy['id'] # => '2'
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

#6 Sign a user in 
new_user = { email: 'billy@silly.com', password: 'rubbish' }
repo = UserRepository.new
repo.create(new_user)
result = repo.sign_in(new_user[:email], 'rubbish')
result2 = repo.sign_in(new_user[:email], 'wrong_password')
result # => true
result2 # => false

#7 No password
new_user = { email: 'billy@silly.com', password: 'rubbish' }
repo = UserRepository.new
repo.create(new_user)
result = repo.sign_in(new_user[:email], '')
result # => false

#8 Blank email
new_user = { email: 'billy@silly.com', password: 'rubbish' }
repo = UserRepository.new
repo.create(new_user)
repo.sign_in('', 'rubbish') # => fail "user not found"

#9 Create a peep
new_peep = {
  content: 'Dogs chase squirrels',
  name: 'Suzy Sheep',
  username: '@suzy'
}

fake_time = double :time
expect(fake_time).to receive(:now).and_return('2022-08-13 08:20:25 +0100')

repo = PeepRepository.new(time = fake_time)
repo.create(new_peep)

peeps = repo.view_all
peeps.ntuples # => 3

peeps[2]['id'] # => '3'
peeps[2]['content'] # => 'Dogs chase squirrels'
peeps[2]['timestamp'] # => '2022-08-13 08:20:25 +0100'
peeps[2]['name'] # => 'Suzy Sheep'
peeps[2]['username'] # => '@suzy'

#10 User tries to input time
new_peep = {
  content: 'Dogs chase squirrels',
  time: '2022-08-13 08:45:27',
  name: 'Suzy Sheep',
  username: '@suzy'
}

repo = PeepRepository.new
repo.create(new_peep) # => fail "new peep has wrong key, value pairs"

#11 Mis-labelled peep key
new_peep = {
  contents: 'Dogs chase squirrels',
  name: 'Suzy Sheep',
  username: '@suzy'
}

repo = PeepRepository.new
repo.create(new_peep) # => fail "invalid peep submitted"

#12 Blank or nil in a peep key
new_peep = {
  content: nil,
  name: '',
  username: '@suzy'
}

repo = PeepRepository.new
repo.create(new_peep) fail # => "invalid peep submitted"

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
