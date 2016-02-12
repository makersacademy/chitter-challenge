require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  property :id,               Serial
  property :name,             String
  property :username,         String
  property :password_digest,  Text
  property :email,            String,
            :required =>      true,
            :unique   =>      true,
            :format   =>      :email_address

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
