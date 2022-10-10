{{Chitter}} Multi-Class Planned Design Recipe
1. Describe the Problem
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

sigup/login- model class 
- new user - email / username - password
sigup/login repo
- adds user to DB - checks credentials are correct in DB
peep - model class
- name of user - content - date/time
peeps repo - a list connected to DB that you can add peeps to - displays lastest first
- adds peeps to DB - lists peeps latest first

App file - home page will have signup - after signed and login up will take you to peeps page
if credentials incorrect will show error page with button to get back home
peeps page will allow you to add a peep and will display underneath all peeps latest first

database for login and peeps

Don't have to be logged in to see peeps
ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep

2. Design the Class System
Consider diagramming out the classes and their relationships. Take care to focus on the details you see as important, not everything. The diagram below uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com


Also design the interface of each class in more detail.
```ruby
class Application

end

#repo
class PeepRepository

    def initialize
    end
    
    def list_peeps
    #shows full list of peeps as strings with content, username and date/time
    # of post
    end

    def add(peep)
    # takes and instance of the peep class and adds to database
    end 
end
#model
class Peep
  attr_accessor :id, :content, :user_id
end

class UserRepository

    def initialize
    end

    def authenticate
    # checks email/username/password match
    # give boolean 
    end

    def add(user)
    # takes instance of user class and adds to database
    end
end

class User
  attr_accessor :id, :username, :email, :password
end


```
3. Create Examples as Integration Tests
Create examples of the classes being used together in different situations and combinations that reflect the ways in which the system will be used.

# EXAMPLE

# Gets all tracks
library = MusicLibrary.new
track_1 = Track.new("Carte Blanche", "Veracocha")
track_2 = Track.new("Synaesthesia", "The Thrillseekers")
library.add(track_1)
library.add(track_2)
library.all # => [track_1, track_2]
4. Create Examples as Unit Tests
Create examples, where appropriate, of the behaviour of each relevant class at a more granular level of detail.

# EXAMPLE

# Constructs a track
track = Track.new("Carte Blanche", "Veracocha")
track.title # => "Carte Blanche"
Encode each example as a test. You can add to the above list as you go.

5. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.