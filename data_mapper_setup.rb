require 'data_mapper'
require 'dm-validations'

env = ENV['RACK_ENV'] || 'development'

# we're telling datamapper to use a postgres database on localhost. The name will be "bookmark_manager_test" or "bookmark_manager_development" depending on the environment
# DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_challenge_#{env}")
require './app/models/peep' # require each model individually - the path may vary depending on your file structure.
#require './app/models/tag'
require './app/models/user'
# After declaring your models, you should finalise them
DataMapper.finalize

# However, the database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!