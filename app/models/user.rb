require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'
require 'bcrypt'

class User

  include BCrypt
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :email, String, required: true, unique: true
  property :password, BCryptHash

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address

  attr_accessor :password_confirmation

  def self.authenticate(email, password)
    user = first(:email => email)
    if user && BCrypt::Password.new(user.password) == password
      user
    else
      nil
    end
  end

end
