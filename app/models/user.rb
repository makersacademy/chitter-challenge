require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt
  attr_reader :password, :email
  attr_accessor :password_confirmation

  property :id, Serial
  property :name, String
  property :email, String
  property :username, String
  property :password_hash, String, length: 60

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address
  property :email, String, required: true, unique: true

  def password=(new_password)
    @password = new_password
    self.password_hash = Password.create(new_password)
  end

  def self.authenticate(email, password)
    first(email: email)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_hash) == password
      user
    else
      nil
    end
  end

end
