#CHITTER CHALLENGE

#####Authors
- Alain Lemaire (jaxdid)

#####Details
- Date created: 14/02/16 @ 16:14
- Date last updated: 15/02/16 @ 10:22
- Makers Academy: Week 4

###Description
Chitter is a web application that currently allows users to create user accounts, log in and log out. It uses database resources and local sessions to manage states of user authentication and includes basic validation for authentication form submission (non-existent user accounts, incorrect passwords).

###Features
```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```

###Technologies Used
- Ruby
- Sinatra (router/controller)
- RSpec (testing)
- Capybara (testing)
- DataMapper (ORM)
- Postgres (database management)
- Rake (task automation)

###Known Issues/To-Dos
- Incomplete form 
- No validation for user account creation form (e.g., user accounts can be created with the same username)