require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :email, String, required: true, unique: true
  property :username, String, required: true, unique: true
  property :password_digest, Text

  validates_format_of :email, as: :email_address
  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
    nil
  end

  def password_confirmation=(password_confirmation)
    @password_confirmation = password_confirmation
    nil
  end

  def self.authenticate(email_or_username, password)
    user = first(email: email_or_username) || first(username: email_or_username)
    user && BCrypt::Password.new(user.password_digest) == password ? user : nil
  end

  private

  attr_reader :password, :password_confirmation
end
