Chitter Challenge
=================

I built a very simple Twitter clone called Chitter. I had the following user stories-
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

This application was one of the first chances I had to persist my data as it was added by different users. I did this by using postgres and storing the data locally. Further, it was the first time I built an individual project using the model-view-controller pattern. I used Postgres as the model to store my data, Sinatra as the controller and ERB as my views. I split the application up into different models - one for users and one for peeps. Further to this I also had a validation class that checked the user was entering in correct data when they were trying to login or register.

### Screenshots

<img src="images/main_page.png?" width="400px">

The index page of Chitter

<img src="images/peeps_screenshot.png?" width="400px">

How users can view the peeps - you can view the peeps if you're logged in or not, but you can only post if you're logged in

<img src="images/register.png?" width="400px">

The register page

<img src="images/user_exists.png?" width="400px">

Here the user has attempted to sign up with an email that already exists - hence they have been notified

<img src="images/sinatra.png?" width="400px">

A shot of the sinatra controller

<img src="images/register_model.png?" width="400px">

The register view - notice how the user sees different option depending on whether they're signin or not

<img src="images/capybara_tests.png?" width="400px">

A suite of capybara tests - my first time testing the front end

<img src="images/passing_tests.png?" width="400px">

17 passing tests along with 100% test coverage

Technologies Used
-----

* Ruby
  * I built my application with Ruby - using it to interact with postgres in order to store data
* Rackup
  * I used rackup to load my application in the terminal and allow it to be viewed in the browser
* Capybara
  * In order to test the front-end I used capybara - this interacted with my elements on my css page
* RSpec
  * Rspec was my testing framework
* Postgres
  * I ran Postgres locally in order to store data when users entered information in my front-end


How To Use!
-----

* Git clone the project into your own local repository
* Run bundle install in order to download the relevant gems
* Enter *rackup* in your local repo in order to start the application
* Add the following into you IRB IRB


Tests
-----

After bundle install has been run you will be able to run rspec to test the application. Just run rspec in your terminal to do so.
