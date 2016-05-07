require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String, format: :email_address, required: true, :unique => true
  property :password_digest, Text


  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end


end

DataMapper.setup(:default, "postgres://localhost/user_manager_test")
DataMapper.finalize
DataMapper.auto_upgrade!
