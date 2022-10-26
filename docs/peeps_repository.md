# Peeps Model and Repository Classes Design Recipe

## Class names

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

## The Model class

```ruby
# Table name: peeps

# Model class
# (in lib/peeps.rb)

class Peep
  attr_accessor :id, :content, :creation_time, :link_to, :user_id
end
```

## The Repository Class interface

```ruby
# Table name: peeps

# Repository class
# (in lib/peep_repository.rb)

class PeepRepository
  
  # Create a Peep object from SQL record
  def peep_from_record(record)
    # Returns a Peep object
  end
  
  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT * FROM peeps;

    # Returns an array of Peep objects.
  end
  
  # Selecting all records in reverse chronological order
  # No arguments
  def all_reverse_chron
    # Executes the SQL query:
    # SELECT * FROM peeps ORDER BY creation_time DESC;
  
    # Returns an array of Peep objects.
  end

  # Gets a single peep by its ID
  # One argument: the id
  def find_by_id(id)
    # Executes the SQL query:
    # SELECT * FROM peeps WHERE id = $1;

    # Returns a single Peep object.
  end
  
  # Gets all the peeps from one user
  # One argument: the user_id
  def find_by_user(user_id)
    # Executes the SQL query:
    # SELECT * FROM peeps WHERE user_id = $1;
    
    # Returns an array of Peep objects
  end

  # Creates a new peep record in the database
  # One argument: peep object
  def create(user)
    # Executes the SQL query:
    # INSERT INTO peeps (content, creation_time, link_to, user_id)
    # VALUES ($1, $2, $3, $4)
    
    # Returns nothing
  end
  
  # Gets a peep and all the replies
  # One argument: peep_id
  def find_thread(id)
    # Executes the SQL query:
    # SELECT * FROM peeps WHERE link_to = $1 ORDER BY creation_time
    
    # Returns an array of Peep objects including the original one
end
```

## Reload the SQL seeds before each test run

```ruby
# file: spec/user_repository_spec.rb

def reset_tables
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_development' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_tables
  end

end
```
