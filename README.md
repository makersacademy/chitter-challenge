Chitter Challenge
=================

<br>

## Challenge:
---

Makers Academy bootcamp - End of Week 4 (weekend challenge): to make a Twitter clone. <br>

Learnt about databases during the week. Used `TablePlus`, `psql` and `Ruby` code to try and create a bookmark manager page (can be seen on repo: database). <br>

Given user stories, I tried to implement into code using the previous weeks' learning. <br>

Below are the user stories, set-up, testing and database instructions. <br>

**I managed to complete the first 3 stories due to time constraints.**

<br>

## User Stories
---
<br>

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

<br>

## Set-up
---
1. Fork this repo
2. Clone onto local machine
3. Run `bundle install` to install all required gems
4. On the main folder (`chitter-challenge`) run `rackup`
5. Type `localhost:9292/home` in your local browser to access the home page

<br>

## Testing
---
- On main folder `chitter-challenge` run `rspec` in command line
- Can also use `rubocop` in command line to see indentation/missing newline etc. offenses

<br>

## Database
---
Can build a database using `psql`:
1. Open command line and type `psql`
2. type `CREATE DATABASE chitter;` <-- semi-colon is very important
3. Connect to chitter database: `\c chitter;`
4. Run query saved in file `01_create_chitter_table.sql`

The above can be repeated to make a test database by substituting step 2 `chitter` with `chitter_test`

## Moving forward
---
- If time constraints weren't a factor, I would've tackled the fourth user story
- This would've involved me implementing a user class (with separate files, feature and unit tests)
- This way a user could sign up to chitter
- This would have led me to making a log in page that takes a user's email address and password so they could solely post on their behalf
- The above would have led to making a log out element on the page so they could log out and not post anymore