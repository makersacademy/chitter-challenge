# Chitter Challenge
-------
```
                .-'-._
               /    e<
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

The webapp has been developed on Sinatra, a rack based platform, so to install clone this repo, move to root directory, run the ```bundle``` command to install the required gems. Please make sure you have postgresql install by running the following command in terminal: ``` brew install postgre ``` then use the ```rake``` command to to create the Postgresql database. Finally run ```rackup``` (or other rackup application) in the root directory to start the application running on the local host.

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
    - ability to post/reply (only if logged in)
    - ability to sign in/sign up (only if not signed in)
    - ability to sign out (only if signed in)
- models:
  - database connection
  - message
  - email
- database:
  - users table - fields:
  - messages table - fields: (one user to many message)




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
