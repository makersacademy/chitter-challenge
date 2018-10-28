Chitter Challenge
=================

This web application was built with Ruby and Sinatra using PostgreSQL databases. The unit tests were written in RSpec and the feature tests were written with RSpec/capybara.

User stories:
-------

```

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

```

### Setting up the databases
- If you already have a peep_manager database and a peep_manager_test database, you can skip this step. Otherwise, in the terminal, just run:

```
$> rake setup
```

### Setting up the project
- After cloning this repo to your computer, make sure you're in the project directory and run the command `bundle` on your terminal.
- To run the tests, use the command `rspec`.
- To start the server use the command `rackup`.
- Happy peeping...
