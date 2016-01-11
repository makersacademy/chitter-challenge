[![badge](https://img.shields.io/badge/build-passing-green.svg?style=flat)]

<p align="center">
  <img src="https://cloud.githubusercontent.com/assets/15385627/12234274/badb1db2-b863-11e5-8921-d6e21758f68d.png" />
</p>
a little Twitter clone that allows users to post messages to a public stream.

Features:
-------

```sh
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

Notes on functionality:
------

* This app has been created using Rspec for BDD, TDD purposes.
* Makers sign up to chitter with their email, password, name and a user name (e.g.  joe_bloggs@makers.com, sdf3t, Joe Bloggs, big_joey).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* Used bcrypt to secure the passwords.
* Used data mapper and postgres to save the data.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.
