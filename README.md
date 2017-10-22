# Chitter (An extremely simplified twitter clone - Makers' Weekend challenge)
demo can be found on https://mormolis-chitter.herokuapp.com

## Tests and implements the following user stories
```
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


As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

```
## Technologies used
* Ruby
  * Sinatra
  * Data Mapper - postgres adapter (ORB)
  * Rake
  * RSpec
  * Capybara
* HTML
* CSS

## Where to start...
The test are showing the functionality of the code. 

On the app folder the application_controller.rb sets the routes.

Models Peep and User are responsible for creating relations and manipulating the data stored in.

## Improvements to be made
- [ ] making use of flash
- [ ] refactoring the application controller and delegating responsibilities 
- [ ] Test the password authentication 