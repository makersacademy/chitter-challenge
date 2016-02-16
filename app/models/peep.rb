require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :text, String
end

DataMapper.setup(:default, "postgres://localhost/chitter_challenge_test")
DataMapper.finalize
DataMapper.auto_upgrade!
