Chitter Challenge
=================

Functionalities used:
------

* Creation of the app using rspec
* Use data mapper and postgres to save the data.
* Sign up with email, password, name and user name
* Required password confirmation
* Used following datamapper functionalities to ensure proper sign up
  -checks email is unique
  -validates_confirmation_of
  -validates_presence_of
  -validates_format_of
* Peeps have the name of the maker
  -"many to one relationship" declared in the User and Peep classes
  -allows to call the name of the author for each peep: `peep.user.name`
* Used bcrypt to secure the passwords
* Don't have to be logged in to see the peeps >> /peeps allows to see all peeps
* Can only peep if you logged in >> only logged in users are offered the option to peep
