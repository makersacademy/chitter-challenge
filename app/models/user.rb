require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :user_name, String
  property :email,  String, required: true, format: :email_address, unique: true
  property :password_digest, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password


end
