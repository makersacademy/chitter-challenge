require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  attr_accessor :password_confirmation
  attr_reader :password

    property :id, Serial
    property :first_name, String
    property :last_name, String
    property :username, String, required: true, unique: true
    property :email, String, format: :email_address,  required: true, unique: true
    property :password_digest, Text
    validates_confirmation_of :password

  def self.authenticate(email,password)
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