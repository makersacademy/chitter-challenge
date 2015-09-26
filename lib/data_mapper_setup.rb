require 'data_mapper'
require 'dm-validations'

require 'models/user'

require 'helpers/session_user'

env = ENV['RACK_ENV'] || 'development'

# we are telling the datamapper to use a postgres database on localhost.
# The name will be 'boommark_manager_test' or 'bookmark_manager_development'
#depending on the environment

DataMapper.setup(:default, "postgres://localhost/chitter_challenge_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!