require 'data_mapper'
require 'dm-postgres-adapter'

class Maker

  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :email, String
  property :password, String

end

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV["RACK_ENV"]}")
DataMapper.finalize
DataMapper.auto_upgrade!
