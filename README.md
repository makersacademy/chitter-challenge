Chitter Challenge
=================

### About

This Ruby web project has been written using TDD and BDD.  It is a small Twitter clone that allows users to post messages to a public stream. 

The program has met the conditions of the user stories, such as:

- So that I can let people know what I a doing, I want to post a message to chitter.

- So that I can see what others are saying, I want to see all messages in reverse chronological order.

- So that I can appreciate the context of a peep, I want to see the time at which it was made.

  ​

#### Local Installation

```
git clone https://github.com/ellie-keen/chitter-challenge.git
bundle
rake setup
rake migrate
rspec
rackup
```

### How to

To visit the website, ensure you have set up your databases using the rake command. Within your command line, enter 'rackup'. This will start your server using Sinatra. Visit http://localhost:9292/ within your browser.

Enter your name, handle and message you'd like to "cheep". After clicking 'Submit cheep!' you will see your message displayed on the homepage.

The project files consist of your models directory, views directory and 'app.rb' which acts as your controller.

Run any tests using rspec.

### Process

- Test Driven Development
- Domain modelling 
- OOP
- Single Responsibility 
- 100% Test Coverage



### Technology Used

* Rspec and Capybara with Sinatra.
* Set up a Database using TablePlus and PostgreSQL.
* Ruby, HTML and CSS.



