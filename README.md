# Chitter Challenge
![code-size](https://img.shields.io/github/languages/code-size/hamstercat007/chitter-challenge )
![last-commit](https://img.shields.io/github/last-commit/hamstercat007/chitter-challenge)
![languages-count](https://img.shields.io/github/languages/count/hamstercat007/chitter-challenge)


The Chitter app allows people to post messages and see them. This was a challenge set by Makers Academy. I implemented the following user stories:
| Completed | User Stories 
|---|---|
|  [x] | As a maker, so that I can see what others are saying, I want to see all peeps in reverse chronological order|
|  [x] | As a Maker, so that I can better appreciate the context of a peep, I want to see the time at which it was made|
|  [x] | As a maker, so that I can see what others are saying, I want to see all peeps in reverse chronological order|

# Technologies used
* Rspec
* Capybara
* Sinatra
* PostgreSQL

# How to install
## Clone the repo
```sh
% git clone https://github.com/hamstercat007/chitter-challenge.git
```

## Install the dependencies 
From inside the project folder, run 
```
% bundle install
```
## Set up the database
Run script from the `db/migrations` folder
Db/migrations 00 will create two databases; one for production, and one for test
Run all the other scripts in both the databases.

# Usage
## Start the app 
From inside the project folder:
```sh
% rackup
```

## Run the tests
From inside the project folder:
```sh
% rspec 
```