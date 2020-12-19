# Chitter Challenge
A small Twitter clone that will allow users to post messages (peeps) to a public stream

## Motivation
This project is an unguided, solo, understanding check of TDD, OOD, MVC, of a web application with a database.

## Build status
[![Build Status](https://travis-ci.com/chriswhitehouse/chitter-challenge.svg?branch=master)](https://travis-ci.com/chriswhitehouse/chitter-challenge)

## Screenshots
Include logo/demo screenshot etc.

## Tech/framework used
Ruby with Sinatra web framework, and PostgreSQL database. Tested using Rspec, and Capybara DSLs with Rubocop and Simplecov.

## Features
### User Story 1
```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```

![Class Diagram](https://github.com/chriswhitehouse/chitter-challenge/blob/master/diagrams/user_story_1/class.svg)
![Entity](https://github.com/chriswhitehouse/chitter-challenge/blob/master/diagrams/user_story_1/entity.svg)
![Sequence](https://github.com/chriswhitehouse/chitter-challenge/blob/master/diagrams/user_story_1/sequence.svg)

### User Story 2
```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```

![Class Diagram](https://github.com/chriswhitehouse/chitter-challenge/blob/master/diagrams/user_story_2/class.svg)
![Entity](https://github.com/chriswhitehouse/chitter-challenge/blob/master/diagrams/user_story_2/entity.svg)
![Sequence](https://github.com/chriswhitehouse/chitter-challenge/blob/master/diagrams/user_story_2/sequence.svg)

### User Story 3
```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

![Class Diagram](https://github.com/chriswhitehouse/chitter-challenge/blob/master/diagrams/user_story_3/class.svg)
![Entity](https://github.com/chriswhitehouse/chitter-challenge/blob/master/diagrams/user_story_3/entity.svg)
![Sequence](https://github.com/chriswhitehouse/chitter-challenge/blob/master/diagrams/user_story_3/sequence.svg)

## Code Example


## Installation
### Database Setup
1. Connect to psql
2. Create a development database using the psql command `CREATE DATABASE chitter;`
3. Connect to the database using the psql command `\c chitter;`
4. Run the query we have saved in the file '01_create_peeps_table.sql'
5. Create a test database using the psql command `CREATE DATABASE chitter_test;`
6. Repeat steps 3 and 4 for the test database.


## API Reference

Depending on the size of the project, if it is small and simple enough the reference docs can be added to the README. For medium size to larger projects it is important to at least provide a link to where the API reference docs live.

## Tests
Describe and show how to run the tests with code examples.

## How to use?
If people like your project they’ll want to learn how they can use it. To do so include step by step guide to use your project.

## Contribute

Let people know how they can contribute into your project. A [contributing guideline](https://github.com/zulip/zulip-electron/blob/master/CONTRIBUTING.md) will be a big plus.

## Credits
Give proper credits. This could be a link to any repo which inspired you to build this project, any blogposts or links to people who contrbuted in this project.

#### Anything else that seems useful

## License
A short snippet describing the license (MIT, Apache etc)

MIT © [Yourname]()
