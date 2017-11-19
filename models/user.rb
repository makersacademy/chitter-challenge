# User class
class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :email
  validates_format_of :email, as: :email_address

  property :id,              Serial
  property :name,            String
  property :email,           String, required: true, unique: true
  property :username,        String
  property :password_digest, Text
  has n,   :peeps

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, passwor)
    user = first(email: email)
    return user if user && BCrypt::Password.new(user.password_digest) == passwor
    nil
  end
end
