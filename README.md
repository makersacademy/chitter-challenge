:hatched_chick: Chitter 
=======

Makers Academy Bootcamp | Week 4 Weekend Challenge
----

The requirement for this end of week challenge was to build a small Twitter clone that allows the users to post messages to a public stream.

User Stories
-------

```
IMPLEMENTED

As a user
I want to post a message (peep) to chitter
So that I can let people know what I am doing  

As a user
I want to see the time at which it was made
So that I can better appreciate the context of a peep

As a user
I want to see all peeps in reverse chronological order
So that I can see what others are saying  

As a user
I want to sign up for Chitter
So that I can post messages on Chitter as me

As a user
I want to log in to Chitter
So that only I can post messages on Chitter as me

As a user
I want to log out of Chitter
So that I can avoid others posting messages on Chitter as me

```

Notes
-----
- Project set up following the [ruby web project setup list](https://github.com/makersacademy/course/blob/main/pills/ruby_web_project_setup_list.md)
- TDD with 100% test coverage
- Built using Ruby, HTML, CSS, Bootstrap, RSpec, Capybara, Sinatra  
- [![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)

Want to have a look?
------
- clone this repo
- navigate to chitter-challenge directory
- run bundle to ensure all gems available
- run rspec to check test coverage
- to set up the database : 
```
> connect to `psql`
> create the `chitter` database: CREATE DATABASE chitter;
> create the `chitter_test` database: CREATE DATABASE chitter_test;
> To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.
```
- to run the Chitter app:
```
rackup
```

#### Test Coverage
![TestCoverage](https://user-images.githubusercontent.com/10349072/151720462-501d524b-a5f3-48d0-b0d5-b678f7fb71c7.png)
#### Rubocop - no offenses
![image](https://user-images.githubusercontent.com/10349072/151720651-2816c719-45ab-4932-a1ee-94a1d0ce83af.png)







