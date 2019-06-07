Chitter Challenge
=================
```                                                                            
                                              @@@                                 
                                            &@@@@@@@                             
                     %@                  @@@@@@@@@@@@.@@@@                     
                     @@@@               @@@@@@@@@@@@@@                    
                     @@@@@@&           @@@@@@@@@@@@@@@@@@&                     
                     @@@@@@@@@@/       @@@@@@@@@@@@@@@@                       
                      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                    
                      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/                        
                        @@@@@@@@@@@@@@@@@@@@@@@@@@@@@                          
                         @@@@@@@@@@@@@@@@@@@@@@@@@@@                           
                           @@@@@@@@@@@@@@@@@@@@@@@                             
                             (@@@@@@@@@@@@@@@@@@                               
                         %@@@@@@@@@@@@@@@@@@@@                                 
                     %@@@@@@@@@@@@@@@@@@@@@                                    
                           &@@@@@@@@@@@                                           
                                           
```

Week: 6 - Databases

Purpose: Friday solo challenge

Dates: 07/06/19

Link to challenge instructions: https://github.com/makersacademy/chitter-challenge/blob/master/README.md

----------------------------

#### Instructions for set-up

* bundle install
* rake setup
* rake chitter_db
* rackup

* Connect to psql
* Create the database using the psql command CREATE DATABASE db_name;
* Connect to the database using the pqsl command \c db_name;
* Run the query we have saved in the file 01_create_db_table.sql

----------------------------

#### Challenge

Create a full-stack Twitter clone that allows users to post messages to a public stream.

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

```
----------------------------

#### Notes on functionality:

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.

----------------------------
#### Roadmap

A future release may include the following added functionality and/or features:

* UX and CSS improvements
* In order to start a conversation as a maker I want to reply to a peep from another maker.
* As a Maker, so that I can stay constantly tapped in to the shouty box of Chitter, I want to receive an email if I am tagged in a Peep.

----------------------------
#### Technical Approach

Integrated a database into Web Application using the `PG` gem and `SQL` queries. 

If you'd like more technical challenge this weekend, try using an [Object Relational Mapper](https://en.wikipedia.org/wiki/Object-relational_mapping) as the database interface.

Some useful resources:
**DataMapper**
- [DataMapper ORM](https://datamapper.org/)
- [Sinatra, PostgreSQL & DataMapper recipe](http://recipes.sinatrarb.com/p/databases/postgresql-datamapper)

**ActiveRecord**
- [ActiveRecord ORM](https://guides.rubyonrails.org/active_record_basics.html)
- [Sinatra, PostgreSQL & ActiveRecord recipe](http://recipes.sinatrarb.com/p/databases/postgresql-activerecord?#article)

----------------------------
#### Project status

