require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,                 Serial
  property :email,              String,   required: true,   unique: true, format: :email_address
  property :name,               String,   required: true
  property :nickname,           String
  property :password_digest,    Text

  validates_presence_of :email
  validates_format_of :email, as: :email_address

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
