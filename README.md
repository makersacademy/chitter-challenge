# Chitter Challenge
Week 4 - Weekend challenge

Summary
----

This web application allows a user to post _peeps_.

To use this repo
----
```sh
$ git clone git@github.com:[antcin]/chitter-challenge.git
$ cd chitter-challenge
$ bundle
$ rake teardown # deletes test and production databases
$ rake create_databases # Creates test and production databases
$ rake setup # Creates required tables
$ rackup -p 9292
```

In a web browser, visit `localhost:9292` and follow the instructions.


Functionalities
----
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
```

Bugs and issues
-------
- Currently, everyone can post peeps, whether or not they are registered.
- The sign up functionality is available, however the _peeps_ and _users_ tables are not linked, yet.
- When prompted to enter their credentials, users that do not enter either email address, password or username (all three items required) and click on _Sign up!_ directly, a Sinatra ``NoMethodError`` page appears.

Reflections
-------
To tackle this challenge, I decided to take a detour from the contents learnt doing the _Bookmark Challenge_. and use [DataMapper](http://http://datamapper.org/). I watched a video and read a few tutorials during the week, and was quite interested in trying to use this ORM tool. It has definitely not been easy; despite the apparent ease of use and implementation of this gem, I found it rather challenging to test drive the development of the web app. Had I decided to stick to what I learnt while working on the _Bookmark Challenge_, I feel like I would have probably managed to implement more functionalities. Nonetheless, it has been great to learn something completely new and manage to set up the project. Obviously, input from students from previous cohorts has been massively useful. Specifically, I noticed @marcusfgardiner encountered similar issues to mines, see below:

- Test coverage for Rakefiles, how does it work?
- Annoying error:
```sh
.rvm/gems/ruby-2.5.0/gems/data_objects-0.10.17/lib/data_objects/pooling.rb:149: warning: constant ::Fixnum is deprecated
```  
Is it because `DataMapper` is an old tool and some of the components are outdated?
- Linking database tables: errors were raised when using the [associations](https://datamapper.org/docs/associations.html) syntax to link the tables. Most likely I was doing something wrong, but it would be nice to find out more about this.

Need to improve
-------
- Understanding of Sinatra Routes
