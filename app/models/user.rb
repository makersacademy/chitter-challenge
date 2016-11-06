require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,                   Serial
  property :name,                 String
  property :email,                String, unique: true, format: :email_address, message: 'This email is already taken'
  property :username,             String, unique: true, message: 'This username is already taken'
  property :password_digest,      Text

  has n, :peeps

  attr_reader :password
  attr_accessor :password_confirmation


  validates_uniqueness_of :email
  validates_uniqueness_of :username
  validates_confirmation_of :password, message: "Sorry, your passwords don't match"

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
