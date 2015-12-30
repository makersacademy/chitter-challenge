![makersacademy](media/ma_logo.png)

**week 4 / weekend challenge**

# The challenge

This weekend challenge is to create a simplified clone of Twitter!

## User stories

REGISTER

```
As a Maker
So that I can post messages on Chitter as me
I want to register for Chitter

As a Maker
So that I can understand why I can't register
I need to be warned the two passwords don't match

As a Maker
So that I can understand why I can't register
I need to be warned the email or username already exists

```
LOG IN

```
As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can understand why I can't log in
I need to be warned the email or password are wrong

```
LOG OUT

```
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

```
PEEPING

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

```

# Implementation

My implementation was driven by acceptance unit test cycles. The final implementation has 3 classes with defined responsabilities.

## Modules & gems

* Sinatra
* Rake
* Bcrypt

Test environment:
* Rubocop
* Coveralls
* Capybara
* Rspec

## How to use it
Make sure you first have all the necessary gems running
```
$ bundle install
```
Then run the app.rb file
```
$ ruby app.rb
```
Finally visit the game at /localhost:4567. Enjoy! :) (simple things in life are the best)


## Classes



## Future improvements
