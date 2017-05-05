require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  include DataMapper::Resource
  include BCrypt

  property :id,       Serial
  property :name,     String
  property :username, String
  property :email,    String, required: true
  property :password_hash, Text

  attr_reader :password
  attr_accessor :password_confirmation

  def password=(password)
    @password = Password.create(password)
    self.password_hash = @password
  end

end

DataMapper.setup(:default, "postgres://localhost/chitter_test")
DataMapper.finalize
DataMapper.auto_upgrade!
