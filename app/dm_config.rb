require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'
require 'dm-validations'

require_relative 'models/peep.rb'
require_relative 'models/hashtag.rb'
require_relative 'models/user.rb'

def setup
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
  DataMapper.finalize
  DataMapper.auto_migrate!
end

setup
