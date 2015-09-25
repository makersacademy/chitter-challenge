require 'dm-validations'
require 'data_mapper'
env = ENV['RACK_ENV'] || "development"
require_relative 'models/link' # require each model individually - the path may vary depending on your file structure.
require_relative 'models/tag' # require each model individually - the path may vary depending on your file structure.
require_relative 'models/user' # require each model individually - the path may vary depending on your file structure.

# we're telling datamapper to use a postgres database on localhost. The name will be "bookmark_manager_test" or "bookmark_manager_development" depending on the environment
DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

# After declaring your models, you should finalise them
DataMapper.finalize

# However, the database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!