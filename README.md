Chitter
=======

### Ruby // Sinatra application

 A Twitter clone built using Sinatra, DataMapper ORM, DatabaseCleaner, BCrypt and PostgreSQL.


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
I want to post a message (peep) to chitter
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

![Alt text](https://github.com/JessicaBarclay/chitter-challenge/blob/master/links/testcoverage.png "testcoverage")

### Functionality

### Users can sign up to Chitter

*Username and email must be unique*
*Passwords must match for successful sign up*
*BCrypt ensures safe storage of passwords*

![Alt text](https://github.com/JessicaBarclay/chitter-challenge/blob/master/links/signup.png "signup")

![Alt text](https://github.com/JessicaBarclay/chitter-challenge/blob/master/links/password-confirmation.png "password-confirmation")

### Users can Peep to the /peep padding-left

*Peeps are displayed at /peeps*

![Alt text](https://github.com/JessicaBarclay/chitter-challenge/blob/master/links/time-to-peep.png "time-to-peep")

### Users can log in and out of Chitter

*After signing up Users can log in and out of Chitter*
*Using Sinatra sessions and Rack MethodOverride to successfully log out a User*
