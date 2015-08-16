require 'data_mapper'
require 'dm-validations'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_app_#{env}")

require './app/models/peep' # require each model individually - the path may vary depending on your file structure.

# After declaring your models, you should finalise them
DataMapper.finalize

# However, the database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!