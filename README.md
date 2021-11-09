<img width="1433" alt="Screenshot 2021-11-08 at 23 21 50" src="https://user-images.githubusercontent.com/76533997/140888778-2e64841f-8153-4e8d-a244-2869229bf749.png">

## Challenge
Twitter clone allowing users to post messages to a public stream. 

## Tools:
This website is built using Ruby, Sinatra, PostgreSQL, RSpec, Capybara, HTML and CSS.

## Deployment
This website is deployed here:

## Features:

I want to post a message (peep) to chitter

<img width="335" alt="Screenshot 2021-11-09 at 08 45 35" src="https://user-images.githubusercontent.com/76533997/140891878-3180f6d8-f26a-478f-97c4-a0a08c128687.png">
<img width="510" alt="Screenshot 2021-11-09 at 08 56 40" src="https://user-images.githubusercontent.com/76533997/140893455-0b102796-b85a-4d0f-a69d-ebbc79ec59b0.png">

-------

I want to see all peeps in reverse chronological order

I want to see the time at which it was made

<img width="507" alt="Screenshot 2021-11-09 at 08 59 07" src="https://user-images.githubusercontent.com/76533997/140893947-9cb552ef-3cf1-4cba-8aa5-68e406327ba7.png">

--------

I want to sign up for Chitter

<img width="540" alt="Screenshot 2021-11-09 at 09 01 21" src="https://user-images.githubusercontent.com/76533997/140894246-39deda0d-3c35-48b2-999f-aee3c314b1c8.png">

--------

I want to log in to Chitter

<img width="547" alt="Screenshot 2021-11-09 at 09 01 32" src="https://user-images.githubusercontent.com/76533997/140894299-f39dfc98-e2c8-43a5-ba74-eaa41e816f3d.png">

---------
I want to log out of Chitter

<img width="325" alt="Screenshot 2021-11-09 at 09 03 29" src="https://user-images.githubusercontent.com/76533997/140894550-1fe50e29-ee93-46cd-b925-a6973482e330.png">

---------

Extra features:

Add Tag

<img width="522" alt="Screenshot 2021-11-09 at 09 09 10" src="https://user-images.githubusercontent.com/76533997/140895395-2a9e76a2-baa5-47dc-b87a-f07c92998c86.png">

View tagged peeps

<img width="515" alt="Screenshot 2021-11-09 at 09 09 29" src="https://user-images.githubusercontent.com/76533997/140895405-44952592-411d-45b9-bd8a-0c110658d7f2.png">

------------


To do:

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep

----------
## Planning!

I implemented the MVC model, following this planning process in implementing each user story

<img width="653" alt="Screenshot 2021-11-09 at 12 04 08" src="https://user-images.githubusercontent.com/76533997/140921179-c42c64ab-5ef7-4934-a447-b13169b5a0e5.png">

-------------

## Database
<img width="729" alt="Screenshot 2021-11-09 at 13 07 34" src="https://user-images.githubusercontent.com/76533997/140932075-724d4fc8-9dd9-4066-82a8-02463577754d.png">

## Routes

<img width="637" alt="Screenshot 2021-11-09 at 13 25 00" src="https://user-images.githubusercontent.com/76533997/140932131-f7ba31ac-4bfb-4aa7-8142-88d5797ded76.png">

-------------

How to install the app

## Database set-up

1. Install (Homebrew: brew install postgresql) and connect to psql via terminal
2. Create the database using the psql command: 
    
    "CREATE DATABASE chitter;" 
    
  and the test database 
    
    "CREATE DATABASE chitter_test;"
 3. Connect the databases using the pqsl command \c;
 4. Run queries in 'db/migrations' directory.

## How to use this app

How to run the tests

Notes on functionality


