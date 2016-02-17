require 'data_mapper'
require 'dm-postgres-adapter'
require 'tilt/erb'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :text, String
  property :time, String
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_challenge_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
