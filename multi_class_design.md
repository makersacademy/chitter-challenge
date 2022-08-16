# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

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

<!-- ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep -->

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

_Also design the interface of each class in more detail._

Chitter
- Post a message (peep)
- See all peeps in reverse chronological order with the time of creation
- Sign up for chittter
- Log in to chitter
- log out of chitter

```ruby
class PeepRepository
  def initialize
    # ...
  end

  def all
    # SELECT * FROM peeps;
    # Returns a list of peep objects
  end

  def create(peep) # peep is an instance of Peep
    # Peeps gets added to the database
    # INSERT INTO peeps (content, time, user_id) VALUES ($1, $2, $3);
    # Returns nothing
  end
end

class UserRepository
  def initialize
    # ...
  end

  def create(user) # user is an instance of User 
    # User gets added to the database
    # INSERT INTO users (email, password, name, username) VALUES ($1, $2, $3, $4);
    # Returns nothing
  end

  def sign_in(email, password) # email and password are an instance of User
    # User gets signed in
    # INSERT INTO users (email, password) VALUES($1, $2);
    # Returns nothing
  end

  def find_by_email(email) # email is an instance of User
    # SELECT * FROM users WHERE email = $1;
    # Returns user object
  end
end

class Peep
  attr_accessor :id, :content, :time, :user_id

  def initilize
    @time = Time.now
  end
end

class User
  attr_accessor :id, :email, :password, :name, :username 
end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# PeepRepository
# 1 Gets all peeps
peep_repo= PeepRepository.new

peeps = peep_repo.all
peeps.length # => 3
peeps.first.content # => 'Good morning everyone!'
peeps.first.time # => '2022-08-10 10:46:45.558437+01'
peeps.first.user_id # => '1'

# 2
# Create a peep
new_peep = Peep.new
new_peep.content = 'FAKE_CONTENT_1'
new_peep.time = '2022-08-05 11:15:45.558437 +0100'
new_peep.user_id = '1'

peep_repo = PeepRepository.new
peep_repo.create(new_peep)

peeps = peep_repo.all
peeps.length # => 4
peeps.last.content # => 'FAKE_CONTENT_1'
peeps.last.time # => '2022-08-05 11:15:45.558437+01'
peeps.last.user_id # => '1'


# UserRepository
# 1 Find user by email
user_repo = UserRepository.new
user = user_repo.find_by_email('nschlosser@hotmail.com')

user.email # => 'nschlosser@hotmail.com'
user.name # => 'Naomi Schlösser'
user.username # => 'nschlosser'

# 2
# Create a user
new_user = User.new
new_user.email = 'FAKE_EMAIL'
new_user.password = 'FAKE_PASSWORD'
new_user.name = 'FAKE_NAME'
new_user.username = 'FAKE_USERNAME'

user_repo = UserRepository.new
user_repo.create(new_user)

user = user_repo.find_by_email('FAKE_EMAIL')
user.email # => 'FAKE_EMAIL'
user.name # => 'FAKE_NAME'
user.username # => 'FAKE_USERNAME'

# 3
# Sign in a user with an incorrect password
user_repo = UserRepository.new
user_repo.sign_in('nschlosser@hotmail.com', 'INCORRECT_PASSWORD') # => false

# 4
# Sign in a user with the correct password
user_repo = UserRepository.new
user_repo.sign_in('nschlosser@hotmail.com', 'ABCD') # => true
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# no unit test needed
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._