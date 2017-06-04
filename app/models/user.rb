require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :name, String
  property :username, Text

end

DataMapper.setup(:default, ENV["DATABASE_URL"] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
