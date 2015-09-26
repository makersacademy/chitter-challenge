require 'data_mapper'
require 'dm-validations'
require './app/models/user'


env = ENV['RACK_ENV'] || 'development'

if ENV['RACK_ENV'] == "production"
  DataMapper.setup(:default, ENV['DATABASE_URL'])
else
  DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
end


# After declaring your models, you should finalise them
DataMapper.finalize

# However, the database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!
