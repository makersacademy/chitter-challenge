## How to use

 ### To set up the project:

 Clone this repository and then run bundle to install dependencies:

 ```
 git clone git@github.com:mbrad26/chitter-challenge.git

 bundle install
 ```

 ### To run the Chitter app:

 ```
 rackup
 ```

 ### To run tests:

 ```
 rspec
 ```

 ### To run linting:

 ```
 rubocop
 ```

## Setting up the databases

This app uses PostgreSQL to manage the databases:

```bash
brew install postgresql

brew services start postgresql

psql postgres

# list databases
\l
# quit psql
\q
```

## Running tests


```bash
# Runs test suite
rspec
```

## Starting the app on the localhost

```bash
# Starts the server on port 9292
rackup

```

## Approach

To do...

## Implementation

### 1st user story

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```

Steps:

- write the feature test
- add text-area and form for creating and posting peeps to the index.erb
- create get and post routes
- make the test pass in the simplest way
