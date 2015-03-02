require 'bcrypt'
class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String,:unique => true
  property :password_digest, Text, :required => true, :message => "You must enter a password"
  property :password_confirmation, Text, :required => true, :message => "You must enter a password confirmation"
  property :name, String, :required => true
  property :username, String,:unique => true

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_uniqueness_of :email

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = User.first(:email => email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
