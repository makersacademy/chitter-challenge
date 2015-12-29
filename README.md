Chitter
=================

This project is a basic version of Twitter, written for the Makers Academy weekend challenge. It allows people to view and make 'Peeps.' While anyone can view the Peeps, users can sign up with a username and then make Peeps too.

To see an example of Chitter, visit glacial-reef-2927.herokuapp.com

The project uses Ruby and Sinatra to run, with a PostgreSQL database. DataMapper is used as the Object Relational Mapper.

Getting Started:
-------
To use, follow these steps:
* Clone the repository to your own location
* Run 'bundle' from the folder in your command line to install the right Ruby gems
* You will need to set up a PostgreSQL database to use Chitter. If you are running it locally, call the database 'chitter_development' and type 'rackup' in command line to view the pages through the local port. If you deploy to Heroku, the database should be called 'chitter_production' and linked to the Heroku app.


Running tests:
-------
* RSpec tests are included in the spec folder. If you want to view these, set up a 'chitter_test' database and type 'rspec' in the command line while in the project directory.
