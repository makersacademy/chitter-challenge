require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :email, String, required: true, format: :email_address, unique: true, messages: {is_unique: "Email address already in use!"}
  property :username, String, required: true, unique: true, messages: {is_unique: "Sorry that username is already in use :("}
  property :first_name, String
  property :last_name, String
  property :password_hash, Text, required: true

  has n, :peeps

  attr_reader :password
  attr_accessor :password_confirm

  validates_confirmation_of :password, confirm: :password_confirm 

  def password=(password)
    @password = password
    self.password_hash = Password.create(password) unless password.empty?
  end

  def authenticate(password)
    Password.new(password_hash) == password
  end
end
