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

Week: 6 - Databases (Integrating a database into a software application)

Purpose: Friday solo challenge

Dates: 07/06/19

Link to challenge instructions: https://github.com/makersacademy/chitter-challenge/blob/master/README.md

----------------------------

#### INSTALLATION INSTRUCTIONS

* bundle install
* rake setup
* rake chitter_db
* rake setup_test
* rake chitter_db_test
* rackup

----------------------------

#### NOTES & QUERIES FOR REVIEWERS 

* How can you RSpec/Capybara test that the peeps are displayed in reverse-chronological order? (presumably a feature test?) 
* How can you validate that new sign-ups (e.g. handle and email) on registration are unique? i.e. currently the same user can sign up again and again via the SQL query: INSERT INTO users_table.
* Outstanding: Authentication feature - very confused on how to call out the unique ID attribute on User in the #authenticate and #create class methods. How do I test and implement the authentication feature?

----------------------------

#### ROADMAP FOR FURTHER DEVELOPEMENT

A future release may include the following added functionality and/or features:
* ORM implementation, via ActiveRecord
* Password validation on new user registration to ensure passwords are matching and of sufficient complexity
* As a Maker, So that only I can post messages on Chitter as me, I want to log in to Chitter.
* As a Maker, So that I can avoid others posting messages on Chitter as me, I want to log out of Chitter.
* In order to start a conversation as a maker I want to reply to a peep from another maker.
* As a Maker, so that I can stay constantly tapped in to the shouty box of Chitter, I want to receive an email if I am tagged in a Peep.
* Tests outstanding for Chitter Time and Chronological order of Peeps - use of the Timecop gem (Time.local, Timecop.freeze(now), etc?) 

----------------------------

#### CHITTER USER STORIES

Twitter clone that allows users to post messages to a public message board.
Full stack web application: integrated database into Web Application using Ruby, Sinatra web framework, Twitter Bootstrap, `PG` gem and `SQL` queries. 


```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```
```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```
```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```
```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```
