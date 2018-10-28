# Chitter
Chitter is a clone of Twitter where a user can sign up, sign in create a peep, and see other users peeps.

### How to Use
* Clone this repo.
* `bundle` to install gems
* Run command `ruby app.rb` to start local server. Go to localhost:4567 in your browser to use the application

### Dependancies
* This app uses sinatra
* The tests run on capybara and rspec
* PG to create an interface between ruby classes and the database

### Running the tests
To run the feature and unit tests on this app use command `rspec` from the root folder. Tests are all in rspec and capybara.

### How to set up the Database
1. Connect to psql
2. Create the database using the psql command `CREATE DATABASE chitter;`
3. Connect to the database using the pqsl command `\c chitter;`
4. Run the queries that have been saved in the `/db/migrations` folder.

### Notes
Currently you are able to log in to an account, but the peeps that you post will not be linked to your account. This is something that I am working on completing and the reason why there is 1 failing test.

Also in relation to this, there is no log out feature currently.
