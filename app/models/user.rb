require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  attr_reader :password
  attr_accessor :password_confirmation

  property :id,               Serial
  property :name,             String
  property :user_name,        String
  property :email,            String, :required => true, :format => :email_address, :unique => true
  property :password_digest,  Text

  validates_presence_of :email
  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
