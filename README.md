Chitter Challenge
=================


The task
---------

This is my response to the fourth weekend challenge at Makers Academy, to build a  Chitter web app, using a TDD approach (test coverage is 100% with SimpleCov). The user should be able to see a list of peeps and sign up to post their own peeps, according to the following user stories:


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
```


Instructions on additional functionality were as follows:

- You don't have to be logged in to see the peeps.
- Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
- The username and email are unique.
- Peeps (posts to chitter) have the name of the maker and their user handle.


How to use
---------
* Install and set up PostrgreSQL on your machine
* Clone this repo to your local machine: `git clone https://github.com/simone-smith/chitter-challenge`
* Open the directory: `cd chitter_challenge`
* Run bundle: `bundle install`
* Set up the databases: `rake setup`
* Run the tests: `rspec`
* Run the server: `rackup`
* Navigate to localhost:9292 to use the app in the browser


Demo
---------
1. Users must sign up before they can post a peep
![Users must sign up first](https://github.com/simone-smith/chitter-challenge/blob/master/screenshots/not_signed_up.png)


2. Users are presented with sign-up screen
![Users sign up for Chitter](https://github.com/simone-smith/chitter-challenge/blob/master/screenshots/sign_up.png)

3. Users are redirected to the first page, where they can now post a peep or view previously posted peeps by other users
![Users are redirected to first page ](https://github.com/simone-smith/chitter-challenge/blob/master/screenshots/signed_up.png)

4. Users can view all peeps, in reverse chronological order. Users can see who posted the peep and at what time
![Users can view all peeps](https://github.com/simone-smith/chitter-challenge/blob/master/screenshots/show_peeps.png)


Technologies used
---------
* BCrypt (3.1.12)
* Bootstrap (4.1.1)
* Capybara (2.17.0)
* PostgreSQL (1.0.0) (and TablePlus for GUI)
* Rake (12.3.0)
* RSpec (3.7.0)
* Ruby (2.5.0)
* Sinatra (2.0.3)
* Sinatra-flash (0.3.0)


Future improvements
---------
* Enable users to sign in and out with authentication
* Connect the peeps and users tables in a one-to-many relationship so that users can interact with their own peeps.
* Enable users to edit and delete their peeps
* Improve the visual design with custom CSS
