# Chitter Challenge
-------
```
                .-'-._
               /    /``
           _.-''';  (
 _______.-''-._.-'  /
 ====---:_''-'     /
          '-=. .-'`
            _|_\_
```
### Overview
-------
Makers Academy weekend challenge to create a small Twitter clone webapp that will allow the users to login and post messages to a public stream.

### How to Install

The webapp has been developed on Sinatra, a rack based platform, so to install clone this repo, make sure Homebrew and Ruby 2.6.5 is installed then:
- move to the root directory in terminal
- run ``` gem install rake ```
- run ``` rake ```
- run ```rackup``` to start server on localhost port 9292

The rake command will install the DBMS 'postgresql', install required gems, remove any old chitter databases and then create new ones for the project.

For email functionality ensure the following environment variables have be set up correctly before running ```rake```
- ENV['smtp_server'] - address of your email smtp server e.g. 'smtp.gmail.com'
- ENV['smtp_server_port'] - port of your email smtp server e.g. 25
- ENV['email_domain'] - domain of your email address e.g. 'gmail.com'
- ENV['email_username'] - username (first part) of your email address e.g. 'myname'
- ENV['email_password'] - password of your email account e.g. 'securepassword123'

-------

### Customer Requirements

#### Base Requirements
```
As a Maker
So that I can let people know what I am doing
I want to post a message (peep) to chitter
```
```
As a maker
So that I can see what others are saying
I want to see all peeps in reverse chronological order
```
```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```
```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```

#### Additional Requirements
```
As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter
```
```
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```
```
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```
-------
### Approach

#### Extract Scope
- Post on chitter homepage are in reverse chronological order and can be viewed by the public and logged in users
- User can post messages on chitter which include username, display name, and time of post
- To post on chitter a user must sign up with email, password, displayname and handle
- Ability to login to post and logout afterwards
- If a users handle is mentioned in message, an email is sent to the mentioned users email
- Replies can be added to posted messages

#### Objects
- app_controller - controls models, views, and routes
- views:
  - homepage
    - shows messages
    - shows last action
    - ability to sign in
    - ability to post/comment (only if logged in) - 160chars max
    - ability to sign out (only if signed in)
  - signup
    - sign up (only if not signed in)
- models:
  - database connection - connects to relevant database and runs sql command
  - message
    - returns message objects for view
    - returns 10 most popular tags for view
    - extracts usernames and tags from message
    - adds message to database
  - email client - sends user email upon mention in message or comment
  - user - authenticates user and reveals post fields in view
- database:
  - users table - fields: id, username, email, password_hash, display_name
  - messages table - fields: id, text, fk_user_id, timestamp (one user to many message)
  - comments table - fields: id, text, fk_message_id, fk_user_id, timestamp (one message/user to many comments)
  - tags - fields: id, tag, (many tags to many messages/comments)
  - tags_messages_comments join table - fields: id, fk_message_id, fk_comment_id

### Process
#### Prerequisites
- Create filestructure
- Create databases using Rakefile

#### Model
- TDD database_connection


---------
---------
## Additional Notes

If you'd like more technical challenge this weekend, try using an [Object Relational Mapper](https://en.wikipedia.org/wiki/Object-relational_mapping) as the database interface.

Some useful resources:
**DataMapper**
- [DataMapper ORM](https://datamapper.org/)
- [Sinatra, PostgreSQL & DataMapper recipe](http://recipes.sinatrarb.com/p/databases/postgresql-datamapper)

**ActiveRecord**
- [ActiveRecord ORM](https://guides.rubyonrails.org/active_record_basics.html)
- [Sinatra, PostgreSQL & ActiveRecord recipe](http://recipes.sinatrarb.com/p/databases/postgresql-activerecord?#article)





Automated Tests:
-----

Opening a pull request against this repository will will trigger Travis CI to perform a build of your application and run your full suite of RSpec tests. If any of your tests rely on a connection with your database - and they should - this is likely to cause a problem. The build of your application created by has no connection to the local database you will have created on your machine, so when your tests try to interact with it they'll be unable to do so and will fail.

If you want a green tick against your pull request you'll need to configure Travis' build process by adding the necessary steps for creating your database to the `.travis.yml` file.

- [Travis Basics](https://docs.travis-ci.com/user/tutorial/)
- [Travis - Setting up Databases](https://docs.travis-ci.com/user/database-setup/)
