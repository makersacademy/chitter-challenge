![USED POST](https://img.shields.io/badge/MADE-RUBY-red.svg?style=for-the-badge)
![USED POST](https://img.shields.io/badge/USES-HTML-green.svg?style=for-the-badge)
![USED POST](https://img.shields.io/badge/USES-GIT-orange.svg?style=for-the-badge)
![USED POST](https://img.shields.io/badge/USES-PostgreSQL-blue.svg?style=for-the-badge)

# Week 4 - Weekend Challenge - Chitter App

## What is ***Chitter***?
Chitter is a Twitter clone that allows users to post messages in a public stream.

## User Stories

Check user_stories.md for an overview of the project requirements, by clicking [here](./00_supplementary_files/user_stories.md)

## How to install
All required gems can be installed by running ``` $ bundle install``` via your preferred terminal.

Please make sure that you have bundler installed for the above to work correctly. Bundler can be installed by running ``` $ gem install bundler ``` via your preferred terminal.

As this application is based on a [PostgreSQL](https://www.postgresql.org) database, you will also need to create a database called ***chitter_development***.


## How to use the application
run ```$ rackup``` in your terminal and navigate to **localhost:9292** in your browser
Then create a new user account and start ***Peeping Away***!!


## How this application was developed
This application was build following a Test Driven Development methodology, using the following components:
* [Ruby](https://www.ruby-lang.org) - The language used to develop this program
* [Sinatra](http://www.sinatrarb.com/) - The Domain Specific Language (***DSL***) used to create this web-app.
* [PostgreSQL](https://www.postgresql.org) - The database to store and serve the data
* [DataMapper](http://datamapper.org/) - The Object Realtional Mapper (***ORM***) that linked the Ruby app with the PostreSQL database
* [Rspec](http://rspec.info) - The testing framework used to drive development
* [Capybara](http://teamcapybara.github.io/capybara/) - The library used to test & simulate interactions with the web-app.
* [BCrypt](https://github.com/codahale/bcrypt-ruby) - The password-hashing encryption manager

**Steps of the Development:**
1. Analyse the [User Stories](./00_supplementary_files/user_stories.md) and deciding on:
 * Models required
 * Tables required to map the aforementioned user stories in the program
2. Break User stories in smaller pieces/steps
3. For each step of a particular user story, start with a simple test, see it fail and then write the simplest possible code to make it pass.
4. Refactor Code
5. Re-iterate steps 2 - 3 for each step of each user story, until all user stories have been addressed

**Future Work:**
* Complete the ADVANCED User Story
* Implement the ability to converse with other users via replying to a peep from another user
* Do some HTML & CSS Styling
