# Chitter Challenge
The weekend challenge for Makers Academy (coding bootcamp) this week is based on the social networking platform Twitter. The aim of the challenge is to create a basic twitter clone built around users being able to post a 'Peep' to a feed of other 'Peeps'.

## Approach
My approach to the weekend challenge was similar to that of a previous project Bookmark Manager. Following the same steps I was able to fulfil the requirements of the first two user stories. Using Makers Academy resources I was able to set up a basic web project and create two databases, Chitter Manager and Chitter Manager Test. From this I was able to test drive features such as Post a message and Show all messages.

## Progress/Status
I am satisfied that I have completed the first two user stories, however I spent more time on this than I would have liked and therefore was unable to add the other features such as recording the time the 'Peep' was made and adding accounts with sign up / log in / log out. I struggled to find direction to add a sign up feature and unfortunately ran out of time due to my second day of attempting the challenge was mainly spent on understanding wrapping database data in program objects.

## Changes
Ideally I would have liked to fulfil the requirements of the first four user stories. If there was more time, working through the other requirements would have been good learning practice on the concepts we are covering. In addition, once these would have been completed it would have been great to work on some of the styling using CSS.

## User Stories

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
```
## Testing
RSpec and Capybara has been used for testing.

## Technolgies
The Chitter project includes technologies: Ruby, Sinatra, Postgres. 

## Databases
PostgreSQL and PG Gem PSQL.

## Using this Repo
1. Clone this repo: ```git clone git@github.com:domw30/chitter-challenge.git.```
2. ```cd``` into ```chitter-challenge``` and run ```bundle install``` to use the Ruby Gems.
3. Install the Postgres database server: ```brew install postgresql```. Need to [install Homebrew on your Mac?](https://brew.sh)
4. Create a database for Chitter: ```create database chitter_manager```. See this link for [the offical documentation](https://www.postgresql.org/docs/9.0/sql-createdatabase.html) on creating databases with Postgres.

## How to run
1. Enter rackup -p 4567 into the command line.
Visit http://localhost/4567.
This will direct you to the most recent peeps.
