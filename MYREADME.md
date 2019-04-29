# Chitter Challenge

## Makers week 4 weekend challenge

### Setup

- `bundle install` to install all required gems
- `shotgun config.ru -p 4567` to run the server
- To set up the databases:

`````
psql
CREATE DATABASE chitter_challenge
CREATE TABLE peeps(id SERIAL PRIMARY KEY, peep_content VARCHAR(280));
`````
- repeat for test database `chitter_challenge_test`
- access web app at http://localhost:4567/
