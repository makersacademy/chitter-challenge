
require_relative 'data_mapper_setup.rb'

require 'bcrypt'

class User
  include DataMapper::Resource
  attr_accessor :password_confirmation
  attr_reader :password

  property :id, Serial
  property :name, String, required: true
  property :email, String, required: true, unique: true
  property :username, String, required: true, unique: true
  property :password_secret, Text

  validates_confirmation_of :password_secret, :confirm => :password_confirmation


  def password=(password)
    @password = password
    self.password_secret = BCrypt::Password.create(password)
  end


  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_secret) == password
      user
    else
      nil
    end
  end

end
