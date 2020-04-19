# Chitter Challenge #
[![Build Status](https://travis-ci.org/lookupdaily/chitter-challenge.svg?branch=master)](https://travis-ci.org/lookupdaily/chitter-challenge)
[![Maintainability](https://api.codeclimate.com/v1/badges/22636cea6c62e030c822/maintainability)](https://codeclimate.com/github/lookupdaily/chitter-challenge/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/22636cea6c62e030c822/test_coverage)](https://codeclimate.com/github/lookupdaily/chitter-challenge/test_coverage)

This app is a basic social media platform for Makers students based on the popular platform 'Twitter'.

Users can post messages about their learnings and thoughts, which all students can see. A user needs to log in to post, but can see all peeps without logging in. Logged in users can also edit or delete their own peeps.

I created this programme as part of a challenge at [Makers Academy](https://makers.tech). See [Specification](#Specification) for more information on the program's requirements.

* [Getting started](#Getting-Started)
* [Usage](#usage)
* [Tech stack](#tech-stack)
* [Running tests](#Running-tests)
* [Specification](#Specification)
* [How I built it](#How-i-built-it)



## Getting Started ##

You can check out the app live at [chit-ter.herokuapp.com](https://chit-ter.herokuapp.com/), or follow the steps below to run it locally.

1. Fork this repo, and clone to your local machine. Navigate into the folder.
2. Run the command `gem install bundle` (if you don't have bundle already).
3. When the installation completes, run `bundle`.

## Usage ##

1. Set up test and development databases locally:

  ```shell
  $ rake db: create
  $ rake db:migrate
  ```

2. You can run the app on a local server and open in your browser:

```shell
$ rackup
```

Open your browser and visit [localhost:9292](http://localhost:9292/).
Sign up and start posting!

## Tech Stack ##

- **Languages:** Ruby
- **Frameworks:** Sinatra
- **Testing and code quality:** RSpec, Capybara, Simplecov, Travis CI, Code Climate
- **Services:** Postgresql with Active Record
- **Styling:** Bootstrap CSS

## Running tests ##

```shell
$ rspec
```

## Specification ##

See original challenge instructions [here](Challenge-instructions.md)

### User Stories ###

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

*below stories still to be implemented*

```
ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep

```

### Functionality ###

1. You don't have to be logged in to see the peeps.
2. Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
3. The username and email are unique.
4. Peeps (posts to chitter) have the name of the maker and their user handle.
5. Your README should indicate the technologies used, and give instructions on how to install and run the tests.

## How I built it ##

### Sequence Diagrams ###

User stories 1-3

![Sequence Diagram 1](public/README-images/excalidraw-sequence-diagram-1.png)

### Class Diagrams ###

1. 

| Object: |**Tweet**| | ||
|:------:|:------------:|:-:|:-:|:-:|
|**Attributes:**|Text|Time|Username|||
|**Class Methods:**|Create|All|Find|Delete

2. 

| Object: |**User**| | |
|:------:|:------------:|:-:|:-:|
|**Attributes:**|Username|email|password||
|**Class Methods:**|Create|Find|email_unique?|username_unique?|


### Database Designs ###

Table: Tweets

| id | username | tweet | time |  
|:--:|:-------:|:-----:|:----:|
| PK | FK(users) | string | time |  
|1|lookupdaily|"Would you look at the weather"| 2020-01-13 11:20 GMT |

Table: Users

| username | name | email | password | join_date |
|:--------:|:-----:|:-----:|:--------:|:-----------:|
| string(PK) | string | string | string(authenticated?) | date |
|1|lookupdaily| Liz Daly | test@gmail.com| *** | 2020-01-13 11:00 GMT |

### Designing tests ###

When planning my code I thought about the tests I might need, and tried to order them by simplicity

#### Feature tests ####

1. When visiting app - user sees all tweets with a timestamp
2. User sees all tweets in reverse chronological order
3. User can sign up and gets a confirmation message
4. User can log in
5. User can add a tweet *when* logged in
5. User can log out
6. User cannot access create peep form without logging in
7. If message includes an @symbol the peep contains a link
8. If user clicks on a tag in a peep it takes them to user's profile


#### Unit Tests ####

1. Tweet.all runs a database query to show all tweets with time stamp
2. Tweet.all orders tweets in reverse chronological order
3. User.create adds a user to a database table
4. Object on user?? Adds a users details to session
5. Object on user?? Removes a users details from session
6. Tweet.create adds a new tweet IF session contains a user
7. User - check an email is unique
8. User - check a password is unique
   

#### Edge Cases ####

* Null fields
* User tries to sign up with a username or email that already exists
* User enters '' or "" in body
* Tag contains a symbol at the end (e.g. !)

## Further Improvements ##

* User receives an email notification when another user tags them in a peep
* Change date on peep to how long ago it was posted - e.g. '1 hour ago, 1 day ago'