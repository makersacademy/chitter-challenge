Chitter Challenge
=================

Functionalities used:
------

* Creation of the app using rspec-capybara
* Creation of the chitter_test and chitter_development DB with psql
* Used DataMapper and postgres to save the data
* Sign up with email, password, confirmation password, name and user name
* Used bcrypt to secure the passwords
* Used following DataMapper functionalities to ensure proper sign up
  -checks email is unique
  -validates_confirmation_of
  -validates_presence_of
  -validates_format_of
* Added a self.authenticate method in the user class to ensure proper
sign in
* peeps (stored in Peep datatable) identified through 3 attributes: content, time of release and author (many to one relationship with User class)
  -allows to call the name of the author for each peep: `peep.user.name`
  -time yielded automatically through Time.now function
* Used layout page: welcomes user + sign out option
* Don't have to be logged in to see the peeps >> /peeps path allows to see all peeps
* Can only peep if you logged in >> app build so that only logged in users are offered the option to peep
* displayed peeps in reverse chronological order using Peep.all(:order => [:time.desc]) functionality
