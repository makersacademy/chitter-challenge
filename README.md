<img width="1433" alt="Screenshot 2021-11-08 at 23 21 50" src="https://user-images.githubusercontent.com/76533997/140888778-2e64841f-8153-4e8d-a244-2869229bf749.png">

## Challenge
Basic Twitter clone allowing users to post messages to a public stream. 

## Tools:
This website is built using
            <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/ruby/ruby-original.svg" alt="ruby" width="40" height="40"/> 
              <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/postgresql/postgresql-plain.svg" alt="postgresql" width="40" height="40"/>
             <img
src="https://raw.githubusercontent.com/devicons/devicon/master/icons/html5/html5-original.svg" alt="html5" width="40" height="40"/>
and <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/css3/css3-original.svg" alt="css3" width="40" height="40"/>.

Sinatra, Capybara and RSpec used for testing.

## Deployment
This website is deployed here:

## How to use this app


## Features:

#### User stories:

##### Post a message (peep) to chitter
*As a Maker  
So that I can let people know what I am doing  
I want to post a message (peep) to chitter*

<img width="335" alt="Screenshot 2021-11-09 at 08 45 35" src="https://user-images.githubusercontent.com/76533997/140891878-3180f6d8-f26a-478f-97c4-a0a08c128687.png">
<img width="510" alt="Screenshot 2021-11-09 at 08 56 40" src="https://user-images.githubusercontent.com/76533997/140893455-0b102796-b85a-4d0f-a69d-ebbc79ec59b0.png">

-------

##### View peeps in reverse order  

*As a maker  
So that I can see what others are saying   
I want to see all peeps in reverse chronological order*

##### View time of post
*As a Maker  
So that I can better appreciate the context of a peep  
I want to see the time at which it was made*

<img width="507" alt="Screenshot 2021-11-09 at 08 59 07" src="https://user-images.githubusercontent.com/76533997/140893947-9cb552ef-3cf1-4cba-8aa5-68e406327ba7.png">

--------

##### Sign up 

*As a Maker  
So that I can post messages on Chitter as me  
I want to sign up for Chitter*  

<img width="540" alt="Screenshot 2021-11-09 at 09 01 21" src="https://user-images.githubusercontent.com/76533997/140894246-39deda0d-3c35-48b2-999f-aee3c314b1c8.png">

--------

##### Login
*As a Maker  
So that only I can post messages on Chitter as me  
I want to log in to Chitter*

<img width="547" alt="Screenshot 2021-11-09 at 09 01 32" src="https://user-images.githubusercontent.com/76533997/140894299-f39dfc98-e2c8-43a5-ba74-eaa41e816f3d.png">

---------

##### Logout 
*As a Maker  
So that I can avoid others posting messages on Chitter as me  
I want to log out of Chitter*

<img width="325" alt="Screenshot 2021-11-09 at 09 03 29" src="https://user-images.githubusercontent.com/76533997/140894550-1fe50e29-ee93-46cd-b925-a6973482e330.png">

---------

#### Extra features:

##### Add Tag

<img width="522" alt="Screenshot 2021-11-09 at 09 09 10" src="https://user-images.githubusercontent.com/76533997/140895395-2a9e76a2-baa5-47dc-b87a-f07c92998c86.png">

<img width="515" alt="Screenshot 2021-11-09 at 09 09 29" src="https://user-images.githubusercontent.com/76533997/140895405-44952592-411d-45b9-bd8a-0c110658d7f2.png">

##### View tagged peeps

<img width="652" alt="Screenshot 2021-11-09 at 09 09 50" src="https://user-images.githubusercontent.com/76533997/140972748-aaf85d68-51e9-4e16-b482-ee5d721ca8f9.png">


------------

#### To do:

##### Email if tagged

*As a Maker    
So that I can stay constantly tapped in to the shouty box of Chitter    
I want to receive an email if I am tagged in a Peep*  

-----------

## Notes on functionality:

(complete) You don't have to be logged in to see the peeps.
(complete) Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
(complete) The username and email are unique.
(complete) Peeps (posts to chitter) have the name of the maker and their user handle.
(complete) Your README should indicate the technologies used, and give instructions on how to install and run the tests.

Bonus:
If you have time you can implement the following:

(nearly) In order to start a conversation as a maker I want to reply to a peep from another maker.
And/Or:

(complete) Work on the CSS to make it look good.



----------
## PLANNING & IMPLEMENTATION

## MVC

I implemented the MVC model, following this planning process in implementing each user story

<img width="653" alt="Screenshot 2021-11-09 at 12 04 08" src="https://user-images.githubusercontent.com/76533997/140921179-c42c64ab-5ef7-4934-a447-b13169b5a0e5.png">

-------------

## Database

I created the following databases 

<img width="729" alt="Screenshot 2021-11-09 at 13 07 34" src="https://user-images.githubusercontent.com/76533997/140932075-724d4fc8-9dd9-4066-82a8-02463577754d.png">

## Routes

These are all the routes this app uses

<img width="637" alt="Screenshot 2021-11-09 at 13 25 00" src="https://user-images.githubusercontent.com/76533997/140932131-f7ba31ac-4bfb-4aa7-8142-88d5797ded76.png">

-------------
## INSTALLATION

## How to install this app
Run <code>gem install bundler</code> if required, then:

<code>git clone https://github.com/Xfarya/chitter-challenge.git</code>  
<code>cd chitter-challenge</code>  
<code>bundle install</code>

## Database set-up

1. Install (Homebrew: <code>brew install postgresql</code>) and connect to psql via terminal
2. Create the database and the test database using the psql command: 
    
   
 
  main database 
 
  
    "CREATE DATABASE chitter;" 
   
  test database
  
    "CREATE DATABASE chitter_test;"
 3. Connect the databases using the <code>pqsl</code> command <code>\c</code>;
 4. Run queries in 'db/migrations' directory.

---------
## TESTING

## How to run the tests

Run 
  <code>rspec</code>
within the chitter-challenge directory.



