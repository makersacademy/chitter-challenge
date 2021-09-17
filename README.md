# ~~Twitter~~ Chitter Chatter

## About

This project allows users to publish text publically on a forum based application, based on the application Twitter.

This project allows:

- Users to post messages
- Users can see posts that other users have added
- Users can view the date and time when the post was made
- Users can log-in to the application
- Users can sign-out of the application
- Users can get an email if they're tagged in a post

## How To Run

##### General Setup

- You must have a version of `Ruby` installed on your computer (`brew install ruby`), I used `v 2.7.2`
- You will need to have an instance of `PostgreSQL`
- In your Terminal:
  - Run `git clone https://github.com/EMDevelop/chitter-challenge.git`
  - For Ruby specific dependencies, run `bundle install`

## My Approach

##### Setup

- This project is a fork of `https://github.com/makersacademy/chitter-challenge`
- Understand the `User Stories`
- Create `Domain Models` from the User Stories

##### User Stories

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

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

##### Domain Model

`className = Chitter`
|methods |attributes|
|-|-|
|Chitter.show_all_messages() | |
|Chitter.add_message() | |
|Chitter.sign_up() | |

`className = Message`
|methods |attributes|
|-|-|
| .new() | @message :Hash (body: , create_date:) |

`className = Session`
|methods |attributes|
|-|-|
| Session.login() | @current_session Hash: @user_name|
| Session.logout() |

##### Database Model

###### Tables

`Table: Message`
|ID|message|createdate|
|-|-|-|
||||

`Table: Users`
|ID|user_name|password|
|-|-|-|
||||

###### Relationships

| table   | relationship | table |
| ------- | ------------ | ----- |
| Message | 1 - 1        | Users |
