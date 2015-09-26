require 'data_mapper'
require 'sinatra/base'
require 'sinatra/flash'
require 'dm-validations'
require 'dm-timestamps'
require './app/models/user'
require './app/models/peeps'
require './app/models/tags'
 # require each model individually - the path may vary depending on your file structure.

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

# After declaring your models, you should finalise them
DataMapper.finalize

# However, the database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!
