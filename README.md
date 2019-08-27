# README 

## Project description

Welcome to a clone of twitter built over a weekend! Users are able to:
- sign up, sign in and logout
- post peeps to be displayed on the homepage

# User Stories:

### STRAIGHT UP

As a Maker,   
So that I can let people know what I am doing,   
I want to post a message (peep) to chitter ✅

As a Maker,   
So that I can see what others are saying,    
I want to see all peeps in reverse chronological order ✅

As a Maker,   
So that I can better appreciate the context of a peep,   
I want to see the time at which it was made ✅

As a Maker,   
So that I can post messages on Chitter as me,   
I want to sign up for Chitter ✅

### HARDER

As a Maker,   
So that only I can post messages on Chitter as me,   
I want to log in to Chitter ✅

As a Maker,   
So that I can avoid others posting messages on Chitter as me,   
I want to log out of Chitter ✅

## Solution

The program is modeled across two separate classes: a user and a peep class. By doing this I was able to effectively encapsulate the behaviour. Given an email API implementation there will need to be further class extraction.

## Additional gems

- pg - for interaction witht the database
- bcrypt - to effectively encrypt passwords in the database
- sinatra-flash - to warn the user if there is ever an incorrect input
- simplecov - for test coverage.

## Contribution

If you would like to contribute to this project, please submit a pull request at our github page.

## Setting up locally

First, clone this repository. Then:
```console
cd chitter-challenge
bundle install
rackup
```

## Troubleshooting

Should you have any trouble running the local server, do:
```console
sudo lsof -i :*the localhost number currently in use elsewhere*
sudo kill *the PID numbers currently running*
rackup
```
