Chitter Challenge
=================

Summary
-------

This application allows a user to register to and post peeps to Chitter. Peeps are displayed in reverse chronological order.

Features still to implement
-------
* The ability to log in and only post a peep if logged in
* Password encryption using bcrypt
* Field validation upon registration
* Displaying the author along side each peep

Technologies used
-------
* Sinatra
* PostgreSQL
* Ruby
* Capybara
* RSpec
* HTML and CSS

Installation
-------
* Clone the repository
* Run `gem list` in the project directory to check whether `bundler` is installed. If it is not, run `gem install bundler`
* In the project directory, run `bundle` to install the gems specified in the Gemfile

**Database set up**
* Run `rake setup` and `rake setup_test_database` in order to create the required databases

**Running the application**
* Run `rackup` and visit `localhost:9292`

**Running the tests**
* Navigate to the project directory
* Ensure you have already run `rake_setup` and `rake setup_test_database`
* Enter `rspec` in the terminal

Screenshots
-------
Post a peep by typing in the text box and clicking on 'Submit'

![image](https://user-images.githubusercontent.com/29439776/36358049-9691f322-14ff-11e8-8241-fd1341742dee.png)

Your peep will appear in the 'Older peeps' section

![image](https://user-images.githubusercontent.com/29439776/36358060-bcfd35f8-14ff-11e8-85ff-5c00937b5add.png)

Register for Chitter by clicking  'Register' on the homepage and completing the form

![image](https://user-images.githubusercontent.com/29439776/36358068-d6d213d6-14ff-11e8-8412-10a26b278542.png)

User stories:
-------

```
User Stories
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
