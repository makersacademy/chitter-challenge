require 'bcrypt'
class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :username, String, required: true
  property :email, String, format: :email_address, required: true
  property :password_digest, Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  has n, :peeps

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end


end
