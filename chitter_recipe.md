# CHITTER

Index:

13 - User stories
50 - Database and tables design
74 - Seed implementation
124 - Model and Repository classes design
200 - Test examples for user_repository.rb
327 - Test examples for peep_repository.rb
391 - Route signature design and examples

## USER STORIES

STRAIGHT UP

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep


## DATABASE AND TABLES DESIGN

- peep 
(message) 
(see all in reversed chronological order) 
(see what time it was made) 


- sign up
(username, name, surname, email-address, password)
(sign up page)
(log in page)
(log out)

- advanced: send an email to a user who has been tagged in a peep

Database name: chitter_data

tables: peeps, users

- peeps: content, date, time, user_id

- users: username, name, surname, email-address, password, number of posts

## SEED IMPLEMENTATION

users

```sql

-- for the users table

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username text,
  name text,
  surname text,
  email text,
  pass text,
  posts_amount int
);

TRUNCATE TABLE users RESTART IDENTITY;

INSERT INTO users (username, name, surname, email, pass, posts_amount) 
VALUES
('The Lord Of Chitter', 'Francesco', 'Guglielmi', 'gug.francesco@gmail.com', 'UShallNotPass', 1),
('The Assistant', 'Dobbie', 'none', 'dobbie@email.com', 'ciao', 1);

-- for the peeps table

DROP TABLE IF EXISTS peeps;

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  date text,
  time text,
  user_id int,
  constraint fk_user_id foreign key(user_id)
  references users(id)
  on delete cascade
);

INSERT INTO peeps (content, date, time, user_id) 
VALUES 
('Welcome to Chitter! My first web app.', '12/03', '17:04', 1),
('My Lord, what services can I offer you?', '12/03', '17:05', 2);


```

## MODEL AND REPOSITORY CLASSES DESIGN

```ruby
# MODEL peep.rb

class Peep
  attr_accessor :id, :content, :date, :time, :user_id
end

# MODEL user.rb

class User
  attr_accessor :id, :username, :name, :surname, :email, :pass, :posts_amount
end

# REPOSITORY peep_repository.rb

class PeepRepository
  def initialize
  end

  def all
    # sends a query
    # returns all peeps
  end
  
  def find(id)
    # sends a query
    # returns one peep by id
  end

  def create(peep) # peep is an instance of Peep class
    # sends a query
    # returns nothing
  end

  def delete(id)
    # sends a query
    # returns nothing
  end
end

# REPOSITORY user_repository.rb

class UserRepository
  def initialize
  end

  def all 
    # sends a query
    # returns all users
  end

  def find(id) 
    # sends a query
    # returns one user by id
  end

  def create(user) # user is an instance of the User class
    # sends a query (adds a new user to the database)
    # returns nothing
  end

  def delete(id) 
    # sends a query (deletes one user by id)
    # returns nothing
  end

  def update
    # it sends a query (changes the user details)
    # returns nothing
  end
end

```

# TEST EXAMPLES FOR user_repository.rb

