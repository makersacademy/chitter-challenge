require 'bcrypt'
class User
  include DataMapper::Resource
  include BCrypt

  attr_accessor :password_confirmation
  attr_reader :password

  property :id, Serial
  property :name, String
  property :email, String, format: :email_address
  property :password_hash, Text

  validates_confirmation_of :password

  has n, :peeps

  def password=(password)
    @password = Password.create(password)
    self.password_hash = @password
  end
end
