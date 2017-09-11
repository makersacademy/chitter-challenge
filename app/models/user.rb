require 'bcrypt'
require_relative './peep'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  property :id,              Serial
  property :name,            String
  property :username,        String, required: true, unique: true
  property :email,           String, required: true, unique: true
  property :password_digest, Text

  validates_format_of :email, :as => :email_address

  has n, :peeps

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
