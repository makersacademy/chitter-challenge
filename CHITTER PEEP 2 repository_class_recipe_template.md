# {{TABLE NAME}} Model and Repository Classes Design Recipe

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

TRUNCATE TABLE items, orders RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO items (item_name, unit_price, quantity) VALUES ('Fanta', 1, 300);
INSERT INTO items (item_name, unit_price, quantity) VALUES ('Coke', 2, 400);
INSERT INTO orders (customer_name, item_name, order_date, item_id) VALUES ('Brenda','Fanta', 2023-01-01, 1);
INSERT INTO orders (customer_name, item_name, order_date, item_id) VALUES ('Keith', 'Coke', 2022-12-31, 2);

```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby

class Peep
end

# Repository class
# (in lib/student_repository.rb)
class PeepRepository
end
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# EXAMPLE
# Table name: students

# Model class
# (in lib/student.rb)



class Peep
attr_accessor :id, :peep_content, :peep_date, :user_id
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
# Table name: items

# Repository class
# (in lib/item_repository.rb)


# Repository class
# (in lib/student_repository.rb)
class PeepRepository
end
  
  def all
    # Executes the SQL query:
    # SELECT * FROM peeps;
    # Returns an array of Peep objects.
  end

  def find(id)
    # Executes the SQL query:
    # SELECT * FROM peeps WHERE id = $1;
  end
  
  def create(peep)
   # INSERT INTO users (peep_content, peep_date, user_id) VALUES ($1, $2, $3, $4);'
  end

  def delete(peep)
  # DELETE FROM peeps WHERE id = $1; 
  end

end

```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES

# 1
# Get all items

repo = ItemsRepository.new
current_items = repo.all

current_items.length # =>  2

current_items[0].item_name # => 'Fanta'
current_items[0].unit_price # => 1
current_items[0].quantity # =>  300

current_items[1].item_name # => 'Coke'
current_items[1].unit_price # =>  2
current_items[1].quantity # => 400


# 2
# Get a single item

repo = ItemRepository.new

current_items = repo.find(1)

current_items[0].item_name # => 'Fanta'
current_items[0].unit_price # => 1
current_items[0].quantity # =>  300

# 3
# Add a single item
repo = ItemsRepository.new
tango = Item.new
tango.item_name = 'Tango'
tango.unit_price = 3
tango.quantity = 500
repo.create(tango)
new_item = repo.find(3)
new_item[0].item_name # => 'Tango'
new_item[0].unit_price # => 3
new_item[0].quantity # =>  500



# Add more examples for each method
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
