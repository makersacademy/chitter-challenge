Chitter
=======

This is a simple Twitter clone, allowing users to post messages (peeps) on their profile page and for users and non logged-in users to view everyone's peeps. This is built using [Sinatra](http://www.sinatrarb.com/) and [Postgres](http://www.postgresql.org/). Tests are written in [Rspec](http://rspec.info/) and [Capybara](http://jnicklas.github.io/capybara/). Used [bcrypt](https://github.com/codahale/bcrypt-ruby) to secure the passwords and [data mapper](http://datamapper.org/) to save the data to the Postgres database.

Getting Started
---------------

I work off a vagrant VM whose Vagrantfile you can find [here](https://github.com/DataMinerUK/MakersAcademy-VM). So when running this from the VM, put the Vagrantfile in the chitter directory and:

On the command line
```bash
vagrant up # This may take a while
sudo -i -u postgres
createuser -drS vagrant
createdb chitter_test
createdb chitter_development
exit
vagrant ssh
cd /vagrant
cd [where_ever_happens_to_be]/chitter
bundle install
```
To check run the version locally
```bash
rackup -p4567 --host 0.0.0.0
```
and go to localhost:4567 on your machine.

User Stories
------------

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

As a maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

Notes on functionality v1.0:
----------------------------

* Users sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker, their user handle and a time element.
* Non-logged users in can see peeps.
* Users can peep if they are logged in.

v2.0:
-----

* Signed in users can reply to another users peep
* The reply appears in the other users page under the peep with a note of who it was from
* The reply also appears on the users page with a note of who it was in reply to
* Non logged-in users cannot reply
* Peeps and replies cannot be blank
