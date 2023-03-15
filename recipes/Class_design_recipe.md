# Chitter challenge Multi-Class Planned Design Recipe

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

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep


## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
┌────────────────────────────┐
│ PeepRepository             │
│                            │
│ - add(peep)                │
│ - all                      |
|    => reverse chron order  |         
└───────────┬────────────────┘
            │
            │ owns a list of
            ▼
┌─────────────────────────┐
│ Peep(username, message) │
│                         │
│ - username              │
│ - message               │
│ - time_added            │
│   │
└─────────────────────────┘
```

_Also design the interface of each class in more detail._

```ruby
class PeepRepository
  def initialize
    # ...
  end

  def add(peep) # peep is an instance of Peep 
    # Peep gets added to the library
    # Returns nothing
  end

  def all
    # Returns a list of all peep objects in reverse chronological orde rot when they were submitted
  end
  
end

class Peep
    def initialize(username, message) # username and message are both strings 
    end

    def username
      # Returns a string of the username
    end

  def message
    # Returns a string of the message
  end

  def time_added
    # Returns the time and date of the post being written (usnure of exact format just yet)
  end


end   
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

# Gets all peeps that have been added 
new_repo = PeepRepository.new
peep_1 = Peep.new("morecakes", "message")
peep_2 = Peep.new("morecakes", "message")
new_repo.add(peep_1)
new_repo.add(peep_2)
new_repo.all # => [peep_1, peep_2]

# Gets all peeps that have been added (2) 
new_repo = PeepRepository.new
peep_1 = Peep.new("morecakes", "message")
peep_2 = Peep.new("morecakes", "message")
new_repo.add(peep_1)
new_repo.all # => [peep_1]

#returns error message if peep added is not a peep 
new_repo = PeepRepository.new
peep_1 = Peep.new("morecakes", "message")
new_repo.add(peep_2) # => error message "This peep does not exist"


```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# Peep class

# Creates a peep with a username and message
peep_1 = Peep.new("user", "opinions")
peep.username #=> "user"
peep.message #=> "opinions"

# Returns the time and date that a peep was submitted 
peep_1 = Peep.new("Barry_the_Builder", "These are my opinions")
peep.time_added #=> a time 

# Returns error message if one of the parameters is empty string
peep_1 = Peep.new("Barry_the_Builder", "")
peep_1 #=> error message - content must be entered 

# Returns error message if one of the parameters is empty string (2)
peep_1 = Peep.new("", "Today I passed my exams")
peep_1 #=> error message - username must be entered 


# PeepRepository class 

# initally returns an empty library 
new_repo = PeepRepository.new
new_repo.all #=> []


```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._


<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fgolden-square&prefill_File=resources%2Fmulti_class_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->