# Chitter Challenge

A Makers weekend challenge to clone the basic functionalities of Twitter.

## Dependencies:
(To check the correct versions, please view the gem file)

- Ruby
- RSpec
- Sinatra
- Postgresql
- Rack-test
- WEBrick

## Instructions

First clone the repo
```$ git clone https://github.com/edwardfgt/chitter_challenge.git```

Then install all gems and dependencies:

```zsh
bundle install
```

To build the database on your local machine:

```
psql -h 127.0.0.1
CREATE DATABASE chitter
```

To setup the database tables:

```
psql -h 127.0.0.1 chitter < database_setup.sql
```

## Testing
All tests should pass, to check this, run RSPEC:
```rspec```



