Chitter Challenge
=================

Picture

About
-------
This is a challenge to create a simple twitter clone that allows users to post messages to a public stream. This was my first attempt at creating a full-stack web app.

Users can see all messages when they visit the page and have the option of posting anonymously. They can also sign up and then post to the message stream. All messages show the name, username, message content and time the message was posted. To view all messages posted by a user you can click on their username. Hastags can be used in the messages and when posted to the message stream they can be clicked; this will return a page will all messages that have hte same hashtags.

User Stories
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

```

Installation
----
### Requirements
You need to have ruby and postgreSQL installed
```
https://www.ruby-lang.org/en/downloads/
https://www.postgresql.org/download/
```

### Set Up

To get started clone this repo locally
```
git clone https://github.com/peter-james-allen/chitter-challenge.git
```

In the root folder run bundle to fetch dependancies
```
bundle install
```

Create a .env file in the root folder with your postgreSQL username and password
```
PG_USERNAME=your_username
PG_PASSWORD=your_password
```

Run the postgreSQL db migrations
```
psql -f db\migrations\01_create_chitter_db.sql
```

You are now ready to go. Check out the user guide to get started

User Guide
----
To start the program run rackup in the root folder
```
rackup
```
Then open your broswer navigate to
```
localhost:9292
```
You are now on the Chitter homepage!

### Add a peep
To send a peep to the timeline add your message in the box below, then hit enter or click on submit. The peep will appear on the timeline as an anonymous user with the date and time of submission. The timeline shows all peeps that have been submitted from newest to oldest. You can enter hashtags on your messages which can then be searched for later on.

### Sign up
To sign up for an account click on the 'Sign In' button in the top right hand corner, then click on the 'Sign Up' button, you will then be asked to enter your name, email, username and password. One you have doen this you will be automatically logged in and returned to the homepage. Note: An error will be raised if you try to sign up with a username and email combination that is already registered.

### Sign In
If you already have an account then click on the 'Sign In' button in the top right hand corner. Enter your username and password and click 'Sign In'. You will then be logged in and returned to the homepage. If you enter the incorrect username and password an error will be raised. Once you have signed in any peeps you send will be tagged with your name and username.

### Sign out
To sign out, click on the 'Sign Out' button in the top right hand corner. You will be signed out and returned to the homepage.

### Usernames
If you would like to see all peeps by one user then click on a username in the timeline. You will then be re-directed to a page showing peeps by only that user. The peeps are displayed as per the homepage on a timeline from newest to oldest.

### Hastags
If you would like to see all the peeps that mention a specific hashtag then click on a hashtag in the timeline. You will then be re-directed to a page showing all peeps that contain that hashtag. The peeps are displayed as per the homepage on a timeline from newest to oldest.

Testing
----

Testing was done with Rspec. To run the test suite first you have to create a test database
```
psql -f db\migrations\00_create_chitter_test_db.sql
```

You can now run the tests
```
rspec
```
