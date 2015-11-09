require 'bcrypt'

class User
  include DataMapper::Resource
  attr_accessor :password_confirmation

  property :id,        Serial
  property :username,  String, unique: true, required: true
  property :email,     String, unique: true, format: :email_address, required: true
  property :name,      String, required: true
  property :password,  BCryptHash, required: true

  has n, :peeps

  validates_confirmation_of :password
  # validates_length_of :password_confirmation, min: 6

  def self.first_name(id)
    User.get(id) ? User.get(id).name.split(' ').first : nil
  end

  def self.authenticate(email_or_username, password)
    user = User.first(email: email_or_username) || User.first(username: email_or_username)
    user && user.password == password ? user : nil
  end

end