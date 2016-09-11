require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :name, String
  property :handle, String, unique: true
  property :email, String, unique: true
  property :password, BCryptHash

  attr_accessor :password_confirmation
  attr_reader :password

  validates_confirmation_of :password, required: true

  def self.authenticate(email, password)
  end

end
