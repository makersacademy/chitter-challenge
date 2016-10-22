require 'bcrypt'
class User
  include DataMapper::Resource
  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :name, String
  property :user_name, String
  property :email, String
  property :password_digest, Text, :required => true, :lazy => false

  def password=(password)
    @password = password
      self.password_digest = BCrypt::Password.create(password)
  end


end
