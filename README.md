# Chitter Challenge
### A twitter clone. 
- Non-registered users can view all peeps.
- Registered users can view all peeps and post their own. 

#### Set-up:
```
git clone https://github.com/EsamAl-Dabagh/chitter-challenge.git
cd chitter-challenge
bundle
rackup
```

#### Tests:
To run tests use `rspec`.
Currently 100% test coverage. 

#### Technologies used: 
* Ruby
* Sinatra
* PostgreSQL
* BCrypt

#### User Stories

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a Maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```
