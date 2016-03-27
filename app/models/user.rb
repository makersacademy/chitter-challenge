require_relative '../data_mapper_setup'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :username, String
  property :email, String
  property :password_digest, Text

  attr_reader :password

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = BCrypt::Password.create(password)
  end
end
