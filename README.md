[![Build Status](https://travis-ci.org/thielsen/chitter-challenge.svg?branch=master)](https://travis-ci.org/thielsen/chitter-challenge)

Chitter Challenge
=================

Sample app is deployed to http://ec2-18-202-240-44.eu-west-1.compute.amazonaws.com

Test and Development Installation
----

Install Postgresql locally (http://www.postgresqltutorial.com/install-postgresql/)
In the app directory
- ```bundle install```
- create database - ```bundle exec rake db:create```
- add tables - ```bundle exec rake db:migrate```
- rackup to start app
- connect to http://localhost:9292

Production Installation
---

Install Docker (https://docker-curriculum.com/#setting-up-your-computer)
Point your docker-machine at the production instance
- ```docker-compose up --build```
- ```docker exec -it chitter-challenge_app_1 /bin/sh```
- on remote command line - ```rake db:migrate```
- connect to http://your_deployed_url

Test coverage
---

100% on simplecov

Technologies used
-------

- Application - Ruby, ActiveRecord, Bcrypt, Mail, Sinatra, Rack, Rake
- Testing - RSpec, Capybara, Orderly, Simplecov, Rubocop
- CI - Travis
- Database - Postgresql
- Hosting - AWS, Docker

Outstanding tasks
-------

Unfortunately I ran out of time for the final goal of emailing when a user is mentioned. The structure is in place with a method that takes a peep as and input and outputs the username if it finds a @user reference. In addition the logic to send an email is in place based on this but I did not have enough time to adequately BDD/TDD the implementation.

As part of this deploying a third docker container configured with sendmail would be good to handle the mail delivery.

It would also be good to rework so the app is fully RESTful. The spec did not go far enough to require this but functionality above and beyond what was requested could be achieved if this was the case.

User stories
-------

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
