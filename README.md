Chitter Challenge
=================

This app is a basic social media platform for Makers students based on the popular platform 'Twitter'.

Users can post messages about their learnings and thoughts, which all students can see. A user needs to log in to post and see peeps.

I created this programme as part of a challenge at [Makers Academy](https://makers.tech).

* [Screenshots](#Screenshots)
* [Getting started](#Getting-Started)
* [Usage](#usage)
* [Tech stack](#tech-stack)
* [Running tests](#Running-tests)
* [User Stories](#User-stories)
* [How I built it](#How-i-built-it)

## Screenshots ##

![Signup](/public/images/signup.png)
![Login](/public/images/login.png)
![Create peep](/public/images/create_peep.png)
![View peeps](/public/images/view_peeps.png)

## Getting Started ##

1. Install Ruby version 2.7.2.
2. Fork this repo, and clone to your local machine. Navigate into the folder.
3. Run the command `gem install bundle` (if you don't have bundle already).
4. When the installation completes, run `bundle`.

## Usage ##

1. Set up test and development databases locally:

  ```shell
  $ rake setup
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
- **Testing and code quality:** RSpec, Capybara, Simplecov
- **Database:** Postgresql

## Running tests ##

```shell
$ rspec
```
## User Stories ##

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

As a Maker 
So that I can see who posted the peeps
I want to see the names of the creators displayed

```

*below stories still to be implemented*

```
ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep

```

### Functionality ###

1. You have to be logged in to see the peeps.
2. Makers sign up to chitter with their username, email, password.
3. The username and email are unique.
4. Peeps (posts to chitter) have the username of the maker.

## How I built it ##

### Class Diagrams ###

1. 

| Object: |**Peep**| | ||
|:------:|:------------:|:-:|:-:|:-:|
|**Attributes:**|Username|Text|Time|||
|**Class Methods:**|all|create|time|

2. 

| Object: |**User**| | |
|:------:|:------------:|:-:|:-:|
|**Attributes:**|Username|email|password||
|**Class Methods:**|create|find|authenticate|

### Database Designs ###

Table: Peeps

| id | username | peep | created_at |  
|:--:|:-------:|:-----:|:----:|
| 1 | CRISPR | "Hello world!" | 2021-09-25 17:50:49.865408+01 |

Table: Users

| id | username | email | password |
|:--------:|:-----:|:-----:|:--------:|
| 1 | CRISPR | crispr@yahoo.com | $2a$12$... |

#### Feature tests ####

1. A user can add a peep to chitter
2. A user can see all peeps in reverse chronological order
3. A user posts a peep and sees the time and date when it was posted
4. A user can sign up and get a confirmation
5. A signed-up user can log in
6. Users can't log in if they get their email wrong
7. Users can't log in if they get their password wrong
8. Users can log out
9. A user can see who wrote the peeps

#### Unit Tests ####

1. Peep.all returns all created peeps
2. Peep.create it creates a new peep that has the username of the maker
3. User.create it creates a new user 
4. User.find it finds a user by ID
5. User.authenticate returns a user given a correct username and password
6. User.authenticate returns nil given an incorrect email
7. User.authenticate returns nil given an incorrect password

