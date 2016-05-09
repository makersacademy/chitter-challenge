Chitter Challenge
=================
Specs
-----
This challenge is to create a twitter clone using Sinatra, Ruby and PostgreSQL. 

Following Technologies were used
--------------------------------
Ruby
Sinatra
PostgreSQL
DataMapper
Tested using Rspec/Capybara

Notes on functionality
-----------------------
* All features tested using Rspec/Capybara.
* User signs up with email and password
* Used bcrypt to secure the passwords.
* Used datamapper and postgres to save the data.
* One can see peeps without login to the site.
* User can peep only when logged in.

How to run
----------
* clone the directory to local
* terminal run ruby app/app.rb
* browser http://localhost:(port):(path)

Test Coverage
-------------
[Coveralls] Some handy coverage stats:
  * app/app.rb => 100%
  * app/controllers/peeps.rb => 100%
  * app/controllers/sessions.rb => 86%
  * app/controllers/users.rb => 100%
  * app/data_mapper_setup.rb => 100%
  * app/models/peep.rb => 100%
  * app/models/user.rb => 100%
  * app/server.rb => 92%
  * spec/features/creating_peeps_spec.rb => 100%
  * spec/features/reverse_chronological_spec.rb => 100%
  * spec/features/user_signin_spec.rb => 100%
  * spec/features/user_signout_spec.rb => 100%
  * spec/features/user_signup_spec.rb => 100%
  * spec/features/viewing_peeps_spec.rb => 100%
  * spec/helpers/session.rb => 100%
  * spec/models/user_spec.rb => 100%


