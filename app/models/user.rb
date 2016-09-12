require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'
require 'bcrypt'
require_relative  'peep'

class User

  attr_reader :password

  include DataMapper::Resource

  property :id,          Serial
  property :name,        String
  property :user_name,   String, :required => true, :unique => true
  property :email,       String, :required => true, :unique => true
  property :password_digest,    Text

  has n, :peeps, through: Resource

  validates_format_of :email, as: :email_address

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(:email => email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
