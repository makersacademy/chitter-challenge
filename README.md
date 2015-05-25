Summary
=================

* Twitter clone web app (Minimalitter Chitter) that allows the users to post messages to a public stream and reply to those messages.

[Minimalitter Chitter](https://minimalitter-chitter-ah.herokuapp.com/)

Requested Use Cases:
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

How to run
----

* For web viewing, simply follow the link to the website hosted on heroku
* For local use, clone or fork the repo to your local machine
* Install sinatra and shotgun gems to view on your local host
* Tests can be run by installing rspec and capybara gems and running rspec from your command line


Checklist
----

- [x] Sign-up and post messages as a logged in user
- [x] Log-out and not be able to post messages
- [x] All messages display user, user handle and timestamp and are displayed in chronological order
- [x] Users can reply to other users


Technologies used
----

* Production - Ruby, CSS (using Bootstrap), HTML Datamapper, PSQL, Sinatra, Heroku, Bcrypt (for passwords)
* Testing - Rspec, Capybara, Database Cleaner (for test database), Rubocop, Coveralls

Screenshots
----

![Front Page](https://github.com/AlexHandy1/chitter-challenge/blob/master/public/img/Minimalitter-chitter.png)

![Sign-up](https://github.com/AlexHandy1/chitter-challenge/blob/master/public/img/Minimalitter-chitter-sign-up.png)

Further Features
----

* User profiles
* Forgotten password retrieval