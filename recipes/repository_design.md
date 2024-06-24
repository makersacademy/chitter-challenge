# Users Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](./single_table_design_recipe_template.md).

*In this template, we'll use an example table `students`*

```
# EXAMPLE

Table: users

Columns:
id | name | username | email| password
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

TRUNCATE TABLE users RESTART IDENTITY CASCADE;

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (name, username, email, password) VALUES
('John Smith', 'JS', 'js@gmail.com', 'passwordJS'),
('Nikki Wong', 'NickNack', 'nicknack@gmail.com', 'password2'),
('Liam Banks', 'Liam', 'liambanks@gmail.com', 'password3');
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 your_database_name < seeds_recipes.sql
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
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# EXAMPLE
# Table name: recipes

# Model class
# (in lib/recipe.rb)

class Recipe

  require 'bcrypt'

class User
  attr_accessor :id, :name, :username, :email, :password

  # users.password_hash in the database is a :string
  include BCrypt

end

# The keyword attr_accessor is a special Ruby feature
# which allows us to set and get attributes on an object,
# here's an example:
#
# recipe = Recipe.new
# recipe.name = 'Baked Potato'
# recipe.name
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

class UserRepository

    def all
    end

    def create(user)

    end

    def find(id)
    end

    def find_with_peeps(id)
    end

    def login(email, password)
    end

    def signup(*)
    end

    def logout
    end
end 
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES

# 1
# Gets all users

      it 'finds all users' do
        repo = UserRepository.new
      
        users = repo.all
          
        expect(users.length).to eq(3)
        expect(users.first.name).to eq('John Smith')
      end 

# 2
# Get a single user
    it 'finds user 1' do
        repo = UserRepository.new

        user = repo.find(1)

        expect(user.name).to eq('John Smith')
        expect(user.username).to eq('JS')
      end

# 3
# Get user 1 with all their peeps
     it 'finds user 1 with peeps' do
        repo = UserRepository.new
        user_with_peeps = repo.find_with_peeps(1)

        peep = double :post, id: 1, peep: 'Hello World', time: '2023-01-08 10:30:00'

        expect(peep.id).to eq(1)
        expect(peep.time).to eq('2023-01-08 10:30:00')
      end

# 4
# Creates a new user
 it 'creates a new user' do
        repo = UserRepository.new
    
        new_user = User.new
        new_user.name = 'Penny Lane'
        new_user.username = 'PLane'
        new_user.email = 'pl@gmail.com'
        new_user.password = 'password4'
        repo.create(new_user)
        
        users = repo.all

        expect(users.length).to eq(4)
        expect(users.last.name).to eq('Penny Lane')
      end

# 5
# Logs user in if their email and password are correct
     it 'returns true if details are correct' do
        repo = UserRepository.new
        
        users = repo.all
        user = users.login('js@gmail.com', 'passwordJS')

        expect(user.email).to eq true
        expect(user.password).to eq true

      end


Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/recipe_repository_spec.rb

def reset_recipes_table
  seed_sql = File.read('spec/seeds_recipes.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
  connection.exec(seed_sql)
end

describe RecipeRepository do
  before(:each) do 
    reset_recipes_table
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