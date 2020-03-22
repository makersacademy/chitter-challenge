### [Makers Academy](http://www.makersacademy.com) - Week 4 Weekend Project

Chitter Ruby Challenge - original README [here](https://github.com/makersacademy/chitter-challenge/blob/master/README.md)
-

[Outline](#Outline) | [Specifications](#Specifications) | [User Stories](#User_Stories) | [Installation Instructions](#Installation_Instructions) | [Tech stack](#Tech_stack) | [Future work](#Future_work)

## <a name="Outline">Outline</a>

Build a clone of Twitter.

## <a name="Task">The Task</a>

Practice working with MVC webapps and RESTful routing by building a clone of Twitter from scratch.

## <a name="User_Stories">User Stories</a>

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

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

## <a name="Installation_Instructions">Installation Instructions</a>

1. Clone this repo to your local machine and cd into it
2. Run the command `gem install bundle` (if you don't have bundler already)
3. When the installation completes, run `bundle`
4. Run the server with command `rackup`
5. Set up the required databases:
    A. Connect to psql in terminal
    B. Create the databases using the psql commands: `CREATE DATABASE chitter;` and `CREATE DATABASE chitter_test;`
    C. Connect to the first database using the pqsl command `\c chitter`
    D. Run the queries we have saved in the file 01_create_peeps_table.sql and 02_add_time_to_peeps.sql
    E. Change into the chitter_test database using the pqsl command `\c chitter_test` and once again execute the queries we have saved in 01_create_peeps_table.sql and 02_add_time_to_peeps.sql.
6. Visit `localhost:9292` in your browser and play away!
7. Tests can be run using RSpec. Run command: `rspec`

## <a name="Tech_Stack">Tech Stack</a>

Front-end:
- HTML & CSS

Back-end:
- Ruby
- Sinatra
- PostgreSQL

Testing:
- RSpec
- Capybara

Linting:
- Rubocop

## <a name="Future_Work">Future Work</a>

Right now a user can post a peep, and view peeps in reverse chronological order with a timestamp on each. On a revisit of the project, I would like to build out the rest of the functionality described in the user stories. 