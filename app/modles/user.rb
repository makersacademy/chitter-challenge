require 'data_mapper'
require 'bcrypt'
# require 'data_mapper_setup'

class User
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :surname, String
  property :username, String
  property :email, String
  property :password_digest, String, length: 60

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
end

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
