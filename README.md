Chitter
======

Application available here, via Heroku:
httpsasbafdbdf://chitter900.herokuapp.com/

Challenge
---------
I coded this application for my fourth weekend challenge at Makers Academy. The challenge was to create simple Twitter-style application that would allow users to post messages to a public stream.


Here are the user stories I followed:


```
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

As a Maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

Approach
--------
This challenge followed an intense week at Makers Academy, during which I learned to use relational databases within the context of Ruby-based web apps. The concepts were difficult, but now that I had understood them properly I was looking to implement them successfully as part of my weekend challenge submission.

I used the DataMapper gem to issue commands to the PostgreSQL databases I was working with, along with DatabaseCleaner in order to clean up the tables following testing (which I carried out via rspec). I also used BCrypt to implement password encryption, meaning that users can sign up and log in without their actual password ever touching the database.

The app follows a standard Sinatra structure, with views and models folders. I tried to follow important design principles like Separation of Concerns; my controller and views files are lean, with the encryption methods stored in the User model rather than in app.rb

As ever, I followed a test-driven development strategy, writing Capybara scenarios for each new feature before I coded it. This minimised errors and made logical flaws and assumptions apparent, speeding up the whole process of app creation.

Notes
-----

* All posts ('Peeps') can be viewed at the `/peeps` page, in reverse-chronological order and with a timestamp. To post their own Peeps, users need to sign up or log in with an existing account.
* The homepage (`/`) allows users to sign up or log in. New accounts are initialised as rows in the postGresql database's 'users' table.
* If a user tries to sign up with an email address or username that already exists within the database, he or she will be asked to sign up with different credentials.
* Users can log out successfully - their Peeps will remain visible within the public stream.

Setup
-----
The application is available online here: https://chitter900.herokuapp.com/

However, if you'd like to run it locally, here are the instructions:

1. Fork this repository and then clone it using `git clone <url>`
2. Run `bundle` to install the required gems
3. Install PostgreSQL using Homebrew: `brew install postgresql`. You may also need to run `ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents` and then `launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist`
4. Within `psql`, create two databases: `chitter_development` (required for rspec) and `chitter test`
5. Back in Bash run `rackup` and note the specified port number (likely 9292)
6. Visit `localhost/<specified port number>`

Enjoy!
