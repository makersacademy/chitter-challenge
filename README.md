Chitter Challenge
=================

# Introduction
I undertook this project to better understand the web, and how model view controller works. It enabled me to work with new technologies, such as Sinatra, Capybara, DataMapper, and using basic HTML for the first time in one of my applications.

This is a very basic Twitter-clone, which allows users to sign up, log in, log out, post messages and view all messages in chronological order.

Here are the user stories provided for functionality:

```
As a user
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a user
So that I can post messages on Chitter as me
I want to log in to Chitter

As a user
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a user
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a user
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a user
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

## Approach

In order to solve this, I used the following:

1. **Test-driven development:** I used Capybara for the first time on this project to test web functionality, along with my regular RSpec tests. All code has been tested.

2. **Domain-modelling:** I modelled the class objects and interactions between them needed in order to solve the user stories. These were then turned into tables through DataMapper.

3. **Refactoring:** I refactored my code to include further functionality, such as password encryption through BCrypt.


## How to run
[Visit it here on Heroku](https://chitter-challenge-ff.herokuapp.com/users/new)