```ruby

# 1. it returns all the users

repo = UserRepository.new
users = repo.all

expect(users.length).to eq 2
expect(users[0].id).to eq "1"
expect(users[0].username).to eq "The Lord Of Chitter"
expect(users[0].name).to eq "Francesco"
expect(users[0].surname).to eq "Guglielmi"
expect(users[0].email).to eq "gug.francesco@gmail.com"
expect(users[0].pass).to eq "UShallNotPass"
expect(users[0].posts_amount).to eq "1"

# 2. it throws an error if the id is not an Integer

repo = UserRepository.new
expect{ repo.find("ciao") }.to raise_error "id must be an Integer"

# 3. it returns an user by id

repo = UserRepository.new
user = repo.find(2)

expect(users.length).to eq 1
expect(users[0].id).to eq "2"
expect(users[0].username).to eq "The Assistent"
expect(users[0].name).to eq "Dobbie"
expect(users[0].surname).to eq "none"
expect(users[0].email).to eq "dobbie@email.com"
expect(users[0].pass).to eq "ciao"
expect(users[0].posts_amount).to eq "1"

# 4. it adds an user to the database

repo = UserRepository.new
new_user = User.new
new_user.username = "Johnny B Goode"
new_user.name = "John"
new_user.surname = 'Doe'
new_user.email = 'jdoe@email.com'
new_user.pass = '12345'
new_user.posts_amount = 0

repo.create(new_user)
users = repo.all

expect(users.length).to eq 3
expect(users[-1].id).to eq 3
expect(users[-1].username).to eq "Johnny B Goode"
expect(users[-1].name).to eq "John"
expect(users[-1].surname).to eq 'Doe'
expect(users[-1].email).to eq 'jdoe@email.com'
expect(users[-1].pass).to eq '12345'
expect(users[-1].posts_amount).to eq 0

# 5. it deletes an user from the database

repo = UserRepository.new
repo.delete(2)
users = repo.all

expect(users.length).to eq 1
expect(users[-1].name).to eq "Francesco"
expect(users[0].surname).to eq 'Guglielmi'

repo.delete(1)
users = repo.all

expect(users).to eq []

# 6. it updates the username of an user

repo = UserRepository.new
record = repo.find(2)[0]
record.username = 'The Best'
repo.update_username(record)

users = repo.all
expect(users[-1].username).to eq 'The Best'

# 7. it updates the name of an user

repo = UserRepository.new
record = repo.find(2)[0]
record.name = 'Steve'
repo.update_name(record)

users = repo.all
expect(users[-1].name).to eq 'Steve'

# 8. it updates the surname of an user

repo = UserRepository.new
record = repo.find(2)[0]
record.surname = 'Jobs'
repo.update_surname(record)

users = repo.all
expect(users[-1].surname).to eq 'Jobs'

# 9. it updates the email of an user

repo = UserRepository.new
record = repo.find(2)[0]
record.email = 'development@example.net'
repo.update_email(record)

users = repo.all
expect(users[-1].email).to eq 'development@example.net'

# 10. it updates the password of an user

repo = UserRepository.new
record = repo.find(2)[0]
record.pass = 'passkey123'
repo.update_pass(record)

users = repo.all
expect(users[-1].pass).to eq 'passkey123'

```

# TEST EXAMPLES FOR peep_repository.rb

```ruby

# 1. it returns a list of the peeps

repo = PeepRepository.new
peeps = repo.all

expect(peeps.length).to eq 2
expect(peeps[-1].id).to eq 2
expect(peeps[-1].content).to eq 'My Lord, what services can I offer you?'
expect(peeps[-1].date).to eq '12/03'
expect(peeps[-1].time).to eq '17:05'
expect(peeps[-1].user_id).to eq 2

# 2. it throws an error if the id is not an Integer

repo = PeepRepository.new
expect{ repo.find("ciao") }.to raise_error "id must be an Integer"

# 3. it returns a peep by id

repo = PeepRepository.new
peep = repo.find(1)

expect(peep.length).to eq 1
expect(peep[0].id).to eq 1
expect(peep[0].content).to eq 'Welcome to Chitter! My first web app.'
expect(peep[0].date).to eq '12/03'
expect(peep[0].time).to eq '17:04'
expect(peep[0].user_id).to eq 1

# 4. it adds a new peep to the database

repo = PeepRepository.new
new_peep = Peep.new
new_peep.content = "Good morning!"
new_peep.date = "12/03"
new_peep.time = '18:10'
new_peep.user_id = 2

repo.create(new_peep)
peeps = repo.all

expect(peeps.length).to eq 3
expect(peeps[-1].id).to eq 3
expect(peeps[-1].content).to eq "Good morning!"
expect(peeps[-1].date).to eq "12/03"
expect(peeps[-1].time).to eq '18:10'
expect(peeps[-1].user_id).to eq 2

# 5. it deletes a peep from the database

repo = PeepRepository.new
repo.delete(1)
peeps = repo.all

expect(peeps.length).to eq 1
expect(peeps[-1].content).to eq 'My Lord, what services can I offer you?'
expect(peeps[0].content).to eq 'My Lord, what services can I offer you?'

```

# ROUTE SIGNAURE DESIGN AND EXAMPLES

Request 1: GET /

expected response: 200 OK

response body:

```html


<style>
  body {
    background: linear-gradient(90deg, #281967, #1c1698);
    color: white;
  } 

  h1 {
    font-family: "Rubik Iso", monospace;
    color: #e7ca0d;
    text-align: center;
  }
</style>

<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Rubik+Iso&display=swap" rel="stylesheet">
        <title>Chitter</title>
    </head>
    <body>
        <header>
            <h1>Chitter</h1>
        </header>
        <main>
            <%= @all the peeps %>
            <form method="POST" action="/new">
                <input type="text" name="content" placeholder="Peep something..." required>
                <input type="submit" value="Send">
            </form>  
        </main>
    </body>

</html>
```

