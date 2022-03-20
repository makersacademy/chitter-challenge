Chitter Challenge
=================

**Ruby | PostgreSQL | Sinatra | Capybara | RSpec**

Week 4 - my first CRUD web app (independent project): a basic Twitter clone (Chitter) that allows users to post, update and delete messages(peeps). I integrated the database using the PG gem and SQL, and encrypted the password with **BCrypt**. The database stores peeps (content, time posted) and users (username, handle) in separate tables. 

This week I got to grips with the **MVC design pattern** and learnt to follow an effective debugging process for database applications. I also taught myself how to use a task runner, Rake, to automate the database set up. I started by moving the test environment setup script to Rake, and writing a script to set up a database through Rake.

### To run the program and set up the databases

1. Run bundle install to install all gems required for the program, including rake. 
2. Run the setup databases rake task saved in the rakefile by typing: 
```$ rake initial_databases_setup```
Note that rspec is configured (in the spec_helper) to connect to the test database before each test, using the rake task :test_database_setup
3. Run the app:
```ruby app.rb```
and visit http://localhost:4567/ in the browser 
4. Run tests with RSpec. SimpleCov will run (98% test coverage)

### Features built from user stories:

On the /peeps/index view, a form allows the user to post a peep, to satisfy: 
```
So that I can let people know what I am doing  
I want to post a message (peep) to chitter
```

sort_all_peeps method, which is then called within the get /peeps route, to satisfy:
```
So that I can see what others are saying  
I want to see all peeps in reverse chronological order
```

timestamp added using Time.now in the Peep.add method, to satisfy: 
```
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

Sign-up page with form, to satisfy:
```
So that I can post messages on Chitter as me
I want to sign up for Chitter
```

Authenticate method in User class checks that the user has entered the correct username and password, to satisfy:
```
So that only I can post messages on Chitter as me
I want to log in to Chitter
```

Sign-out button. This points back to the post /sessions/destroy route, which clears the user data from the session, to satisfy: 
```
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```

### Future features, if I had more time, I would: 
- Implement a notification feature so that users receive an email if they are tagged in a Peep.
- Work on the CSS

