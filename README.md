# Author Notes

This is Chitter and mimics the behaviour of the micro blogging site Twitter.

The purpose of this exercise is to learn and practice the use of test driven design and build through the
use of a physical database, in this case postgressql. Testing is behaviour driven through the use of Capybara and RSpec. 

The principal design patterns used in this exercise will be:

- Model-View-Controller
- RESTful Routing

The web site which fronts this work is through the use of sinatra

In addition to the use of the RSpec framework, unit tests will be conducted through the use of environment configuration. Therefore unit tests will be testing against a test database rather than the actual app database.

----------------------
## Installation
----------------------
Install gems with [bundler](https://bundler.io/ "bundler") 
~~~~
$> bundle install 
~~~~
To install code from the latest source
~~~~
git@github.com:nyahehnagi/chitter-challenge.git
~~~~
## Testing
-----------------------
To run rspec tests
~~~~
$> rspec
~~~~


## To run the sinatra webserver locally
-----------------------
To run a locally hosted server of the site
~~~~
$> rackup
~~~~

Navigate to http://localhost:9292/

## Database Configuration
----------------------
Install [postgresql](https://www.postgresql.org/download/ "postgresql")  according to your operating system

### Setting up the app database
~~~~
Connect to psql
$> psql

# At the psql prompt
# Create the database
admin=# CREATE DATABASE chitter;

# Change to the chitter database
admin=# \c chitter;
~~~~

### Setting up the test database
~~~~
Connect to psql
$> psql

# At the psql prompt
# Create the database
admin=# CREATE DATABASE chitter_test;

# Change to the chitter_test database
admin=# \c chitter_test;
~~~~

### Database Build

For both the test and app databases run the following scripts in the order as shown listed

These can be found here ./db/migrations
~~~~
01_create_table_peeps.sql
02_alter_table_peeps_add_created_at
03_create_table_users.sql
04_alter_table_users_add_name_username.sql
~~~~

----------------------
