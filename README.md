# Chitter - A Twitter clone
#### (Makers Academy Week 4 - Weekend challenge)

- Users can sign up for an account and then post Peeps to the public stream.

- Peeps can only be posted when a user is logged in.

- The peeps are displayed in reverse chronological order and show the time at which they were posted.

Visit the app at https://chitter-krd.herokuapp.com

#### How to use

You will need to install PostgreSQL if you haven't already. In your terminal run ```brew install postgresql``` and follow the installation instructions.
After installing, run these commands:
```
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
```

Check your installation by running ```psql```. You may need to set up a database using your username and you can do this by following [these instructions](https://github.com/makersacademy/course/blob/master/bookmark_manager/walkthroughs/03_mac.md).

Next, enter the following in your terminal:
```
# Clone the repo
git clone git@github.com:kitkat119/chitter-challenge.git

# Move into the directory  
cd chitter-challenge    

# Create the databases
createdb chitter_development    
createdb chitter_test

# Install dependencies
bundle install   

# Start the server
rackup    
```
In your browser visit https://localhost:9292


To run the tests:
```
rspec
```


Features:
-------

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
