require './app/data_mapper_setup'
require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password
  validates_presence_of :email
  validates_format_of :email, as: :email_address

  property    :id, Serial
  property    :name, String
  property    :user_name, String, required: true, unique: true
  property    :email, String, required: true, unique: true
  property    :password_digest, Text

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
