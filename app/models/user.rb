require 'bcrypt'

class User
  include DataMapper::Resource

  has n, :peeps, through: Resource

  property :id,     Serial
  property :email,   String, format: :email_address, required: true, unique: true
  property :password_digest,  Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password, :message => "Password and confirmation password do not match"
end
