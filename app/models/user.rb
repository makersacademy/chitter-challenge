require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'
require 'bcrypt'

class User

  include DataMapper::Resource

  property :id,          Serial
  property :name,        String
  property :user_name,   String, :required => true
  property :email,       String, :required => true, :unique => true
  property :password,    BCryptHash

  validates_format_of :email, as: :email_address

  def self.authenticate(email, password)
    user = first(:email => email)
    if user && BCrypt::Password.new(user.password) == password
      user
    else
      nil
    end
  end

end
