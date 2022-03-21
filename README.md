# Chitter
An online web application which allow users to post messages. 

## Features
* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.

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

## Installation
1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundler` (if you don't have bundler already)
3. When the installation completes, run `bundle`

## How to Use
1. Run the command `rackup` 
2. Open an browser with `localhost:` with the 4-digit host number


## Tests
There are a series of tests which can be run with the following (from the directory):
```
rspec
```
To run tests from specific class files, this can be done by:
```
rspec spec/<filename>.rb
```

## Approach to the Challenge
I followed strict TDD to ensure each of the user stories were accompanied by a feature test followed by the neccessary unit tests. I made sure to diagram how I wanted my code and UI to look like and continuously updated it as I progressed throughout the challenge.

![Screenshot 2022-03-20 at 19 24 13](https://user-images.githubusercontent.com/74867241/159179203-0a0f7511-101f-4cf5-a8bf-605f220ff75e.png)

The steps I took to throughout this challenge
1. Set up testing environment
2. Wrote the feature test for the user stories (one at a time)
3. Created the controller and UI (erb files) to pass the test.
4. Created a database to store the data and extract it when required.
5. Extracted the code from the controller into the model (creation of the Chitter class) and wrote accompanying unit tests.
6. Refactored and created a database connection class to ensure SRP and code is DRY

Whilst I diagrammed out the fourth user story, and written the feature tests, unfortunately I did not have sufficient time to implement it.
![Screenshot 2022-03-20 at 20 34 38](https://user-images.githubusercontent.com/74867241/159184947-75ee9473-60fe-4567-9843-d31ea76b4b46.png)
