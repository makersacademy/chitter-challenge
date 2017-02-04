
require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address

  property :id,              Serial
  property :email,           String,  format: :email_address, required: true, unique: true
  property :password_digest, Text,    required: true
  property :user_name,       String,  required: true, unique: true
  property :name,            String,  required: true

  has n, :peeps #through: Resource

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
