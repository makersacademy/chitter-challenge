require 'data_mapper'
require 'dm-validations'
require 'dm-timestamps'

require './lib/models/user'
require './lib/models/peep'
require './lib/helpers/session_user'
require './lib/helpers/current_user'

env = ENV['RACK_ENV'] || 'development'

# we are telling the datamapper to use a postgres database on localhost.
# The name will be 'boommark_manager_test' or 'bookmark_manager_development'
#depending on the environment

DataMapper.setup(:default, "postgres://localhost/chitter_challenge_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!