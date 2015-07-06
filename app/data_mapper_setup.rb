require 'data_mapper'
# require 'dm-validations'
# require 'sinatra/flash'
require 'dm-postgres-adapter'


# env = ENV['RACK_ENV'] || 'development'

# # we're telling datamapper to use a postgres database on localhost. The name will be "bookmark_manager_test" or "bookmark_manager_development" depending on the environment
# DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

# require './app/models/link' # require each model individually - the path may vary depending on your file structure.

# # After declaring your models, you should finalise them
# DataMapper.finalize

# # However, the database tables don't exist yet. Let's tell datamapper to create them
# DataMapper.auto_upgrade!

env = ENV['RACK_ENV'] || 'development'

# we're telling datamapper to use a postgres database on localhost. 
# The name will be "bookmark_manager_test" or "bookmark_manager_development" depending on the environment
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_challenge_#{env}")
# DataMapper::Logger.new($stdout, :debug)
require './app/models/user'
require './app/models/peep'

# require './lib/link' # this needs to be done after datamapper is initialised
# require './lib/tag'
# require './lib/user'

# After declaring your models, you should finalise them
DataMapper.finalize

# However, the database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!