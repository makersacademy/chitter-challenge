### [Makers Academy](http://www.makersacademy.com) - Week 4 Weekend Project

Chitter Ruby Challenge - original README [here](https://github.com/makersacademy/chitter-challenge/blob/master/README.md)
-

[Outline](#Outline) | [Task](#Task) | [User Stories](#User_Stories) | [Installation Instructions](#Installation_Instructions) | [Future work](#Future_work)

## <a name="Outline">Outline</a>

A clone of the popular social media platform which rhymes with chitter.
Technologies used: Ruby, Sinatra, PostgreSQL, RSpec, Capybara.

## <a name="Task">The Task</a>

This challenge started with going over the foundational skills from this week's Bookmark Manager challenge, such as using a database to persist data across sessions. It also allowed me to hone my knowledge of some more advanced topics such as RESTful routes and use of the MVC approach to web apps.

## <a name="User_Stories">User Stories</a>

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

## <a name="Installation_Instructions">Installation Instructions</a>

1. Clone this repo to your local machine and cd into it
2. Run the command `gem install bundle` (if you don't have bundle already)
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

## <a name="Future_work">Future work</a>

Due to time constraints, only the first three user stories are built to specification. 