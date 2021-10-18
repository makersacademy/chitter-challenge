# Chitter Challenge - Week 4 Makers
This is the weekend challenge for the Makers Academy for week 4. It is a basic clone of some of Twitter's functionality: The ability to sign up, log in, tweet, and log out.

## To install
- git clone "https://github.com/t-kellett/chitter-challenge"
- run `bundle install` (assuming you have bundler installed, and a recent version of Ruby - this is built in Ruby 3.0.0)
- run `psql`
- run the sql commands in the subdirectory `db/migrations`
- run `rackup`
- in your web browser, visit `http://localhost:[THE PORT OPENED IN YOUR TERMINAL]` e.g. 9292

## To interract
1. To create an account you can peep from, click 'Sign Up' and enter the required information into the fields on the following page
2. If you already have an account, log in with 'Log In'
3. You can 'peep' by entering up to 280 characters of text into the 'WHat's happening?' box and click 'Peep', this posts to the feed.
4. You should be able to see all previous peeps created in the database you are peeping to in reverse chronological order (even if you have not created an account or are signed in).
4. If you want to log out, please click 'Log Out'

## User Stories
These were the user stories implemented by this application:

```
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

### Improvements to be made (mainly note to self, feel free to skip)
There is currently no styling, it is just some raw HTML. I need to include some CSS to style this application.

