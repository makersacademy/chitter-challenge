# {{TABLE NAME}} Model and Repository Classes Design Recipe

## 1. Design and create the Table
```
Table: peeps

Columns:
id | content | timestamp | name | username
```

## 2. Create Test SQL seeds

```sql
-- (file: spec/test_seeds.sql)

TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps (content, timestamp, name, username, user_id) VALUES ('Now I know how lobsters feel :-(', '2022-13-08 12:00:00', 'Alex', 'iloveanimals123', '1');
INSERT INTO peeps (content, timestamp, name, username, user_id) VALUES ('Just call me the man with a fan! LOL', '2022-13-08 13:00:00', 'Zeus', 'technoraver99', '2');
```

## 3. Define the class names

```ruby

Model class
in lib/peep.rb)
class Peep
end

Repository class
in lib/peep_repository.rb)
class PeepRepository
end
```

## 4. Implement the Model class

```ruby

Model class
in lib/peep.rb)

class Peep
  attr_accessor :id, :content, :timestamp, :name, :username, :user_id
end
```

## 5. Define the Repository Class interface

```ruby

class PeepRepository

  # Shows all peeps
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT * FROM peeps;

    # Returns an array of Peep objects.
  end

  # Post new peep
  # Takes a peep object as argument
  def create(peep)
    # Executes the SQL query:
    # INSERT INTO peeps (content, timestamp, name, username, user_id) VALUES ($1, $2, $3, $4, $5);'

    # Doesn't return anything
  end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES

# 1.
# Shows all peeps

repo = UserRepository.new
peeps = repo.all

expect(peeps.length).to eq(2)

expect(peeps.first.content).to eq('Now I know how lobsters feel :-(')
expect(peeps.first.timestamp).to eq('2022-13-08 12:00:00')
expect(peeps.first.name).to eq('Alex')
expect(peeps.first.username).to eq('iloveanimals123')

expect(peeps.last.content).to eq('Just call me the man with a fan! LOL')
expect(peeps.last.name).to eq('Zeus')
expect(peeps.last.timestamp).to eq('2022-13-08 13:00:00')
expect(peeps.last.username).to eq('habanerohotstuff')

# 2.
# Create a new peep

repo = UserRepository.new
new_peep = Peep.new

new_peep.content = 'Send help. Melting.'
new_peep.timestamp = '2022-13-08 14:00:00'
new_peep.name = 'Fleur'
new_peep.username = 'itsfleurduh'

repo.create(new_peep)

peeps = repo.all
newest_peep = peeps.first

expect(newest_peep.content).to eq 'Send help. Melting.'
expect(newest_peep.email).to eq '2022-13-08 14:00:00'
expect(newest_peep.username).to eq 'Fleur'
expect(newest_peep.password).to eq 'itsfleurduh'
```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/peep_repository_spec.rb

def reset_students_table
  seed_sql = File.read('spec/test_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter' })
  connection.exec(seed_sql)
end

describe StudentRepository do
  before(:each) do 
    reset_peeps_table
  end
```

## 8. Test-drive and implement the Repository class behaviour

