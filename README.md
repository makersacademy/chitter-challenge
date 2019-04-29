# Chitter Challenge

A small Twitter clone that will allow the users to sign-up and post messages.

### Installing

Clone this repository and then run. (If after changing into directory you see a prompt to `rvm` a particular version of ruby please follow)

```
gem install bundle
bundle install
```

Connect to `psql` and create the `chitter_manager` and `chitter_manager_test` databases:

```
CREATE DATABASE chitter_manager;
CREATE DATABASE chitter_manager_test;
```

To set up the tables, connect to each database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

### Usage

1. `$rackup -p 4567` to launch server
2. [Navigate to localhost:4567 in browser](http://localhost:4567/users/new/)
3. Sign-up with your details
4. Begin Peeping!

### Testing

```
rspec
```
