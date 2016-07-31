require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  attr_reader :password
  validates_format_of :email, as: :email_address

  property :id,              Serial
  property :email,           String, required: true, unique: true, format: :email_address,
    :messages => {
      :presence => "Check yawh email box!",
      :is_unique => "That email is already in use.",
      :format => "Whoa there cowboy!! That aint no email"
    }
  property :full_name,       String, required: true
  property :username,        String, required: true, unique: true, messages: {is_unique: "SOZ, you ain't original"}
  property :password_digest, String, length: 60

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
