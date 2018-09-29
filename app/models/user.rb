require 'bcrypt'
require_relative './peep'
class User

  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :username, String, unique: true
  property :email, String, unique: true, required: true
  property :password_digest, Text
  has n, :peeps

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address

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
