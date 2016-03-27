require_relative '../data_mapper_setup'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :first_name, String, required: true
  property :last_name, String, required: true
  property :username, String, required: true
  property :email, String, required: true
  property :password_digest, Text, required: true

  attr_reader :password

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = BCrypt::Password.create(password)
  end
end
