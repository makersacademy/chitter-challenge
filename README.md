# Chitter

## Description

A simple web based messaging board for users to talk to one another. The app can currently remember users, allow them to post messages to each others walls and has a basic tagging function in progress.

## Dependancies
```
- Ruby - 2.5.1 - Language
- RSpec - 3.8 - Testing framework
- SimpleCove - Ruby test coverage
- Database cleaner - Gem for keeping test database clean
- Rubocop  - Ruby Linter
- PostgreSql - Database
- ActiveRecord - ORM for PSQL
- Sinatra - 2.0 - Ruby Web framework
- Capybara - 3.12 - Sinatra/Ruby testing framework
- rack - webserver service
- rake -database migrations manager
```
## Installation

1. Clone/Download this repo.
2. run ``` bundle install ``` to install above dependancies
3. In command line run ``` rackup ```
4. got to ```localhost:9292``` in browser

## Testing

- Testing has been carried out with RSpec framework using Capybara to interact with user facing elements.
- Test coverage currently sits at 100% across all files.
- To run tests open irb in console and run ``` rspec ```
- To see test coverage run see bottom of RSpec output in command line.

## Approach

I approached this from as much of as TDD perspective as possible, starting with a failing feature test - a user can post a message - and working up through the subsequent tests as shown in the commit history. I targeted this project towards my learning goal of I can TDD anything and used this project to push my TDD process as far as possible.

I worked through to the ability for users to post to each others walls and see their own message history. My approach was to aim fully for function over form, hence the basic HTML styling throughout.

## Code structure

###  Models

1. Message
  - Creates the message object

  *Functionality:*
  - Creates messages and assigns it to the user who created it.
  - Has the basic function for checking if another user has been tagged.

2. User
  - Creates users and validates details

  *Functionality:*
  - Creates users, validates all fields and can return relevant errors
  - authenticates login details.

### Views

1. index.erb
    - The Home Page
2. layout.erb
    - The all purpose layout for chitter
3. login.erb
    - renders the login page with signup form
4. profile.erb
    - renders the profile with messages on load
5. signup.erb
    - renders the sign up page with full form
6. text-box.erb
    - partial for the text box used to create messages.

### Work to be done

  - A general further refactor could be good, but need to some refresher learning on Sinatra/Ruby to identify any further places.
  - Fully implementing a Tag system, it is currenlty a base functionality where the program can tell if a message contains a tag but the databse associations need setting up further and further functionality to turn the tags into more than parts of a string.
  - Further associating a message board with the user, so a user can only see posts on their wall and if they go to someone elses profile they can post messages to that board.
  - A profiles list of who is available to message would be needed to enact the above.
  - Refactor to use in built sinatra flash messages to get out of the cheap work around of assigning an error message to a session. Would aim to get the validation messages showing as they currently exist in the DB.

  - Password encryption
  - Validations and error messages

### User Journey

** Home Page **

![picture](/images/pic1.png)

** Signing up **

![picture](/images/pic2.png)

** Your profile **

![picture](/images/pic3.png)

** logging in **

![picture](/images/pic4.png)

** with incorrect details... **

![picture](/images/pic5.png)
