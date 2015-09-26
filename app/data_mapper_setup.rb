require 'data_mapper'
require 'dm-validations'
require 'dm-core'
require 'dm-timestamps'

env = ENV['RACK_ENV'] || 'development'

# we are telling the datamapper to use a postgres database on localhost.
# The name will be 'boommark_manager_test' or 'bookmark_manager_development'
#depending on the environment

DataMapper.setup(:default, "postgres://localhost/chitter_challenge_#{env}")
# DataMapper.setup(:default, 'sqlite3::memory:')

#Requiring each module individually
require './app/models/user.rb'
require './app/models/peep.rb'

# After declaring our models we should finalise them
DataMapper.finalize

# However, the database table doesn't exist yet.
# We tell the datamapper to create it
DataMapper.auto_upgrade!
