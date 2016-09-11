require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :handle, String, unique: true
  property :email, String, unique: true
  property :password, Text
  property :password_confirmation, Text

  def self.authenticate(email, password)
  end

end

DataMapper.setup(:default, "postgres://localhost/chitter_development")
DataMapper.finalize
DataMapper.auto_upgrade!
