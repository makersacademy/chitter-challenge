require 'data_mapper'
require 'dm-validations'

require './app/models/user'
require './app/models/peep'

env = ENV['RACK_ENV'] || 'development'


DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/application_chitter_#{env}")


# After declaring your models, you should finalise them
DataMapper.finalize

# However, the database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!