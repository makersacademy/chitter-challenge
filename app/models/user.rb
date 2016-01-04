require 'bcrypt'
require 'dm-validations'


class User
  include DataMapper::Resource
  include BCrypt


  property :id,    Serial
  property :name,  String
  property :username, String, required: true, unique: true,
  message:'Username invalid'
  property :email,  String, required: true, unique: true,
  message: "Email address invalid"
  property :password , Text
  attr_accessor :password_confirmation
  validates_confirmation_of :password,
  message: "Password does not match confirmation"
  validates_format_of :email, as: :email_address


  def password_new
    @password_hashed ||= Password.new(password)
  end

  def password_new(new_password)
    @password_hashed = Password.create(new_password)
    self.password = @password_hashed
  end

  def self.authenticate(username, password_given)
    user = first(username: username)
    user && password_given == user.password ? user : nil
  end
end
