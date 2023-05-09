Chitter
=================

This is a simple Ruby web app that acts as a Twitter clone. Users can create an account, log in, post peeps (tweets), and view all peeps or individual peeps. The app uses the Sinatra framework

Requirements
-------

Ruby 2.6.6 or later
Sinatra gem

Getting Started
------
To run the app locally, do the following:

1. Clone the repository:
```bash
git clone https://github.com/aze5/chitter-challenge.git
```

2. Navigate to the repository and install Gems:
```bash
bundle install
```

3. Run the server:
```bash
rackup
```

4. Open your web browser and go to `http://localhost:9292/`


Features:
-------
_This App was built based on these user stories:_
```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a Maker
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

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

Technologies:
-----

This web application was implemented using Sinatra, RSpec, HTML and ERB views to make dynamic webpages. The database was integrated using the `pg` gem and Repository classes. 

Testing:
------
Testing was done using RSpec, test coverage is 93.63%. RuboCop was also used to help improve code quality, and simplecov was used to help measure and report on the coverage of the code.

To run the tests, navigate to the repository and run the following command:
```bash
rspec
```

If you would like to test a single file:
```bash
rspec spec/<TEST FILE NAME>
```
 
Contributing
-----
Pull Requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
