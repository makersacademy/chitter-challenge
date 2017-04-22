Chitter Challenge
=================

Task
-------
I aimed to build a Twitter clone that will allow the users to post messages to a public stream.

Users had to be able to sign in with their email, password and username. The email and username had to be unique, and their passwords had to be encrypted and stored in a database.

Features
-------

```
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

Strategy
----------
I decided to theme my web application as a stream for the latest knitting tips, "Knitter".

I test drove the development of my app using RSpec and Capybara. Users' information was stored in a database using postgreSQL and DataMapper was used for my ORM. Rake was used to clean my databases after each RSpec test.Finally, passwords were encrypted using bcrypt.

Sinatra and Heroku were used to deploy my app in development and production environments, respectively.

Installation
-----------

Clone repository:
```
$ git clone git@github.com:nazwhale/knitter.git
$ cd knitter
$ bundle
$ rake db auto_migrate
$ rspec
$ rackup
```

Install dependencies with bundle:
```
$ gem install bundler
$ bundle install
```

Screenshots
----------
![Screenshot](https://cdn-images-1.medium.com/max/1400/1*3IYVuJUq4O0W2hEf98Dstg.png)
![Screenshot](https://cdn-images-1.medium.com/max/1400/1*i2m881wSUo57jvuGQ1tRhw.png)
![Screenshot](https://cdn-images-1.medium.com/max/1400/1*zhGp7x8AcJF3ma6uk6S8dQ.png)
