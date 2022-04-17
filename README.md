# Chitter Challenge

```
 ██████╗██╗  ██╗██╗████████╗████████╗███████╗██████╗ 
██╔════╝██║  ██║██║╚══██╔══╝╚══██╔══╝██╔════╝██╔══██╗
██║     ███████║██║   ██║      ██║   █████╗  ██████╔╝
██║     ██╔══██║██║   ██║      ██║   ██╔══╝  ██╔══██╗
╚██████╗██║  ██║██║   ██║      ██║   ███████╗██║  ██║
 ╚═════╝╚═╝  ╚═╝╚═╝   ╚═╝      ╚═╝   ╚══════╝╚═╝  ╚═╝

```

## Task

I have been tasked to create a twitter clone that will let people post peeps (messages) shown in reverse chronological order - you will not need an account to see these peeps.\
\
Users will be able to register for Chitter by providing their email, name, username and password where the email and username must be unique.\
\
Peeps will show the username of their maker as the time and date that the peep was created.\
\
In order to do this task, I have used Ruby, Sinatra to create the server, RSpec and Capybara to do my unit and feature tests, Postgres to create my databases, HTML to do the webpage and CSS to stylise the webpages. 

## Instructions

Clone this repository to your desired location using `git clone https://github.com/mcsuGH/chitter-challenge.git` then run `gem install bundler` (if you don't already have bundler), and then use the command `bundle install`.\
\
Set up `chitter` database and `chitter_test` databases using the queries located at `db/migrations`. Use all 5 queries for the main `chitter` database but only the first 4 for `chitter_test` database as adding constraints onto the foreign key currently raises some errors in testing due to it not liking the stubbing.\
\
Run `localhost:9292` and click the `Register` button to make an account, it will automatically log you in once the account is created and you will able to post new peeps. If you instead wish to only see the peeps, you are able to go in as a guest and click the `See Peeps` button located on the homepage. This will allow you to see peeps but not post any. You can logout by using the `Sign out` button. If you wish to post more peeps, you can then use `Sign in` to sign back into your account rather than creating a new one.\
\
Here are a few screenshots to show what it looks like:
![Screenshot](https://i.imgur.com/QbvvDyv.png)
![Screenshot](https://i.imgur.com/dJ1VcWz.png)
![Screenshot](https://i.imgur.com/sPlVEFR.png)

## User Stories

```
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

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

Did not do:
As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

## References
```
https://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow&t=CHITTER
https://www.postgresql.org/docs/current/functions-datetime.html
https://github.com/jmondo/orderly
https://stackoverflow.com/questions/28558920/postgresql-foreign-key-syntax
https://www.w3schools.com/css/css3_buttons.asp

```
used the above for ASCII letters in banner on README\
used the above to store the current time the entry is made inside the database\
used the above gem to test reverse chronological order\
used the above to add foreign key to table with constraints (although only did on main table as when doing on test table it raises PG foreign key violation error when stubbing)\
used the above to do CSS

## Functionality yet to be added
- Email when tagged in a peep
- Use a ORM such as ActiveRecord
- Properly fix the PG violation errors when adding foreign key constraints to test database (currently left out constraints in test but using for main)
- Work on CSS further to make it all look nicer