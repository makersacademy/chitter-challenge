require 'bcrypt'
class User
  include DataMapper::Resource


  property :id, Serial
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, Text
  property :name, String
  property :user_name, String

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
