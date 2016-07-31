require 'bcrypt'
require 'dm-validations'
class User
  include DataMapper::Resource
  property :id,                  Serial
  property :email,               String, required: true, unique: true
  property :user_name,           String, required: true, unique: true
  property :password_encrypted,  String, length: 60

  attr_reader :password
  attr_accessor :password_confirmation

  validates_presence_of :email, :user_name
  validates_format_of :email, as: :email_address
  validates_confirmation_of :password, confirm: :password_confirmation

  def password=(password)
    @password = password
    self.password_encrypted = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_encrypted) == password
      user
    else
      nil
    end
  end

end
