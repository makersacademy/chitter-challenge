Chitter Challenge
=================

This is program is a little Twitter clone that will allow the users to post messages to a public stream.

Sign in

![image](https://user-images.githubusercontent.com/29259526/36368159-e705dbe0-154d-11e8-9186-4acb2fcf3c9f.png)

Post a peep

![image](https://user-images.githubusercontent.com/29259526/36368436-19c6302e-154f-11e8-95f7-c99d3cb2dcf0.png)

Share a peep

![image](https://user-images.githubusercontent.com/29259526/36368457-39cd4268-154f-11e8-8c4a-ecbb9ff6524a.png)


View history

![image](https://user-images.githubusercontent.com/29259526/36368471-4c803442-154f-11e8-96bb-d7ded975852c.png)


User stories
-------

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

Getting started
---------------

## Installing
 
Clone this repo to your local directory
- $git clone https://github.com/jennymarin1989/chitter-challenge.git

Install dependencies
- Update Gemfile and run $bundle install
- $createdb chitter_development
- $rspec
- $rackup


Build with
----------
- Ruby 2.5.0
- Sinatra
- sql Postgres
- Database cleaner

Test with
-----------
- Capybara
- Rspec

To Improve
------------

This assigment was very challenging, I learnt a lot from it but I couldn't finish the implementation of log in, log out and user authentication. If given more time, I could have finished the harder user stories. 

Author
------
 Jenny Arenas
