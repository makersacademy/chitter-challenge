## User Stories
```
As a Maker,
So that I can let people know what I am doing,
I want to post a message (peep) to chitter.

```

## How to use
### To set up the project
Clone this repository and then run:
```
bundle
```

### To set up the database

Connect to `psql` and create the `chitter` database:

```
CREATE DATABASE chitter;
```

To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

### To run the Bookmark Manager app:

```
rackup
```

To view bookmarks, navigate to `localhost:9292/`

### To run tests:
```
rspec
```
### To run linting:
```
rubocop
```