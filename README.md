Challenge:
-------

We are going to write a small Twitter clone that will allow the users to post messages to a public stream.

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
```
Not yet implemented:

```
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep

```

Here is my original diagram when I was planning this project.

![domain model](/Users/karenroberts/projects/chitter-challenge/images/chitter_diagram.png)

![git domain model](https://github.com/RobertsK284/chitter-challenge/blob/master/images/chitter_diagram.png)


Notes:

I looked up Nazz Kadri's solution, especially for some of the trickier tests  and getting past some of the errors I was seeing from the Registration part onwards.

https://github.com/nazzkadri/chitter-challenge


Database Setup Instructions:

) `brew install PostgreSQL`

2) `ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents`

3) `launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist`

4) Run: `psql PostgreSQL`

5) Then, create the database in psql using:
`CREATE DATABASE chitter;`.

6) Connect to the database using:
`\c chitter`

7) Run the query in the file,
*01_create_users_table.sql*

8) Run the query in the file,
*02_create_peeps_table.sql*

9) If you wish to run the tests, repeat steps 5 - 8 but this time creating a database called 'chitter_test'.

Ruby Gem Installation Instructions:

1) Run: `bundle` or `bundle install` if you have not previously run bundle on your machine

How To Run:

1) Run `rackup` in the command line
2) visit `http://localhost:9292/` in your browser.
