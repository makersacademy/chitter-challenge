# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```

```

_Also design the interface of each class in more detail._

```ruby
class UserLibrary
  def initialize
  end

  def add(user) #creates a new instance of user
  end

  def all   #returns all users
  end

class User
  attr_accessor :id, :password, :username
end


class PeepLibrary
  def initialize
    # ...
  end

  def add(peep) # Create a new instance of peep
    # Peep gets added to the library
    # Returns "post successful"
  end

  def all
    # Returns a list of all peeps in reverse chronological order
  end

  def delete(peep) #deletes instance of a peep
  #returns deletion successful
  end 
end

class Peep
  attr_accessor :id, :message, :time, :user_id
end
```



## 5. Implement the Behaviour
