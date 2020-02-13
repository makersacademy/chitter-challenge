# Repo title #

*This programme does...this (programme description)*

I created this programme as part of a challenge at [Makers Academy](https://makers.tech). See [Specification](#Specification) for more information on the programme's requirements.

* [Getting started](#Getting-Started)
* [Useage](#useage)
* [Running tests](#Running-tests)
* [Specification](#Specification)
* [How I built it](#How-i-built-it)
* [Credits](#credits)


## Getting Started ##

1. Fork this repo, and clone to your local machine. Navigate into the folder.
2. Run the command `gem install bundle` (if you don't have bundle already)
3. When the installation completes, run `bundle`

*The template comes with pg for interacting with Postgres. If not required you can delete line from gemfile.*

## Useage ##

```shell
$ irb
  > require ' '
  >  app = App.new
  >  
```

- where to use
- example code
- example output

## Running tests ##

1. Navigate to top level of project directory
2. In your command line type:

```shell
$ rspec
```

## Specification ##

### User Stories ###

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

### Functionality ###

1. You don't have to be logged in to see the peeps.
2. Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
3. The username and email are unique.
4. Peeps (posts to chitter) have the name of the maker and their user handle.
5. Your README should indicate the technologies used, and give instructions on how to install and run the tests.

## How I built it ##

### Sequence Diagrams ###

### Class Diagrams ###

### Database Designs ###

### Designing tests ###

When planning my code I thought about the tests I might need, and tried to order them by simplicity

#### Feature tests ####

1.
2.
3.

#### Unit Tests ####

1.
2.
3.

#### Edge Cases ####

## Further Improvements ##

## Credits ##

List any credits or inspiration here
