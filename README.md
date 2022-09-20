# Technologies used:
* ActiveRecord for ORM
* SQLite3 for the database engine
* Sinatra for the server
* Rack Test for mocking the server
* RSpec for tests

# Instructions
Running tests
* Run ```bundle install``` to install all gems.
* Run ```rake db:test:migrate``` and ```rake db:test:seed``` to ensure database is created and seeds are loaded.
* Run ```rake``` to test entire RSpec suite.

Running server on localhost
* Run ```bundle install``` to install all gems.
* Run ```rake db:dev:migrate``` to ensure database is created.
* Run ```rackup``` and go to http://localhost/9292 to access app.
* (```rackup``` will reset tables and load seeds for you on each call)


