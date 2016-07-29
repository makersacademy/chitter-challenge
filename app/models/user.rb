require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :callsign, String, required: true
  property :email, String, format: :email_address, required: true, unique: true
  property :password_hash, String, length: 60

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(new_password)
    @password = new_password
    self.password_hash = BCrypt::Password.create(new_password)
  end

end
