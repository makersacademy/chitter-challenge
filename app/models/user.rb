require 'bcrypt'
require 'dm-validations'


class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :email, String, format: :email_address, required: true, unique: true
  property :password_hash, Text
  property :name, String, required: true
  property :username, String, required: true, unique: true

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_hash = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = User.first(username: username)
    if user && BCrypt::Password.new(user.password_hash) == password
      user
    else
      nil
    end
  end

end
