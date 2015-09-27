
This is a little Twitter clone that allows the users to post messages to a public stream.

Features:
-------

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

As a maker
So that I can let people know what I am doing
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

I use Sinatra, bcrypt to make password, datamapper to work with database.
For tests I use capybara, factory_girl, database_cleaner.

I have two classes, User and Peep, they are connected one-to-many (user can have many peeps, peep belongs to one user).
Website structure is the following:
```
/
/peeps
/peeps/new
session
/session/new
user
user/new
```


