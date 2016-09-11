require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String, unique: true, required: true
  property :email, String, required: true, unique: true
  property :name, String
  property :password_digest, Text, required: true
  attr_accessor :password_confirmation
  attr_reader :password

  def password=(password) #writer method
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  validates_format_of :email, as: :email_address

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

  validates_confirmation_of :password

end
