# Chitter Challenge: Weekend 4 Challenge


Online here: https://chitterchallenge.herokuapp.com/


Created a simple 'twitter clone' with DataMapper as the ORM to interact with psql databases in different environments. This was done following a TDD approach. Used bcrypt for password encryption and validation, datacleaner for running tests on the testing environment and started using bootstrap. (TO DO: learn CSS)

The task was to provide a _Chitter_ app following the user stories:

```sh
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

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


Installation
-------
1. Clone the code to your local machine: `git clone https://github.com/chdezmar/chitter-challenge.git`
2. Run `bundle`. Make sure you have bundler: `gem install bundle` if not.
3. Start a server `ruby app/app.rb`
4. Go to `localhost:4567`
5. Sign up and add chits!

----

Notes on functionality:
------

* Drive the creation of your app using tests - either cucumber or rspec as you prefer
* Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Use bcrypt to secure the passwords.
* Use data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.
