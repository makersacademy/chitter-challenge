# Chitter

Chitter is a simple twitter clone website built with Sinatra.

## Features

- Sign up
- Log in
- Log out
- Post
- Read posts
- Display time of posts
- Replying to posts
- CSS styling

## Preview

<img src="/recipes/screenshots/listing.png" width="400" />
<img src="/recipes/screenshots/comment.png" width="400" />
<img src="/recipes/screenshots/signup.png" width="400" />

## Getting started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- Ruby >= 2.5.0
- PostgreSQL >= 9.5

### Installing

1.  Clone the repository

```
$ git clone https://github.com/SimpleLuke/chitter_challenge.git
```

2.  Change into the directory

```
$ cd chitter_challenge
```

3.  Install dependencies

```
$ bundle install
```

4.  Set up database

```
$ createdb chitter_database
$ psql chitter_database < spec/seeds/chitter_tables.sql
```

5.  Start the development server

```
$ rackup
```

6.  Open your browser and visit `http://localhost:9292`

## Running the tests

To run the tests, simply run:

```
$ rspec
```

## Built With

- [Sinatra](https://sinatrarb.com/) - A lightweight web application framework
- [PostgreSQL](https://www.postgresql.org/) - Object-relational database system
- [bcrypt](https://github.com/codahale/bcrypt-ruby) - A password hashing library

## Authors

- [Luke Lai](https://github.com/SimpleLuke)

## Acknowledgements

- Challenge from Makers
- Inspiration from [Twitter](https://twitter.com)
