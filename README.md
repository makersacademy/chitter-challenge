Chitter
=======

### Ruby // Sinatra application

 A Twitter clone fully deployed to Heroku built using Sinatra, Capybara, RSpec, RESTful concepts, DataMapper ORM, DatabaseCleaner, BCrypt and PostgreSQL.

[Heroku application](https://chitter-time.herokuapp.com/)

### Application built using Sinatra's modular style

#### User stories this app considers

```
As a User
So that I can post messages on Chitter as me
I want to sign up for Chitter
```
```
As a User
So that I can post messages on Chitter as me
I want to log in to Chitter
```
```
As a User
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```
```
As a User
So that I can let people know what I am doing  
I want to post a message (peep) to Chitter
```
```
As a User
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```
```
As a User
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```
### Installation

```
$ git clone
$ bundle
$ createdb chitter_development
$ createdb chitter_test
$ rspec
$ rackup
```

### Test coverage 100%

![Alt text](https://github.com/JessicaBarclay/chitter-challenge/blob/master/links/chitter-test-coverage.png "chitter-test-coverage")

![Alt text](https://github.com/JessicaBarclay/chitter-challenge/blob/master/links/file-tree.png "file-tree")

### Functionality

### Users can sign up to Chitter

*Username and email must be unique*
*Passwords must match for successful sign up*
*BCrypt ensures safe storage of passwords*

![Alt text](https://github.com/JessicaBarclay/chitter-challenge/blob/master/links/signup.png "signup")

![Alt text](https://github.com/JessicaBarclay/chitter-challenge/blob/master/links/password-confirmation.png "password-confirmation")

### Users can Peep to the /peeps feed

*The option to Peep is only displayed when logged in*
*Peeps are displayed in reverse chronological order, displaying the time and day they were created*

![Alt text](https://github.com/JessicaBarclay/chitter-challenge/blob/master/links/time-to-peep.png "time-to-peep")

### Users can log in and out of Chitter

*After signing up Users can log in and out of Chitter*
*Using Sinatra sessions and Rack MethodOverride to successfully log out a User*
