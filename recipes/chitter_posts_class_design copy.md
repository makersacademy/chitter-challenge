# Users Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](./single_table_design_recipe_template.md).

*In this template, we'll use an example table `students`*

```
# EXAMPLE

Table: students

Columns:
id | name | cohort_name
```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- EXAMPLE
-- (file: spec/seeds_{table_name}.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE posts RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO posts (content, date_time_created, user_id) VALUES
('Have you guys seen the new Marvel movie?', '2022-08-12 16:47:00', 1),
('Where are my tacos', '2022-08-12 20:15:20', 3),
('I love cricket', '2022-08-11 18:16:04', 2),
('Anyone out there?', '2022-08-12 07:40:03', 4)


;


```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
class Users < Struct.new(name, username, email, password)
  attr_accessor :id

  def self.all
    # returns an array of all users
    # SQL :
    # SELECT * FROM users;
  end

  def self.find(id)
    # returns a user record with matching id
    # SQL:
    # SELECT * FROM users WHERE id = $1;
  end

  def self.create(user)
    # inserts a new record into the users table
    # SQL:
    # INSERT INTO users (name, username, email, password) VALUES ($1, $2, $3, $4);
  end

  def self.find_by_username(username)
    # returns a user record with matching username
    # SQL:
    # SELECT * FROM users WHERE username = $1;
  end

  def self.find_by_email(email)
    # returns a user record with matching email
    # SQL:
    # SELECT * FROM users WHERE email = $1;
  end
end

```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES

# Get all users

users = Users.all
users.length # => 4
users[0].id # => '1'
users[0].name # => 'John Isaac'
users[0].username # => 'JI2022'
users[0].email # => 'john@hotmail.com'
users[0].password # => 'password123'

# find a user

user = Users.find(2)
user.id # => '2'
user.name # => 'Daniel Roma'
user.username # => 'BeatTheHeat'
user.email # => 'danny@gmail.com'
user.password # => 'admin'

# create a user

new_user = Users.new('Zac Moss', 'zacmosshk', 'email@email.com', 'password456')
users = Users.all
users.length # => 5
users[4].id # => '5'
users[4].name # => 'Zac Moss'
users[4].username # => 'zacmosshk'
users[4].email # => 'email@email.com'
users[4].password # => 'password456'

# find user by username

user = Users.find_by_username('FunkyB')
user.id # => '3'
user.name # => 'Marky Mark'
user.username # => 'FunkyB'
user.email # => 'marky@yahoo.com'
user.password # => 'goodvibes'

# find user by email

user = Users.find_by_email('yoda@starwars.com')
user.id # => '4'
user.name # => 'Baby Yoda'
user.username # => 'mandoDisneyLover'
user.email # => 'yoda@starwars.com'
user.password # => 'jediking'

```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/student_repository_spec.rb

def reset_students_table
  seed_sql = File.read('spec/seeds_students.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'students' })
  connection.exec(seed_sql)
end

describe StudentRepository do
  before(:each) do 
    reset_students_table
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->