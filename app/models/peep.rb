require 'data_mapper'
require 'dm-postgres-adapter'

# This class corresponds to a table in the database
class Peep
  # add DataMapper functionality to this class so it can communicate with the database
include DataMapper::Resource

property :id, Serial
property :message, String

end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_challenge_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
