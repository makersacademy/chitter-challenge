require 'bcrypt'
require 'data_mapper'
require 'dm-postgres-adapter'

class User

  include DataMapper::Resource

  attr_accessor :password_confirmation
  attr_reader :password

  property :id, Serial
  property :username, String, :required => true, :unique => true
  property :email, String, :required => true, :unique => true
  property :name, String
  property :password_digest, Text

  validates_confirmation_of :password
  validates_format_of :email, :as => :email_address

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    user if user && BCrypt::Password.new(user.password_digest) == password
  end

end
