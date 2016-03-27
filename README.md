Chitter Challenge
-------------------
--------------------

Makers Academy Week 04 Weekend Challenge  
Author: Phoebe Greig

Task
------

To build a Twitter clone that will allow the users to post messages to a public stream.

User Stories:
---------------

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

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

In branch 'comments', I have also included the below user story:

```sh
As a Maker
So that I can start a conversation
I want to reply to a peep from another maker
```

Instructions
--------------

* Clone this repo
* Run bundle to install dependencies
* Using brew, install the postgresql package and follow the instructions carefully
* Create two databases in Postgres:  

   * chitterplus_development      
   * chitterplus_test 

Note: The above tables are for the sessions branch. 
For the master branch, create the databases:  

   * chitter_development      
   * chitter_test 
* From the root directory in the command line, run Sinatra using ruby app.rb
* Visit localhost:4567 in your browser to view/sign up to Chitter!
