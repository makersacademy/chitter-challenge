# This shell script sets up the basic directory
# structure that I need for a challenge

# The script takes the challange name as an arguement
# and creates 3 directories (note that spec is already created)
# First create the controller file
touch app.rb

# In the database directory there should be a migations file
mkdir db
mkdir db/migrations
touch db/migrations/01_create_peeps_table.sql

# In the lib directory there should be a ruby file containing the
# main class code, this takes its name from the challenge
mkdir lib
touch lib/$1.rb

# The spec directory has already been created with the spec_helper.rb
# file in it but we also need a spec file for the challenge
# and some database spec files
touch spec/databse_helpers.rb
touch spec/setup_database.rb
touch spec/$1_spec.rb
mkdir spec/features

# Finally we set up the views Note that this will need refining
# as the development continues, but its a good start
mkdir views
touch views/$1.erb
