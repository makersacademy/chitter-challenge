![makersacademy](media/ma_logo.png)

**week 4 / weekend challenge**

# The challenge

This weekend challenge is to create a simplified clone of Twitter!

## User stories

###REGISTER

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
###LOG IN

```
As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can understand why I can't log in
I need to be warned the email or password are wrong

```
###LOG OUT

```
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

```
###PEEPING

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

As a maker
So that I can start a conversation with other users
I want to comment peeps

As a maker
So that I can view the most recent content
I want to see comments on a peep in reverse chronological order

As a maker
So that I can more easily understand times
I want to see the time peeps/comments where posted at in a friendly format (2 days ago, 1 minute ago, 1 hour ago etc.)

```

# Implementation

My implementation was driven by acceptance unit test cycles. The final implementation has 3 classes with defined responsabilities.

## Modules & gems

Production and development environment:
* sinatra-base
* bcrypt
* data_mapper
* dm-postgres-adapter
* sinatra-flash
* dm-validations
* sinatra-partial

Test environment:
* rake
* capybara
* rspec
* cucumber
* coveralls
* database_cleaner

## How to use it
- First clone this project to your local machine.
```
$ git clone
```
- Then navigate into the folder that contains it
```
$ cd chitter
```
- Now run bundler to make sure you have all the necessary dependencies
```
$ bundle install
```
- You need to have the correct database set up for running the app. Set up a POSTGRES database called chitter_development and one chitter_test. Then migrate the two databases.
```
$ rake db:migrate RACK_ENV=development
$ rake db:migrate RACK_ENV=test
```
- When done, run the app through the config.ru file
```
$ rackup
```
Finally visit the app at /localhost:9292 (or any other port you might have configured). Enjoy! :) (simple things in life are the best)


## Future improvements

```
As a maker
So that I can log in again
I want to reset the password I have forgot

As a maker
So that I can remove unwanted peeps
I want to delete a peep I made

```
