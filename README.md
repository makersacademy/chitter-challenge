Chitter Challenge
=================

Technologies used:
-------

- ActiveRecord was used as the database interface instead of implementing Repository classes
- All users have a secure password stored in a hash in a database (implemented with has_secure_password method and bcrypt gem)
- User session tracking with Sinatra sessions feature

Progress:
-------
- All "Straight Up" and "Harder" features were implemented
- No testing :(
- Fully works on local machine but gives error on Heroku

Installation:
-------
Clone this repo on your machine, then run following commands in your teminal:

1. To install all required gems

```
gem add bundler
bundle install
```
2. Configure to your database

```
touch database.yml
```

```yml
# in database.yml
# populate missing fields with your own values

development:
  adapter: postgresql
  database: 
  host: localhost
  username: 
  password: 

test:
  adapter: postgresql
  database: 
  host: localhost
  username: 
  password: 
```

3. Set up database structure

```
rake db:migrate SINATRA_ENV="development"
rake db:migrate SINATRA_ENV="test"
```

4. Start server

```
rackup
```

Features:
-------

```
STRAIGHT UP

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

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

