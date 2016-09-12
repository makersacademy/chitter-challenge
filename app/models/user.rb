require_relative '../data_mapper_setup'
require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  has n, :peeps

  property :id,       Serial
  property :name,     String, required: true
  property :username, String, required: true, unique: true
  property :email,    String, required: true, format: :email_address, unique: true,
                  :messages => {
                    :presence  => "Please fill in a valid email address",
                    :format    => "Invalid email address",
                    :is_unique => "Email address already registered"              }
  property :password_digest, Text, required: true

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password,
                  :message => "Password and confirmation password do not match"

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = User.first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end
