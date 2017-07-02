require 'bcrypt'

class User
  include DataMapper::Resource

  attr_accessor :password_confirmation
  attr_reader :password

  has n, :peeps

  property :id, Serial
  property :username, String, required: true, unique: true
  property :email, String, required: true, unique: true, format: :email_address
  property :password_digest, Text

  validates_confirmation_of :password

  def password=(password)
    @password = password
    password_digest = BCrypt::Password.create(password)
  end
end
