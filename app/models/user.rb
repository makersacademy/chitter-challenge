require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  attr_reader :password

  property :id, Serial
  property :email, String
  property :password_digest, Text
  property :name, String
  property :username, String

  def password=(password)
    @password = password
    self.password_digest = Bcrypt::Password.create(password)
  end

end

DataMapper.setup(:default, "postgres://localhost/chitter_test")
DataMapper.finalize
DataMapper.auto_upgrade!

