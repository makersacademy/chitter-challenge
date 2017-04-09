Please ensure that you update your README to indicate the technologies used, and give instructions on how to install and run the tests

Welcome. Nom Diaries is twitter for food-lovers. A social network specifically for sharing thoughts and pictures of noms.

## How to
## Technologies used
## Approach
## Resources

___

## HOW TO

**Test locally**
Clone repository
`git clone [ ]`

Install gems
`bundle install`

Create local database


Run rackup
`rackup`

Open browser to visit site
"localhost:9292"
nb - check port when running rackup - replace '9292' with relevant port value

**Test production**
In browser
"https://nom-diaries.herokuapp.com/"


### TECHNOLOGIES USED
Deploy
- [x] PaaS(Heroku)
- [x] Sinatra, Rackup
Test
- [x] Rspec
- [x] Capybara
- [x] Selenium
- [x] Coveralls
View
- [x] HTML
Model
- [x] Ruby
Database
- [x] Postgres
- [x] Datamapper

### APPROACH
Implement minimum functionality

**User story 1**
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
- [x] Create user - with unique email and twitter handle

**User story 2**
As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter
- [ ] User login via email

**User story 3**
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
- [ ] User logout

**User story 4**
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
- [x] Post peeps to message board

**User story 5**
As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
- [ ] Message board lists peeps in reverse chronological order

**User story 6**
As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
- [x] Peeps have timestamps
