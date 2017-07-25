# Chitter Challenge
[![Build Status](https://travis-ci.org/tbscanlon/chitter-challenge.svg?branch=master)](https://travis-ci.org/tbscanlon/chitter-challenge)

Share your thoughts with the world using the world's second best microblogging service.

[Try it out here](https://chitter-june2017.herokuapp.com/).

Some great features:
- Almost entirely responsive using the magic of Bootstrap (ignore the non-collapsible navigation bar, I'll fix it soon&trade;)
- Sign up for a user account!
- Logging in and out works as well.

All tests are passing with 100% coverage. I ran into some issues unit testing my models, because I'm not sure how you're meant to stub out DataMapper functionality. I was able to test *most* of the behaviour of my models after referring to tests in one of the skills workshops we did this week, but it's still not as comprehensive as I would've liked. My comprehensive feature tests make up for this, however. I made a point of accounting for every edge case I could think of.

This challenge was difficult, but I found it not quite as hard as [last weekend's challenge](https://www.github.com/tbscanlon/rps-challenge). I attribute this entirely to how rigid user account management is; there's only so many ways you can implement user accounts using Sinatra and DataMapper. I was able to mostly copy the user account stuff from the [weekly challenge](http://www.github.com/tbscanlon/bookmark_manager), with only slight changes made to accomodate Chitter usernames.

Overall, I'm happy with how this challenge turned out - especially considering how we only had a weekend to develop a solution. I feel my controllers are probably doing a bit too much of the heavy lifting. If I had more time, I would refactor as much of the logic as possible into my models.

This app was made for the week 4 weekend challenge for [Makers Academy](www.makersacademy.com).

Tech used in this challenge:
- Sinatra
- DataMapper
- PostgreSQL
- BCrypt
- TravisCI

## Installation
1. Set up the following two databases in PostgreSQL: `chitter_development` and `chitter_test`.
2. Clone this repo by running `git clone git@github.com:tbscanlon/chitter-challenge.git` from your terminal.
3. Install dependencies by running `bundle install` (you may need to `gem install bundle`).

## Usage
1. Run `rackup -p 4567` in the project folder.
2. Open your favourite web browser (unless it's Internet Explorer. Never open IE) and navigate to `localhost:4567`.

## Code Examples

### User Model
```ruby
# ./app/models/user.rb
require 'bcrypt'

class User
  include DataMapper::Resource

  attr_accessor :password_confirmation
  attr_reader :password

  has n, :peeps

  property :id, Serial
  property :username, String, required: true, unique: true
  property :email, String, required: true, unique: true, format: :email_address
  property :password_digest, Text

  validates_confirmation_of :password

  def self.authenticate(username, password)
    user = first(username: username)
    return user if user && BCrypt::Password.new(user.password_digest) == password
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
```

### Authenticating Users
```ruby
# ./app/app.rb
post '/sessions' do
  user = User.authenticate(params[:username], params[:password])
  if user
    session[:user_id] = user.id
    redirect to '/peeps'
  else
    flash.now[:errors] = 'The email or password is incorrect'
    erb :'sessions/new'
  end
end
```

### Test Helpers - User Sign Up
```ruby
# ./spec/helpers.rb
def sign_up(username: 'tom', email: 'tom@test.com',
            password: 'Secret01', password_confirmation: 'Secret01')
  visit '/users/new'
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign Up'
end
```

### Testing Unique Usernames
```ruby
# ./spec/features/user_creation_spec.rb
scenario "can't sign up twice with the same username" do
  sign_up
  expect { sign_up(username: "tom", email: "tom2@test.com") }.to_not change(User, :count)
  expect(page).to have_content "Username is already taken"
end
```

## Credits
- This is obviously a shameless rip off of Twitter, which is owned by some rich guy called Jack. I have no money **PLS NO SUE**.

## User Stories
```
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
```
