require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :full_name, String, required: true
  property :username, String, unique: true, required: true
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, String, length: 60

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  validates_confirmation_of :password
  validates_uniqueness_of :email
  validates_uniqueness_of :username

end
