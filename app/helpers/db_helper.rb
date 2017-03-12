require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

require './app/models/user'
require './app/models/peep'
require './app/models/reply'

def setup_datamapper
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
  DataMapper.auto_upgrade!
  DataMapper.finalize
end

setup_datamapper
