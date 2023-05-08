# Chitter Model and Repository Classes Design Recipe

## 1. Design and Create the table

User Stories/specification:

> As a Maker
> So that I can let people know what I am doing  
> I want to post a message (peep) to chitter

> As a maker
> So that I can see what others are saying  
> I want to see all peeps in reverse chronological order

> As a Maker
> So that I can better appreciate the context of a peep
> I want to see the time at which it was made

> As a Maker
> So that I can post messages on Chitter as me
> I want to sign up for Chitter

> As a Maker
> So that only I can post messages on Chitter as me
> I want to log in to Chitter

> As a Maker
> So that I can avoid others posting messages on Chitter as me
> I want to log out of Chitter


#### relationship:

1. Can one Maker have many Peeps ? YES

-> A Maker HAS MANY Peeps
-> A Peep BELONGS TO a Maker
-> Therefore, the foreign key is on the Peeps table.

Table design:
Makers: id | name | username | email_address | password
Peeps: id | title | content | date_posted | maker_id
 
id: SERIAL 
name: text
username: text
email_address: text
password: text

id: SERIAL
title: text
content: text
posted: timestamp
maker_id: int


#### Creating the tables:

```sql 
CREATE TABLE makers (
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email_address text,
  password text
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  title text,
  content text,
  date_posted timestamp,
  maker_id int,
  constraint fk_maker foreign key (maker_id)
    references makers(id)
    on delete cascade
);
```

Create table:
psql -h 127.0.0.1 chitter_base < DB_table_setup.sql


## 2. Create the SQL seeds
```sql
-- file: spec/chitter_seeds.sql)

TRUNCATE TABLE makers RESTART IDENTITY CASCADE;
TRUNCATE TABLE peeps RESTART IDENTITY CASCADE;

INSERT INTO makers(name, username, email_address, password) VALUES("Matty Boi", "MattyMooMilk", "mattys_fake_email@tiscali.net", "Password1!");
INSERT INTO makers(name, username, email_address, password) VALUES("Hayley Lady", "HayleyOk", "another_fake_email420@gmail.com", "DifferentPassword123.");


INSERT INTO peeps(title, content, date_posted, maker_id) VALUES("My first ever peep", "Internet is crazy", 12-12-2023 04:05:06, 1);
INSERT INTO peeps(title, content, date_posted, maker_id) VALUES("Hayleys peep", "Another test peep", 12-12-2023 04:05:06, 2);

```

psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql

## 3. Define the class names

```ruby
# Model class'
# (in lib/maker.rb)

class Maker
end

# (in lib/peep.rb)
class Peep
end

# Repository class'
# (in lib/maker_repository.rb)
class MakerRepository
end

# (in lib/peep_repository.rb)
class PeepRepository
end
```

## 4. Implement the Model class'

``` ruby

# Model class
# (in lib/maker.rb)

class Maker
  attr_accessor :id, :name, :username, :email_address, :password
end

# Model class 2
# (in lib/peep.rb)

class Peep
  attr_accessor :id, :title, :content, :date_posted, :maker_id
end

```

## 5. Define the Repository Class' interface

```ruby

# Table name: makers
# Repository class
# (in lib/maker_repository.rb)

class MakerRepository

  # Selecting all records
  def all
    # Executes the SQL query:
    # SELECT * FROM makers;
    # Returns all records as an array of user objects. - to be used by other methods in app.rb.
  end

  # Adds a maker/user to the makers table in DB
  def create(maker_obj)
    # adds a user object to the database
    # 'INSERT INTO makers(name, username, email_address, password) VALUES($1, $2, $3, $4);'
    # params = [maker_obj.name, maker_obj.username, maker_obj.email_address, maker_obj.password]
    # No return
  end
end

#Table name: peeps
#This repository class acts on order objects 
# (in lib/peep_repository.rb)
class PeepRepository

  def all
    # Returns an array of all peep objects
    # Method can be called by other methods later (Will need to sort peeps by timestamp)
    # Executes the SQL query:
    # SELECT * FROM peeps;
  end

  # Adds a new peep to the database:
  def create(peep_obj)
    # Adds a postobj to the posts table if post corresponds to existing user 
    # 'INSERT INTO peeps(title, content, date_posted, maker_id) VALUES($1, $2, $3, $4);'
    # params = [peep_obj.title, peep_obj.content, peep_obj.date_posted, peep_obj.maker_id]
    # No return
  end

# Deletes a peep from the database
  def delete(id)
    # 'DELETE FROM peeps WHERE id = $1;'
    # params = [id]
  end
end
```

## 6. Write Test Examples
These examples will later be encoded as RSpec tests.

```ruby

# EXAMPLES

# 1. Get all Peeps
repo = PeepRepository.new
repo.all.length => # returns correct integer dependent on how many rows are in DB
repo.all.first.id => #always will return 1
repo.all.last.id => #should return the same int as first test line 
repo[2].title => #returns the item name of object at index 2 (assuming there are 3 objs in array)
repo[2].date_posted => #returns the correct timestamp. 

# Get all Makers:
repo = OrderRepository.new
repo.all.length => # returns correct integer dependent on how many rows are in DB
repo.all.first.id => #always will return 1
repo.all.last.id => #should return the same int as first test line 
repo[2].customer_name => #returns the customer name of object at index 2 (assuming there are 3 objs in array)


# if database is empty should return => []


# 2. Add a Maker to database (Create account)
repo = MakerRepository.new
maker_1 = Maker.new # => can be a double => double :maker, name: 'name', username: 'username', email_address: 'fake_email@gmail.com', password: 'Password123'
maker_1.name = 'name'
maker_1.username = 'username'
maker_1.email_address = 'fake_email@gmail.com'
maker_1.password = 'Password123'
repo.create(maker_1)
expect(repo.all.last.name).to eq 'name'
expect(repo.all.last.username).to eq 'username'
expect(repo.all.last.email_address).to eq 'fake_email@gmail.com'
expect(repo.all.last.password).to eq 'Password123'
expect(repo.all.length) # => an integer 1 greater than our current length
expect(repo.all.last.id).to eq # => ^ same integer as previous expect line ^

# Add a peep to database (Create a peep) 
repo = PeepRepository.new
peep = Peep.new # => can be a double
peep.title = ''
peep.content = ''
peep.date_posted = ''
peep.maker_id = 1
repo.create(peep)
expect(repo.all.last.content).to eq 
expect(repo.all.last.date_posted).to eq 
expect(repo.all.length) # => an integer 1 greater than our current length
expect(repo.all.last.id).to eq # => ^ same integer as previous expect line ^

# Delete a peep
repo = PeepRepository.new
repo.delete(1)
expect(repo.all.length) # => an integer 1 fewer than our current length
expect(repo.all.first.id).to eq # => 2

```

## 7. Reload the SQL seeds before each test run
Running the SQL code present in the seed file will empty the table and re-insert the seed data.

```ruby

# file: spec/item_repository_spec.rb

 def reset_makers_table
    seed_sql = File.read('spec/chitter_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_base_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_makers_table
  end
end

# file: spec/order_repository_spec.rb

 def reset_peeps_table
    seed_sql = File.read('spec/chitter_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_base_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_peeps_table
  end
end
```

## 8. Test-drive and implement the Repository class behaviour
_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._