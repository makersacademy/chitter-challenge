# Chitter Web App Design Recipe 

## 1. Describe the Problem

<!-- STRAIGHT UP -->

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

<!-- HARDER -->

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

<!-- ADVANCED -->

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep

## 2. Design the Data Model Class

_This class should store and manage the data the server will hold._
_Include the initializer and public methods with all parameters and return values._

```ruby
# EXAMPLE

class TodoList
  def initialize
  end

  def all
    # Returns a list of strings
  end

  def add(task) # task is a string
    # No return value
  end

  def get(index) # index is a number
    # Returns a string, the task at the given index
  def

  def update(index, new_task) # index is a number, new_task is a string
    # Updates the task at index to be the text new_task
    # No return value
  end

  def remove(index) # index is a number
    # Deletes the task at index
  end
end
```

_Check it against these rules:_

> 1. Does it represent a collection (list or hash) of data?
> 2. Does it _at least_ have methods to:
>    1. List out all items in the resource
>    2. Create an item (C)
>    3. Get a single item (R)
>    4. Update an item (U)
>    5. Delete an item (D)
> 3. Does each method take only simple data types as arguments?  
>    Simple data types are: string, number, boolean.  
>    Methods can return lists, hashes & other objects, but not take them as
>    parameters.
> 
> Some of these rules will be relaxed later but will keep you safe for now.

## 3. Designing the Web API (Requests)

_Design requests that perform each of the operations on your model class._
_Map them to the methods in your class._

```ruby
# 1 - Homepage (Listing Peeps)

  # Request: GET /
  # Context: Displays the homepage (including timeline)
    # Should display time 
  timeline = MessageRepository.new 
  timeline.sort_messages
  timeline.display

# 2 - Peep Creation Journey

  # GET /peep/new
  # Context: Displays a page with a form for creating new peep (message)
    # Time should be set automatically
  timeline = MessageRepository.new 
  timeline.create(message)

  # POST /peep/created 
  # Context: Post a peep Displays a confirmation page
  timeline = MessageRepository.new 
  timeline.create(message)

# 3 - Sign Up Journey 

  # GET /signup
  # Context: Displays a page with a sign up for creating a new account 
  new_user = UserRepository.new
  new_user.create(user)

  # POST /signup/success
  # Context: Create an account a peep Displays a confirmation page

  new_user = UserRepository.new
  new_user.create(user)

# 4 - Log in journey 

  # GET /login
  
    # Context: Displays a page containing a form to enter username and password 
        # a method for validation will need to take place 
        # find by email address will be more appropiate

    user = UserRepository.new
    user.find(id)
  
  # POST /login
  # Context: Sets log in status to true and displays a nav page asking the user what they would like to do next 

# 5 log out jounrey

  # GET /account 
  # Context: Shows account info and option to sign out

  # POST /account/sign_out
  # Context: Confirmation page upon successful sign out


```

## 4. Examples

_Create examples of the requests and their responses in different scenarios._

```ruby
# EXAMPLE

# 1 - Displaying timeline (all peeps in desc order)
Request: GET / 
Response: """

Home  New Peep Account  Signup

_Chitter Timeline_

Peep from: Bloggy_J  Time: 2022-12-01 19:10:25

This is a short post

---

Peep from: The_Migster  Time: 2022-11-01 14:50:00

Here is a slightly longer peep that I have created

___

Peep from: Schmoe123 Time: 2022-11-01 14:50:00

Here is an even longer peep, to deemonstrate how a much longer post may look when stored in my chitter database. Some posts may be even longer!'
___

End of timeline

"""

# 2 - Adding a todo and listing it


Request: GET /peep/new
  Response: """

  Home  New Peep Account  Signup

  _Create a new peep_

  Message: [Form] Submit



  """
Request: Post /peep/created
Data: { message: "A brand new peep", time_posted: 2022-12-02 19:30:51 }
  Response: """

  Home  New Peep Account  Signup

  _New Peep Created_

  You've posted a new peep: 
  """

  Request: POST /todos
  Data: { task: "Walk the dog" }
Request: GET /todos
  Response: """
  1. Walk the dog
  """

# 3 - Adding multiple todos and listing them
Request: POST /todos
   Data: { task: "Walk the dog" }
Request: POST /todos
   Data: { task: "Walk the cat" }
Request: POST /todos
   Data: { task: "Walk the frog" }
Request: GET /todos
  Response: """
  1. Walk the dog
  2. Walk the cat
  3. Walk the frog
  """

# 3 - Adding multiple todos, deleting one, and listing them
Request: POST /todos
  Data: { task: "Walk the dog" }
Request: POST /todos
  Data: { task: "Walk the cat" }
Request: POST /todos
  Data: { task: "Walk the frog" }
Request: DELETE /todos/2
Request: GET /todos
  Response: """
  1. Walk the dog
  2. Walk the frog
  """

# 3 - Adding multiple todos, updating one, and listing them
Request: POST /todos
  Data: { task: "Walk the dog" }
Request: POST /todos
  Data: { task: "Walk the cat" }
Request: POST /todos
  Data: { task: "Walk the frog" }
Request: PATCH /todos/2
  Data: { task: "Walk the zebra" }
Request: GET /todos
  Response: """
  1. Walk the dog
  2. Walk the zebra
  2. Walk the frog
  """
```

## 5. Translate the Examples to Web Tests

_Translate your examples to tests using `Rack::Test`_

```ruby
# EXAMPLE

RSpec.describe "Todo Application" do
  it "gets an empty list of todos" do
    get "/todos"
    expect(last_response.body).to eq "You have nothing to do."
  end
end
```

## 6. Implement the Behaviour

_Follow this cycle:_

1. Add a web test in `/spec/web/` (RED)
2. Implement the behaviour in `app.rb`
3. Does it pass without data model changes? (GREEN) Then skip to step 6.
4. Otherwise, add a unit test for the data model to `/spec/unit` (RED)
5. Implement the behaviour in your data model class. (GREEN)
6. Apply any refactors to improve the structure of the code. (REFACTOR)  
   Run `rubocop` as part of this.
7. Go back to step 1.


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->
