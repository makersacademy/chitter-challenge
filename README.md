Chitter
======================

Completed this as fourth weekend challenge at Makers Academy([chitter-challenge](https://github.com/makersacademy/chitter-challenge)).
This app is a small Twitter clone that will allow the users to post messages to a public stream.

**Home page**
![Homepage](https://user-images.githubusercontent.com/36331920/38783153-86dd6cfe-40f6-11e8-9cab-1448ad919248.png)

## Table of content

- [Setup](#setup)
- [Usage](#usage)
- [Test](#test)
- [User Stories](#user-stories)
- [Technologies](#technologies)
- [Screenshot](#screenshot)

## Setup

- Clone this repo, run:
```
git clone https://github.com/shihhanwang/Acebook-Byte-3.git
```
- Install all the dependencies, run: `bundle install`
- Database setup
  - run `brew install postgresql` to install PostgreSQL
  - run `rake setup` to set up the database on your local machine

## Usage

- After setting up, go to its root directory and run: `rackup`
- In your brower, you will be able to access it at `localhost:9292`

## Test

- Go to its root directory and run: `rspec`



## User Stories

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```
```
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```
```
As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```
```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```
```
As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter
```
```
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```
## Technologies

- Database: PostgreSQL
- Web application framework: Sinatra
- Testing tool:
   - RSpec
   - Simplecov
   - Capybara
- Securing passwords input: bcrypt
- Tasks management: Rake
- Front-end style: CSS

## Screenshot
**Sign up page**
![Signuppage](https://user-images.githubusercontent.com/36331920/38783154-86f5fb34-40f6-11e8-9c8b-88b1ba4f6483.png)
**User's own page**
![Userpage](https://user-images.githubusercontent.com/36331920/38783156-8726bda0-40f6-11e8-9d93-707948314afb.png)
