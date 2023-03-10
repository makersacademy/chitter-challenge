# Peeps Model and Repository Classes Design Recipe


## 1. Test SQL seeds

```sql
-- (file: spec/seeds_peeps.sql)

TRUNCATE TABLE peeps RESTART IDENTITY; 

INSERT INTO peeps (content, timestamp, user_id)
VALUES ('Just had the best burger ever!', '2022-09-01 12:30:00', 1),
('Can''t wait for the weekend!', '2022-09-02 16:45:00', 2),
('Excited to start my new job!', '2022-09-03 09:00:00', 3),
('Watching the game with friends tonight', '2022-09-04 20:15:00', 1),
('Trying out a new recipe for dinner', '2022-09-05 18:00:00', 2),
('Just finished a great workout', '2022-09-06 07:30:00', 3);
```

```bash
psql -h 127.0.0.1 chitter_test < seeds_peeps.sql
```

## 2. Class names


```ruby
# Table name: peeps

# Model class
# (in lib/peep.rb)
class Peep
end

# Repository class
# (in lib/peep_repository.rb)
class PeepRepository
end
```

## 3. Model class

```ruby
# Table name: peeps

# Model class
# (in lib/peep.rb)

class Peep
  attr_accessor :id, :content, :timestamp, :user_id
end

```

## 4. Repository Class interface

```ruby
# EXAMPLE
# Table name: peeps

# Repository class
# (in lib/peep_repository.rb)

class PeepRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, content, timestamp, user_id FROM peeps;

    # Returns an array of Peep objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT * FROM peeps WHERE id = $1;

    # Returns a single Peep object.
  end

  def find_by_user_id(user_id)
    # Executes the SQL query:
    # SELECT * FROM peeps WHERE user_id = $1;

    # Returns an array of Peep objects associated to a user.
  end
  # Add more methods below for each operation you'd like to implement.

  def post(peep)
    # Executes the SQL query:
    # INSERT INTO peeps (content, timestamp, user_id) VALUES ($1, $2, $3)
  end

  def delete(peep) # peep is a instance of Peep class
    # Executes the SQL query:
    # DELETE FROM peeps WHERE id = $1 
  end
end
```

## 5. Test Examples

```ruby
# 1
# Get all peeps

repo = PeepRepository.new

peeps = repo.all

peeps.length # =>  6

peeps[0].id # =>  1
peeps[0].content # =>  'Just had the best burger ever!'
peeps[0].timestamp # =>  '2022-09-01 12:30:00',
peeps[0].user_id # =>  1

peeps[1].id # =>  1
peeps[1].content # =>  'Can''t wait for the weekend!' 
peeps[1].timestamp # => '2022-09-02 16:45:00'
peeps[1].user_id # =>  2

# 2
# Get a single peep

repo = PeepRepository.new

peep = repo.find(1)

peep.id # =>  1
peep.content # =>  'Just had the best burger ever!'
peep.timestamp # =>  '2022-09-01 12:30:00',
peep.user_id # =>  1

# 3
# gets all peeps by a user 
repo = PeepRepository.new

user_peeps = repo.find_by_user_id(1)
      
user_peeps[0].id # => 1
user_peeps[0].content # => 'Just had the best burger ever!'
user_peeps[0].timestamp # => '2022-09-01 12:30:00'
user_peeps[0].user_id # => 1

user_peeps[1].id # => 4
user_peeps[1].content # => 'Watching the game with friends tonight'
user_peeps[1].timestamp # => '2022-09-04 20:15:00'
user_peeps[1].user_id # => 1

# 4
# post a new peep
repo = PeepRepository.new

peep = Peep.new
peep.id = 7
peep.content = "content"
peep.timestamp = "2023-11-03 19:35:00"
peep.user_id = 3

repo.post(peep)
repo.find(7) # => peep

# 5 
# delete a peep 
repo = PeepRepository.new

peep = Peep.new
peep.id = 7
peep.content = "content"
peep.timestamp = "2023-11-03 19:35:00"
peep.user_id = 3

repo.post(peep)
repo.all.length # => 7

repo.delete(peep)
repo.all.length # => 6

```



## 7. Reload the SQL seeds before each test run

```ruby
# file: spec/peep_repository_spec.rb

def reset_peeps_table
  seed_sql = File.read('spec/seeds_peeps.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_peeps_table
  end
end
```
