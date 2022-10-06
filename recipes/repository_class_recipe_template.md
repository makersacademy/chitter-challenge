# USERS & PEEPS Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](./single_table_design_recipe_template.md).

*In this template, we'll use an example table `students`*

```

```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql

TRUNCATE users, peeps RESTART IDENTITY;

INSERT INTO users (first_name, last_name, username, email, password) VALUES ('Benedict', 'Smith', 'bennyboy', 'ben@gmail.com', '123bento');
INSERT INTO users (first_name, last_name, username, email, password) VALUES ('Kylie', 'Jenner', 'kyliejenner', 'kjen@hotmail.com', 'ih8kimbo');
INSERT INTO users (first_name, last_name, username, email, password) VALUES ('Elon', 'Musk', 'elonmusk', 'no1@tesla.com', 'ihrtte5la');
INSERT INTO users (first_name, last_name, username, email, password) VALUES ('Rihanna', 'Fenty', 'rihanna', 'badgyal@gmail.com', 'b@dgyalrh1');
INSERT INTO users (first_name, last_name, username, email, password) VALUES ('Joe', 'Bloggs', 'ragedad', 'angryboi@aol.com', 'n0th@ppy');
INSERT INTO users (first_name, last_name, username, email, password) VALUES ('Karen', 'Finance', 'canispeaktothemanager', 'excuseme@manager.com', 'c0mplain3r');


INSERT INTO peeps (content, time, user_id) VALUES ('First peep babeh!', '2009-01-17 12:23', '3');
INSERT INTO peeps (content, time, user_id) VALUES ('Just started at makers', '2022-09-12 09:15', '1');
INSERT INTO peeps (content, time, user_id) VALUES ('Watch our new series on hulu', '2022-10-06 14:00', '2');
INSERT INTO peeps (content, time, user_id) VALUES ('@elonmusk I dont like you', '2022-10-01 12:20', '5');
INSERT INTO peeps (content, time, user_id) VALUES ('@tesco, I want a refund', '2022-10-06 14:01', '6');
INSERT INTO peeps (content, time, user_id) VALUES ('@aldi I want a refund', '2022-10-06 14:02', '6');
INSERT INTO peeps (content, time, user_id) VALUES ('@sainsburys I want a refund', '2022-10-06 14:03', '6');
INSERT INTO peeps (content, time, user_id) VALUES ('@bennboy any advice on stocks?', '2021-01-01 00:01', '3');
INSERT INTO peeps (content, time, user_id) VALUES ('@elonmusk no', '2021-01-02 12:05', '1');
INSERT INTO peeps (content, time, user_id) VALUES ('Does anyone know how to code?', '2022-05-30 12:01', '1');
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
# EXAMPLE
# Table name: users

# Model class
# (in lib/user.rb)
class User
end

# Repository class
# (in lib/user_repository.rb)
class UserRepository
end


# EXAMPLE
# Table name: peeps

# Model class
# (in lib/peep.rb)
class Peep
end

# Repository class
# (in lib/user_repository.rb)
class PeepRepository
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

  # Replace the attributes by your own columns.
  attr_accessor :id, :first_name, :last_name, :username, :email, :password
end

class Peep

  # Replace the attributes by your own columns.
  attr_accessor :id, :content, :time, :user_id
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
# Table name: users

# Repository class
# (in lib/user_repository.rb)

class PeepRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, content, time, user_id FROM peeps;

    # Returns an array of Peep objects.
  end

  # inserts a new record
  # takes a Peep object in argument
  def create(peep)
  #Executes the SQL query:
  # INSERT INTO items (content, time, user_id), VALUES ($1, $2, $3)
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  # def find(id)
  #   # Executes the SQL query:
  #   # SELECT id, name, cohort_name FROM students WHERE id = $1;

  #   # Returns a single Student object.
  # end

  # Add more methods below for each operation you'd like to implement.

  # def delete(student)
  # end
end


class UserRepository

  # Selecting all records
  # No arguments
  # def all
  #   # Executes the SQL query:
  #   # SELECT id, first_name, last_name, username, email, password FROM users;

  #   # Returns an array of User objects.
  # end

  # inserts a new record
  # takes a Peep object in argument
  def create(user)
  #Executes the SQL query:
  # INSERT INTO items (first_name, last_name, username, email, password), VALUES ($1, $2, $3)
  end

  # Gets a single record by its ID
  # One argument: the id (number)
#   def find(username)
#     # Executes the SQL query:
#     # SELECT id, first_name, last_name, username, email, password FROM users WHERE username = $1;

#     # Returns a single Student object.
#   end


#     def delete(artist)
#      # Executes the SQL query:
#     # DELETE FROM artists WHERE id = $1;

#     # returns nothing (just deletes teh record)
#     end

# #updates an artist's record
# # takes an Artist object (with the updated fields)
#   def update(artist)
#      # Executes the SQL query:
#     # UPDATE artists SET name = $1, genre = $2 WHERE id = $3;

#     # return nothing (just amend the record)
#   end

# # insert a new album record
#     def create(alb)
#    # Executes the SQL query:
#     # INSERT INTO (title, release_year, artist_id) VALUES($1, $2, $3)
#     # doesn't need to return anything (just creates the record)
#   end
# # deletes an artist's record
# # given its id


# # select artist record with associated album records
#   def find_with_albums(id)
#     # SELECT aritsts.id AS 'id' , artists.name AS 'name', artists.genre AS 'genre' FROM artists, albums.id AS 'album_id' ialbums.title AS 'title', albums.release_year AS 'year'
#     # JOIN albums ON albums.artist_id = artists.id
#     # WHERE artists.id = $1;

# # returns an Artist object
# # with an array of Album objects
#   end
# end
end

```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES

# 1
# Get all peeps - 1st record

repo = PeepRepository.new

peeps = repo.all

peeps.length # =>  10

peeps.first.id # =>  '1'
peeps.first.content # =>  'First peep babeh!'
peeps.first.time # =>  '2009-01-17 12:23'
peeps.first.user_id # => '3'

# Get all peeps - check multiple records
repo = PeepRepository.new

peeps = repo.all

peeps.length # =>  10

peeps.[4].id # =>  '5'
peeps.[4].content # =>  '@tesco, I want a refund'
peeps.[4].time # =>  '2022-10-06 14:01'
peeps.[4].user_id # => '6'

# 2
# Create a new peep

repo = PeepRepository.new
peep = Peep.new
peep.content = 'Testing 123'
peep.time = # fake time
peep.user_id = 1

repo.create(peep) # =>

all_peeps = repo.all
last_peep = all_peeps.last
last_peep.content #=> 'Testing 123'
last_peep.time #=> # fake time
last_peep.user_id #=> 1
```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/peep_repository_spec.rb

def reset_peeps_table
  seed_sql = File.read('schema/chitter_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_peeps_table
  end
end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._