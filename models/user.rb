require 'bcrypt'

class User

  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  property :id, Serial
  property :name, String,
           required: true
  property :email, String,
           format: :email_address,
           required: true,
           unique: true
  property :password_digest, String, length: 60
  validates_confirmation_of :password

  def password=password
    @password = password
    self.password_digest = BCrypt::Password.create password
  end

  def self.authenticate email, pass
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == pass
      user
    else
      nil
    end
  end

end
