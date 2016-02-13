require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  property :id,                 Serial
  property :username,           String, unique: true
  property :real_name,          String
  property :email,              String,
                                format: :email_address,
                                unique: true
  property :password_digest,    Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  attr_accessor :password_confirmation
  validates_confirmation_of :password
  validates_presence_of :email

  def self.authenticate(email, password)
    user = first(email: email)
    if user
      real_password = BCrypt::Password.new(user.password_digest)
      real_password == password ? user : nil
    else
      nil
    end
  end

  private

  attr_reader :password

end
