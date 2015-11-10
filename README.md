Chitter Challenge
=================


Technologies used in this project:

Controller/Model: Ruby
Database: PostgreSQL

Web Sinatra: Framework
ORM: Data Mapper
Password Hasher: BCrypt
Testing Framework: RSpec - Capybara
Database Cleaning: Database Cleaner

Two models were used in this project: `User` and `Peep`. As any Peep can only belong to one user, but a user can post many peeps, a one-to-many data association was used.

Users are prompted to sign up or log in on the landing page. Once an account has been created and/or the user has successfully signed in, the user is able to post a peep on the main peep gateway.

Users are able to see a history of all other peeper activities in the `/peeps` route.
