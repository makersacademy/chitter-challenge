require 'data_mapper' #= the gem
require 'dm-validations'

env = ENV['RACK_ENV'] || 'development'
# checks for current environment from operating system.
# if RSPEC is running it will set the env to test.

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{env}")
#Tells datamapper to conncet to my database on my machine.
#DataMapper knows how to do this under the hood.

require './app/models/peep'
require './app/models/user'
#Make the code for all the models available
#NB that files requires the DataMapper::Resourcetouch

DataMapper.finalize
# Checks the models are in sync in terms of associations/relationships.

DataMapper.auto_upgrade!
#instruction to datamapper to take all of the info given to it
#through the models and go and create all the database resources
#needed to support those models. e.g. greate a links table if it
#doesnt exist, create new columns if they don't exist etc.


#THIS SETUP FILE CREATES THE TABLES -
#WITH HELP FROM THE files#IT LINKS TO!
