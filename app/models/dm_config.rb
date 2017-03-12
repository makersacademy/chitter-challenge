require 'data_mapper'
require 'dm-postgres-adapter'


require_relative './peep.rb'
require_relative './hashtag.rb'
require_relative './user.rb'

def setup
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
  DataMapper.finalize
  DataMapper.auto_upgrade!
end

setup
