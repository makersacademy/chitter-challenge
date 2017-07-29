Chitter Challenge
=================

![Chitter homepage](http://i.imgur.com/UXS0FVc.png)

Full instructions can be seen in [INSTRUCTIONS.md](INSTRUCTIONS.md)

A Twitter clone that will allow the users to post messages to a public stream.

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

As a Maker
So that I can contribute to a conversation
I want to reply to a peep from another maker.

As a Maker
So that I can appreciate the look of Chitter
I want Chitter to have nice CSS and style
```

---

Technologies
----

* Programming language: Ruby
* Sinatra web app
* Front end: HTML, CSS, Bootstrap
* Bcrypt for password security
* Used postgreSQL and Data Mapper (ORM) to save the data in databases.
* Test frameworks: Rspec, Capybara
* Hosted on Heroku at: ADD IN HERE LINK

-----

Functionality
------
* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Use bcrypt to secure the passwords. - TEST FOR THIS???
* You only can peep if you are logged in.

---

Instructions
---
View app online at: XXXXXXXXX

In your terminal:

Set up the database (if you haven't installed PostgreSQL already)

In your terminal run `brew install postgresq`

After homebrew has downloaded the software it will show you some installation instructions, follow them!

Make sure you run these commands after installing:
```terminal
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
```

You can check your installation by running `psql`
Set up a database with your username if it doesn't already exist. (see [here](https://github.com/ryandav/course/blob/master/bookmark_manager/walkthroughs/03_mac.md) for more instructions) if you need them.

In your terminal enter:

```
$ git clone https://github.com/ryandav/chitter_challenge
$ cd chitter_challenge
$ bundle install
$ createdb chitter_development
$ createdb chitter_test
$ rackup
```
In your browser visit: [http://localhost:9292/](http://localhost:9292/)

To run the tests:
```tests
rspec
```

If you want to use the send email when tagged in a peep functionality you need to create a `.env` file in the project folder that contains:
```
CHITTER_GMAIL_USERNAME="<your gmail email address>"
CHITTER_GMAIL_PASSWORD="<your gmail password>"
```

---

How to use Chitter

---

![Chitter homepage](http://i.imgur.com/UXS0FVc.png)

*Homepage*
- You can view the peeps, login or signup.

*Peeps (messages)*
- You can see all peeps in reverse chronological order
- you can search the peeps for key words
- You cannot post a peep unless you are logged in

*Sign up*
- Enter email, username, full name, password, and password confirmation

*Log in / Log out*
- Click on the log out button in the nav bar at the top right of the screen

*Once logged in*
- You can then post peeps
- You can delete peeps you posted if logged in
- View your profile by clicking on "Welcome, <Username>"

---

Design of Program
----

- app
- helpers -> chitter_helpers
- chitter_setup

*Models*
- User
- Peep
- Tag

*Views*
- layout
- index
- peeps -> index, new
- users -> index, new

*Controllers*
- users
- peeps

*public*
- style.css

----

Code Review
-----------

[code review rubric](docs/review.md).  

----

References:
To see how to structure the folders in my project
- [github.com/joemaidman](https://github.com/joemaidman/chitter-challenge)
