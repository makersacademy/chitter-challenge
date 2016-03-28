require 'bcrypt'
class User
  include DataMapper::Resource
  include BCrypt

  attr_accessor :password_confirmation
  attr_reader :password

  property :id, Serial
  property :name, String, required: true
  property :username, String, required: true, unique: true
  property :email, String, format: :email_address, required: true, unique: true
  property :password_hash, Text

  validates_confirmation_of :password

  has n, :peeps

  def password=(password)
    @password = Password.create(password)
    self.password_hash = @password
  end

  def self.authenticate(username_or_email,attempted_password)
    user = User.first(username: username_or_email) || User.first(email: username_or_email)
    return user if user && BCrypt::Password.new(user.password_hash) == attempted_password
  end
end
