Chitter Challenge
=================

#Setup:
1. To launch the app run '''bin/rails server''' from the directory root.
2. To set up the database run '''rails db:migrate''' once or maybe 4 times ;/

#Features:

## Completed

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

## Completed - ish

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

## Incomplete

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep

***

# Technical Approach:

I explored using a ORM to complete the challenge.
This involved setting up a Rails app that used the ActiveRecord ORM.
The app consisted of 4 main objects Chitter / Peep / Session / User
Peep handled the creation and reading of posts.
Session / User enabled user login and storage and retrieval of session data.
bcrypt gem was used to manage password entry securely.
Bootstrap gem was used very briefly at the end to add some styling.



### Rails Conflicts ###

conflict  README.md       <<< kept makers
conflict  Rakefile        <<< replace with rails
conflict  .ruby-version   <<< empty so added rails
conflict  .gitignore      <<< added rails content
conflict  Gemfile
