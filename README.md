# Chitter Challenge

### Completed by Marek Schmidt
#### See Instructions and User stories below

## Context
This was the fourth weekend project I attempted while at Maker's Academy. When completing this I had four weeks' worth of practical experience in Ruby and Rspec, and two weeks experience using Sinatra, Capybara, and building web apps, and five days' experience working with PSQL as a database.

## Approach
I wanted to simulate Twitter with this challenge, but I really enjoy the styling of Slack. I decided to combine the two a bit to make my own layout. Particularly, I wanted to keep the project idea of Twitter but separate peeps by the day they were created.

This was quite a long project that included a few optional challenges. I knew this would be a tough week to finish the bonus challenges for due to never working with validation. I decided to focus more on the first four user stories and allow for the additional account validation if I had time.

I also made an effort to use a responsive design for this project, which turned out pretty well for the first attempt. It's not perfect in any sense of the word, but it is an improvement from last week.

There was a bit of a challenge allowing for apostrophes in the body of a peep. I solved this by replacing all apostrophes with a unique UTF-8 character "†". Obviously, this is not the best solution, but it is quite unlikely to cause problems unless someone used that character in a peep, in which case it would be replaced by an apostrophe when being displayed on-screen. I hope to find a better solution for PSQL queries in the future.

## Summary
The user acts as a member of the Chitter website. Unfortunately, I never got to account creation and validation, so in its current state it simply asks for your name instead of logging in or signing up. Once the user enters his / her name, a "peep" can be made and is added to the feed of all previous peeps. All peeps are stored in a local psql database on the user's machine. When viewing, the database is connected to and the peeps are retrieved including name, date, time, and text of each peep. When being displayed, these peeps are sorted in reverse chronological order both by the time created and the date created, meaning the newest peep will always be on top.

## State of project and changes to be made
The first four user stories have been satisfied, assuming that entering a name counts as "signing up". As i stated above, the rest have not been completed.

The main addition I would like to make is the ability to log in or sign up, with user information being stored in the same database in a new table.

I have only a few tests, but am at 100% test coverage. I have four offenses with rubocop, all of which have to do with long lines or long methods. I believe I could do some additional extracting into new methods to better use the SRP, but not now. Unfortunately, some long lines might be hard to clear up due to psql insertion queries.

## Feature testing
There is a folder called 'features' in the 'spec' folder specifically to test all main features of my program. For more detailed testing, however, try it yourself! Instructions are below.

## How to use

#### 1. Clone this repository

#### 2. Install the required gems
```
bundle install
```

#### 3. Set up your psql database
  * If you don't have psql installed, use Homebrew to install
  ```
  brew install postgresql
  ```

  * Allow Homebrew to start and stop the Postgres service
  ```shell
  ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
  launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
  ```

  * Start PSQL
  ```
  psql
  ```

  * Create a database
  ```
  CREATE DATABASE "chitter";
  ```

  * Connect to your new database
  ```
  \c chitter;
  ```

  * Create a table for peeps in the chitter database
  ```
  CREATE TABLE peeps(id SERIAL PRIMARY KEY, name VARCHAR(40), peep VARCHAR(240), time VARCHAR(20), date VARCHAR(20));
  ```

  * Disconnect from the database
  ```
  \q
  ```

#### 4. Run the webpage using sinatra
  * A rack environment has been included, so you can simply call rackup
  ```
  rackup
  ```
  * If using rackup, the default port will be 9292

#### 5. Using a web browser, navigate to your local webpage
  ```
  localhost:9292
  ```

#### 6. Post some peeps!
  * Enter your name and click "Get peepin'"
  ![Homepage](https://github.com/Mschmidt19/chitter-challenge/blob/master/screenshots/Screen%20Shot%202018-08-05%20at%208.50.59%20PM.jpg)

  * Enter a peep to make in the text field on the left of the screen.
  ![Entering Peeps](https://github.com/Mschmidt19/chitter-challenge/blob/master/screenshots/Screen%20Shot%202018-08-05%20at%208.51.53%20PM.jpg)

  * View your peeps!
  
  * Check out what it may look like on mobile!

#### 7. When finished, end the sinatra server
  ```
  ctrl+C
  ```

## User Stories & Instructions
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
